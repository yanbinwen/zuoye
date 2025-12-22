package com.ruoyi.wms.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.wms.domain.bo.CryptoPriceInfoBo;
import com.ruoyi.wms.domain.entity.CryptoPriceInfo;
import com.ruoyi.wms.mapper.CryptoPriceInfoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Dify API调用服务类
 *
 * @author ruoyi
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class CryptoDifyService {

    private final RestTemplate restTemplate;
    private final CryptoPriceInfoMapper cryptoPriceInfoMapper;
    private final ObjectMapper objectMapper;

    // Dify API相关配置
     @Value("${dify.api.url}")
     private String difyApiUrl;

    @Value("${dify.api.key}")
    private String difyApiKey;

    /**
     * 调用Dify API获取虚拟货币数据并存储到数据库
     */
    @Transactional
    public void fetchAndSaveCryptoData() throws Exception {
        log.info("开始调用Dify API获取虚拟货币数据");

        try {
            // 构建请求头
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setBearerAuth(difyApiKey);

            // 构建请求参数
            Map<String, Object> requestBody = new HashMap<>();
            Map<String, Object> inputs = new HashMap<>();
            // 添加必要的url1参数
            inputs.put("url1", "https://www.tradingkey.com/zh-hans/markets/cryptocurrencies"); // 添加url1参数供Dify API使用
            inputs.put("number", "30"); // 添加Dify API所需的number参数
            
            requestBody.put("inputs", inputs);
            requestBody.put("query", "根据提供的网址爬取对应数据");
            requestBody.put("response_mode", "blocking");
            requestBody.put("user", "abc-123");

            // 包装请求头和请求体
            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

            // 调用Dify API，设置超时重试
            int retryCount = 3;
            int currentRetry = 0;
            JsonNode response = null;
            
            while (currentRetry < retryCount) {
                try {
                    response = restTemplate.postForObject(difyApiUrl, requestEntity, JsonNode.class);
                    break; // 调用成功，跳出循环
                } catch (Exception e) {
                    currentRetry++;
                    log.warn("调用Dify API失败，正在重试第{}次...", currentRetry, e);
                    Thread.sleep(5000); // 等待5秒后重试
                }
            }
            log.info("Dify API调用成功，响应数据：{}", response);

            // 解析响应数据
            if (response != null) {
                // 从response节点下直接获取answer字段
                String answer = response.path("answer").asText();
                if (answer != null && !answer.isEmpty()) {
                    // 清理answer中的Markdown代码块包装
                    String cleanAnswer = answer;
                    // 移除可能的前后引号（如果存在）
                    if (cleanAnswer.startsWith("\"")) {
                        cleanAnswer = cleanAnswer.substring(1);
                    }
                    if (cleanAnswer.endsWith("\"")) {
                        cleanAnswer = cleanAnswer.substring(0, cleanAnswer.length() - 1);
                    }
                    if (cleanAnswer.startsWith("```json")) {
                        cleanAnswer = cleanAnswer.substring(7); // 移除开头的```json
                        if (cleanAnswer.endsWith("```")) {
                            cleanAnswer = cleanAnswer.substring(0, cleanAnswer.length() - 3); // 移除结尾的```
                        }
                        cleanAnswer = cleanAnswer.trim(); // 清理前后空格和换行
                    } else if (cleanAnswer.startsWith("```")) {
                        // 处理其他语言标记或无语言标记的情况
                        int endOfMarkdownTag = cleanAnswer.indexOf('\n');
                        if (endOfMarkdownTag > 0) {
                            cleanAnswer = cleanAnswer.substring(endOfMarkdownTag + 1);
                            if (cleanAnswer.endsWith("```")) {
                                cleanAnswer = cleanAnswer.substring(0, cleanAnswer.length() - 3);
                                cleanAnswer = cleanAnswer.trim();
                            }
                        }
                    }
                    // 解析清理后的JSON数据
                    log.info("清理后的JSON字符串: {}", cleanAnswer);
                    JsonNode cryptoDataJson = objectMapper.readTree(cleanAnswer);
                    log.info("解析后的JSON结构: {}", cryptoDataJson.toString());
                    
                    // 保存所有rank1到rank30的数据
                saveCryptoDataToDB(cryptoDataJson);
                } else {
                    log.error("Dify API响应中缺少answer字段或answer为空");
                }
            } else {
                log.error("Dify API响应为空");
            }
        } catch (Exception e) {
            log.error("调用Dify API获取虚拟货币数据失败：", e);
        }

        log.info("Dify API获取虚拟货币数据完成");
    }

    /**
     * 将虚拟货币数据保存到数据库
     *
     * @param cryptoDataJson 包含所有rank数据的JSON对象
     */
    private void saveCryptoDataToDB(JsonNode cryptoDataJson) {
        log.info("开始保存虚拟货币数据到数据库");

        try {
            // 先删除所有旧数据
            cryptoPriceInfoMapper.delete(null);

            // 批量保存新数据
            List<CryptoPriceInfo> cryptoList = new ArrayList<>();

            // 统一解析数据源：支持根节点为数组或对象含cryptocurrency_data
            JsonNode dataArray = null;
            if (cryptoDataJson != null) {
                if (cryptoDataJson.isArray()) {
                    dataArray = cryptoDataJson;
                } else if (cryptoDataJson.has("cryptocurrency_data") && cryptoDataJson.get("cryptocurrency_data").isArray()) {
                    dataArray = cryptoDataJson.get("cryptocurrency_data");
                }
            }

            if (dataArray == null) {
                log.warn("未找到有效的加密货币数据数组（根为数组或包含cryptocurrency_data）");
            } else {
                log.info("获取到的加密货币数据数量：{}", dataArray.size());
                if (dataArray.isEmpty()) {
                    log.warn("获取到的加密货币数据数组为空，无需保存");
                    return;
                }

                for (JsonNode cryptoData : dataArray) {
                    try {
                        // 验证必要字段是否存在
                        if (!cryptoData.has("name") || !cryptoData.has("symbol") ||
                            !cryptoData.has("price") ||
                            !(cryptoData.has("change") || cryptoData.has("change_amount") || cryptoData.has("change amount")) ||
                            !(cryptoData.has("change_percent") || cryptoData.has("change_percentage") || cryptoData.has("change percentage"))) {
                            log.warn("虚拟货币数据缺少必要字段：{}", cryptoData);
                            continue;
                        }

                        CryptoPriceInfo cryptoPriceInfo = new CryptoPriceInfo();

                        // 解析字段（注意Dify返回的字段名差异）
                        if (cryptoData.has("rank")) {
                            cryptoPriceInfo.setRank(cryptoData.get("rank").asInt());
                        }
                        cryptoPriceInfo.setName(cryptoData.get("name").asText());
                        cryptoPriceInfo.setSymbol(cryptoData.get("symbol").asText());
                        cryptoPriceInfo.setPrice(new BigDecimal(cryptoData.get("price").asText()));

                        // 处理不同可能的change字段名
                        String changeStr;
                        if (cryptoData.has("change")) {
                            changeStr = cryptoData.get("change").asText();
                        } else if (cryptoData.has("change_amount")) {
                            changeStr = cryptoData.get("change_amount").asText();
                        } else {
                            changeStr = cryptoData.get("change amount").asText();
                        }
                        changeStr = changeStr.replace("+", "");
                        BigDecimal change = new BigDecimal(changeStr);
                        cryptoPriceInfo.setChange(change);

                        // 处理不同可能的change_percent字段名
                        String changePercentStr;
                        if (cryptoData.has("change_percent")) {
                            changePercentStr = cryptoData.get("change_percent").asText();
                        } else if (cryptoData.has("change_percentage")) {
                            changePercentStr = cryptoData.get("change_percentage").asText();
                        } else {
                            changePercentStr = cryptoData.get("change percentage").asText();
                        }
                        changePercentStr = changePercentStr.replace("+", "").replace("%", "");
                        BigDecimal changePercent = new BigDecimal(changePercentStr);
                        cryptoPriceInfo.setChangePercent(changePercent);

                        // 根据涨跌幅计算趋势
                        cryptoPriceInfo.setTrend(change.compareTo(BigDecimal.ZERO) > 0 ? "up" : "down");
                        cryptoPriceInfo.setDate(LocalDateTime.now());

                        cryptoList.add(cryptoPriceInfo);
                    } catch (Exception e) {
                        log.error("解析虚拟货币数据失败，数据: {}", cryptoData, e);
                        // 跳过无效数据，继续处理下一条
                    }
                }
            }

            // 批量插入数据库
            if (!cryptoList.isEmpty()) {
                cryptoPriceInfoMapper.insertBatch(cryptoList);
                log.info("虚拟货币数据保存成功，共{}条有效数据", cryptoList.size());
                // 验证数据库中的记录数量
                Long count = cryptoPriceInfoMapper.selectCount(null);
                log.info("数据库中当前虚拟货币数据数量：{}", count);
            } else {
                log.info("未找到有效虚拟货币数据");
            }
        } catch (Exception e) {
            log.error("保存虚拟货币数据到数据库失败：", e);
        }
    }
}
