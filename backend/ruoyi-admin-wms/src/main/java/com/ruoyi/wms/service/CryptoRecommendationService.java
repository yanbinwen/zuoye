package com.ruoyi.wms.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 虚拟货币推荐服务类
 *
 * @author ruoyi
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class CryptoRecommendationService {

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;

    // Dify API相关配置
    @Value("${dify.api.url}")
    private String difyApiUrl;

    // 使用新的API密钥
    @Value("${dify.api.recommendation-key:app-idQ44wnXiR022DzEFcbW54pG}")
    private String difyApiKey;

    /**
     * 推荐虚拟货币数据类
     */
    public static class RecommendedCoin {
        private String name;
        private String symbol;
        private BigDecimal price;
        private BigDecimal change;
        private BigDecimal change_percent; // 使用下划线命名法，与前端一致
        private Integer num;

        // getter and setter
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getSymbol() {
            return symbol;
        }

        public void setSymbol(String symbol) {
            this.symbol = symbol;
        }

        public BigDecimal getPrice() {
            return price;
        }

        public void setPrice(BigDecimal price) {
            this.price = price;
        }

        public BigDecimal getChange() {
            return change;
        }

        public void setChange(BigDecimal change) {
            this.change = change;
        }

        public BigDecimal getChange_percent() {
            return change_percent;
        }

        public void setChange_percent(BigDecimal change_percent) {
            this.change_percent = change_percent;
        }

        public Integer getNum() {
            return num;
        }

        public void setNum(Integer num) {
            this.num = num;
        }
    }

    /**
     * 调用Dify API获取虚拟货币推荐数据
     * @return 推荐的虚拟货币列表
     */
    public List<RecommendedCoin> getRecommendedCoins() {
        log.info("开始调用Dify API获取虚拟货币推荐数据");

        try {
            // 构建请求头
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setBearerAuth(difyApiKey);

            // 构建请求参数
            Map<String, Object> requestBody = new HashMap<>();
            Map<String, Object> inputs = new HashMap<>();
            // 添加必要的url1参数
            inputs.put("url1", "https://www.tradingkey.com/zh-hans/markets/cryptocurrencies");
            // 添加更明确的输入参数
            inputs.put("query", "请推荐5个值得购买的虚拟货币，并提供它们的名称、符号、价格、涨跌额和涨跌幅百分比");
            
            requestBody.put("inputs", inputs);
            requestBody.put("query", "请推荐几个值得购买的虚拟货币，并严格按照JSON格式返回数据，包含name、symbol、price、change、change_percent和num字段");
            requestBody.put("response_mode", "blocking");
            requestBody.put("user", "crypto-recommendation-user");

            // 包装请求头和请求体
            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

            // 调用Dify API，设置超时重试
            int retryCount = 3;
            int currentRetry = 0;
            JsonNode response = null;
            
            while (currentRetry < retryCount) {
                try {
                    // 设置请求超时时间
                    ((org.springframework.http.client.SimpleClientHttpRequestFactory)restTemplate.getRequestFactory()).setConnectTimeout(10000);
                    ((org.springframework.http.client.SimpleClientHttpRequestFactory)restTemplate.getRequestFactory()).setReadTimeout(30000);
                    
                    response = restTemplate.postForObject(difyApiUrl, requestEntity, JsonNode.class);
                    log.info("Dify API第{}次调用成功", currentRetry + 1);
                    break; // 调用成功，跳出循环
                } catch (Exception e) {
                    currentRetry++;
                    log.warn("调用Dify API获取推荐数据失败，正在重试第{}次...", currentRetry, e);
                    if (currentRetry >= retryCount) {
                        log.error("Dify API调用达到最大重试次数，使用默认推荐数据", e);
                        // 返回默认推荐数据
                        return getDefaultRecommendedCoins();
                    }
                    try {
                        Thread.sleep(5000); // 等待5秒后重试
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        log.error("重试等待被中断", ie);
                    }
                }
            }
            
            // 检查响应是否为空
            if (response == null) {
                log.error("Dify API响应为空，使用默认推荐数据");
                return getDefaultRecommendedCoins();
            }
            
            log.info("Dify API推荐数据调用成功，响应状态存在: {}", response.has("answer"));

            try {
                // 从response节点下直接获取answer字段
                String answer = response.path("answer").asText();
                if (answer == null || answer.isEmpty()) {
                    log.error("Dify API响应中缺少answer字段或answer为空，使用默认推荐数据");
                    return getDefaultRecommendedCoins();
                }
                
                log.info("Dify API返回的answer长度: {}", answer.length());
                log.info("Dify API返回的answer前50字符: {}", answer.substring(0, Math.min(answer.length(), 50)));
                
                // 清理answer中的Markdown代码块包装
                String cleanAnswer = answer;
                // 移除可能的前后引号（如果存在）
                if (cleanAnswer.startsWith("\"")) {
                    cleanAnswer = cleanAnswer.substring(1);
                }
                if (cleanAnswer.endsWith("\"")) {
                    cleanAnswer = cleanAnswer.substring(0, cleanAnswer.length() - 1);
                }
                
                // 处理多种格式的代码块
                if (cleanAnswer.startsWith("```json")) {
                    cleanAnswer = cleanAnswer.substring(7); // 移除开头的```json
                    if (cleanAnswer.endsWith("```")) {
                        cleanAnswer = cleanAnswer.substring(0, cleanAnswer.length() - 3); // 移除结尾的```
                    }
                } else if (cleanAnswer.startsWith("```")) {
                    // 处理其他语言标记或无语言标记的情况
                    int endOfMarkdownTag = cleanAnswer.indexOf('\n');
                    if (endOfMarkdownTag > 0) {
                        cleanAnswer = cleanAnswer.substring(endOfMarkdownTag + 1);
                        if (cleanAnswer.endsWith("```")) {
                            cleanAnswer = cleanAnswer.substring(0, cleanAnswer.length() - 3);
                        }
                    }
                }
                
                cleanAnswer = cleanAnswer.trim(); // 清理前后空格和换行
                
                // 验证清理后的JSON是否有效
                if (cleanAnswer.isEmpty()) {
                    log.error("清理后的推荐JSON字符串为空，使用默认推荐数据");
                    return getDefaultRecommendedCoins();
                }
                
                log.info("清理后的推荐JSON字符串前50字符: {}", cleanAnswer.substring(0, Math.min(cleanAnswer.length(), 50)));
                
                try {
                    // 解析JSON数据
                JsonNode recommendationData = objectMapper.readTree(cleanAnswer);
                log.info("解析后的推荐JSON结构有效");
                // 打印完整的推荐数据
                log.info("完整推荐数据JSON: {}", recommendationData.toString());
                    
                    // 提取推荐的虚拟货币列表
                    List<RecommendedCoin> coins = parseRecommendedCoins(recommendationData);
                    if (coins.isEmpty()) {
                        log.warn("解析后未获取到有效推荐货币数据，使用默认推荐数据");
                        return getDefaultRecommendedCoins();
                    }
                    return coins;
                } catch (Exception e) {
                    log.error("解析推荐JSON数据失败，使用默认推荐数据: {}", e.getMessage());
                    return getDefaultRecommendedCoins();
                }
            } catch (Exception e) {
                log.error("处理Dify API响应数据失败: {}", e.getMessage());
                return getDefaultRecommendedCoins();
            }
        } catch (Exception e) {
            log.error("调用Dify API获取虚拟货币推荐数据发生未预期异常: {}", e.getMessage());
            // 返回默认推荐数据
            return getDefaultRecommendedCoins();
        }
    }
    
    /**
     * 获取默认的推荐虚拟货币数据（当API调用失败时使用）
     * @return 默认推荐的虚拟货币列表
     */
    private List<RecommendedCoin> getDefaultRecommendedCoins() {
        log.info("返回默认推荐虚拟货币数据");
        List<RecommendedCoin> defaultCoins = new ArrayList<>();
        
        // 预设几个主流虚拟货币作为默认推荐
        RecommendedCoin bitcoin = new RecommendedCoin();
        bitcoin.setName("Bitcoin");
        bitcoin.setSymbol("BTC");
        bitcoin.setPrice(new BigDecimal(68500));
        bitcoin.setChange(new BigDecimal(1200));
        bitcoin.setChange_percent(new BigDecimal(1.8));
        bitcoin.setNum(1);
        
        RecommendedCoin ethereum = new RecommendedCoin();
        ethereum.setName("Ethereum");
        ethereum.setSymbol("ETH");
        ethereum.setPrice(new BigDecimal(3500));
        ethereum.setChange(new BigDecimal(50));
        ethereum.setChange_percent(new BigDecimal(1.5));
        ethereum.setNum(2);
        
        RecommendedCoin solana = new RecommendedCoin();
        solana.setName("Solana");
        solana.setSymbol("SOL");
        solana.setPrice(new BigDecimal(120));
        solana.setChange(new BigDecimal(5));
        solana.setChange_percent(new BigDecimal(4.3));
        solana.setNum(3);
        
        RecommendedCoin cardano = new RecommendedCoin();
        cardano.setName("Cardano");
        cardano.setSymbol("ADA");
        cardano.setPrice(new BigDecimal(0.55));
        cardano.setChange(new BigDecimal(0.02));
        cardano.setChange_percent(new BigDecimal(3.8));
        cardano.setNum(4);
        
        RecommendedCoin polkadot = new RecommendedCoin();
        polkadot.setName("Polkadot");
        polkadot.setSymbol("DOT");
        polkadot.setPrice(new BigDecimal(7.8));
        polkadot.setChange(new BigDecimal(0.3));
        polkadot.setChange_percent(new BigDecimal(4.0));
        polkadot.setNum(5);
        
        defaultCoins.add(bitcoin);
        defaultCoins.add(ethereum);
        defaultCoins.add(solana);
        defaultCoins.add(cardano);
        defaultCoins.add(polkadot);
        
        return defaultCoins;
    }

    /**
     * 解析推荐的虚拟货币数据
     * @param data 包含推荐数据的JSON对象
     * @return 推荐的虚拟货币列表
     */
    private List<RecommendedCoin> parseRecommendedCoins(JsonNode data) {
        List<RecommendedCoin> recommendedCoins = new ArrayList<>();
        
        try {
            // 打印传入的data节点内容
            log.info("parseRecommendedCoins方法接收到的数据: {}", data.toString());
            
            // 检查是否存在recommended_coins字段
            log.info("数据中是否包含recommended_coins: {}", data.has("recommended_coins"));
            
            // 获取recommended_coins数组
            if (data.has("recommended_coins") && data.get("recommended_coins").isArray()) {
                JsonNode coinsArray = data.get("recommended_coins");
                
                for (JsonNode coinNode : coinsArray) {
                    RecommendedCoin coin = new RecommendedCoin();
                    
                    // 打印当前coinNode的完整内容
                    log.info("当前解析的coinNode: {}", coinNode.toString());
                    
                    // 解析所需字段
                    if (coinNode.has("name")) {
                        String name = coinNode.get("name").asText();
                        coin.setName(name);
                        log.info("解析name字段: {}", name);
                    }
                    if (coinNode.has("symbol")) {
                        String symbol = coinNode.get("symbol").asText();
                        coin.setSymbol(symbol);
                        log.info("解析symbol字段: {}", symbol);
                    }
                    // 为数值字段设置默认值，避免返回null
                    // 支持price和current_price两种字段名
                    if (coinNode.has("price")) {
                        BigDecimal price = coinNode.get("price").decimalValue();
                        coin.setPrice(price);
                        log.info("解析price字段: {}", price);
                    } else if (coinNode.has("current_price")) {
                        BigDecimal price = coinNode.get("current_price").decimalValue();
                        coin.setPrice(price);
                        log.info("解析current_price字段: {}", price);
                    } else {
                        coin.setPrice(BigDecimal.ZERO); // 默认价格为0
                        log.info("price和current_price字段都不存在，设置为默认值0");
                    }
                    // 支持change和price_change两种字段名
                    if (coinNode.has("change")) {
                        BigDecimal change = coinNode.get("change").decimalValue();
                        coin.setChange(change);
                        log.info("解析change字段: {}", change);
                    } else if (coinNode.has("price_change")) {
                        BigDecimal change = coinNode.get("price_change").decimalValue();
                        coin.setChange(change);
                        log.info("解析price_change字段: {}", change);
                    } else {
                        coin.setChange(BigDecimal.ZERO); // 默认涨跌幅为0
                        log.info("change和price_change字段都不存在，设置为默认值0");
                    }
                    // 支持change_percent、changePercent和price_change_percent三种字段名
                    if (coinNode.has("change_percent")) {
                        BigDecimal changePercent = coinNode.get("change_percent").decimalValue();
                        coin.setChange_percent(changePercent);
                        log.info("解析change_percent字段: {}", changePercent);
                    } else if (coinNode.has("changePercent")) {
                        BigDecimal changePercent = coinNode.get("changePercent").decimalValue();
                        coin.setChange_percent(changePercent);
                        log.info("解析changePercent字段: {}", changePercent);
                    } else if (coinNode.has("price_change_percent")) {
                        BigDecimal changePercent = coinNode.get("price_change_percent").decimalValue();
                        coin.setChange_percent(changePercent);
                        log.info("解析price_change_percent字段: {}", changePercent);
                    } else {
                        coin.setChange_percent(BigDecimal.ZERO); // 默认涨跌幅百分比为0
                        log.info("change_percent、changePercent和price_change_percent字段都不存在，设置为默认值0");
                    }
                    if (coinNode.has("num")) {
                        Integer num = coinNode.get("num").intValue();
                        coin.setNum(num);
                        log.info("解析num字段: {}", num);
                    } else {
                        coin.setNum(0); // 默认数量为0
                        log.info("num字段不存在，设置为默认值0");
                    }
                    
                    recommendedCoins.add(coin);
                }
            }
        } catch (Exception e) {
            log.error("解析推荐的虚拟货币数据失败：", e);
        }
        
        return recommendedCoins;
    }
}