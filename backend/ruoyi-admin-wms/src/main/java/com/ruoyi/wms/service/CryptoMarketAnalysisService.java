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
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * 加密货币市场分析服务
 * 用于从Dify API获取加密货币市场分析数据
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class CryptoMarketAnalysisService {

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;

    // Dify API相关配置
    @Value("${dify.api.url}")
    private String difyApiUrl;

    @Value("${dify.api.market-analysis-key}")
    private String difyApiKey;

    /**
     * 从Dify API获取加密货币市场分析数据
     * @return 包含summary字段的Map
     * @throws Exception API调用异常
     */
    public Map<String, Object> getMarketAnalysis() throws Exception {
        log.info("开始调用Dify API获取加密货币市场分析数据");

        try {
            // 构建请求头
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            // 添加Bearer认证头
            headers.setBearerAuth(difyApiKey);

            // 构建请求参数
            Map<String, Object> requestBody = new HashMap<>();
            Map<String, Object> inputs = new HashMap<>();
            // 添加必要的url1参数
            inputs.put("url1", "https://cn.investing.com/news/cryptocurrency-news");
            
            requestBody.put("inputs", inputs);
            requestBody.put("query", "请分析当前加密货币市场的整体趋势和最新动态，包括主要加密货币的价格走势、影响市场的关键因素以及未来短期市场展望。请提供一个全面且专业的市场分析摘要，重点关注投资者需要了解的重要信息。");
            requestBody.put("response_mode", "blocking");
            requestBody.put("user", "crypto-market-analysis-user");

            // 包装请求头和请求体
            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

            // 调用Dify API，设置超时重试
            int maxRetryCount = 3;
            int currentRetry = 0;
            long baseSleepTime = 5000; // 基础等待时间5秒
            
            // 优化超时设置
            ClientHttpRequestFactory requestFactory = restTemplate.getRequestFactory();
            if (requestFactory instanceof SimpleClientHttpRequestFactory) {
                SimpleClientHttpRequestFactory factory = (SimpleClientHttpRequestFactory) requestFactory;
                // 连接超时设置为30秒，读取超时设置为2分钟
                factory.setConnectTimeout(30000);
                factory.setReadTimeout(120000);
                log.debug("已配置请求超时: 连接超时30000ms, 读取超时120000ms");
            }
            
            log.info("准备调用Dify API: {}, API密钥前8位: {}", difyApiUrl, difyApiKey.substring(0, 8) + "...");
            
            JsonNode response = null;
            while (currentRetry < maxRetryCount) {
                try {
                    long startTime = System.currentTimeMillis();
                    response = restTemplate.postForObject(difyApiUrl, requestEntity, JsonNode.class);
                    long endTime = System.currentTimeMillis();
                    
                    log.info("Dify API第{}次调用成功，耗时{}ms", currentRetry + 1, (endTime - startTime));
                    log.info("Dify API原始响应完整数据: {}", response != null ? response.toString() : "null");
                    break; // 调用成功，跳出循环
                } catch (ResourceAccessException e) {
                    // 处理连接和超时异常
                    currentRetry++;
                    String errorMessage = e.getMessage() != null ? e.getMessage() : "未知错误";
                    log.error("Dify API连接异常(第{}次尝试): {}", currentRetry, errorMessage);
                    
                    if (currentRetry >= maxRetryCount) {
                        log.error("Dify API调用达到最大重试次数({}次)，最后一次错误: {}", maxRetryCount, errorMessage);
                        throw new Exception("获取加密货币市场分析数据失败：连接超时或API服务不可用，请稍后重试");
                    }
                    
                    // 使用指数退避策略
                    long sleepTime = baseSleepTime * (long) Math.pow(2, currentRetry - 1);
                    log.info("等待{}ms后进行第{}次重试", sleepTime, currentRetry + 1);
                    
                    try {
                        Thread.sleep(sleepTime);
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        log.error("重试等待被中断", ie);
                    }
                } catch (Exception e) {
                    // 处理其他异常
                    currentRetry++;
                    log.warn("调用Dify API获取市场分析数据失败，正在重试第{}次: {}", currentRetry, e.getMessage());
                    if (currentRetry >= maxRetryCount) {
                        log.error("Dify API调用达到最大重试次数", e);
                        throw new Exception("获取加密货币市场分析数据失败，请稍后重试");
                    }
                    
                    try {
                        Thread.sleep(baseSleepTime);
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        log.error("重试等待被中断", ie);
                    }
                }
            }
            
            // 检查响应是否为空
            if (response == null) {
                log.error("Dify API响应为空");
                throw new Exception("获取加密货币市场分析数据失败，响应为空");
            }
            
            // 从response节点下直接获取answer字段
            String answer = response.path("answer").asText();
            if (answer == null || answer.isEmpty()) {
                log.error("Dify API响应中缺少answer字段或answer为空");
                throw new Exception("获取加密货币市场分析数据失败，响应中缺少answer字段");
            }
            
            log.info("Dify API返回的answer长度: {}", answer.length());
            log.info("Dify API返回的answer前100字符: {}", answer.substring(0, Math.min(answer.length(), 100)));
            log.info("Dify API返回的完整answer内容: {}", answer);
            
            // 构建返回数据结构
            Map<String, Object> result = new HashMap<>();
            
            // 检查是否能解析为JSON
            try {
                JsonNode analysisData = objectMapper.readTree(answer);
                // 如果是有效的JSON对象，尝试从中提取summary字段
                if (analysisData.has("summary")) {
                    result.put("summary", analysisData.get("summary").asText());
                    log.info("从JSON响应中提取到summary字段");
                } else {
                    // 如果没有summary字段，直接使用整个answer作为summary
                    result.put("summary", answer);
                    log.info("响应中没有summary字段，使用完整answer作为summary");
                }
            } catch (Exception e) {
                // 如果不是有效的JSON，直接使用整个answer作为summary
                log.warn("解析JSON失败，使用原始文本作为summary: {}", e.getMessage());
                result.put("summary", answer);
            }
            
            return result;
        } catch (Exception e) {
            log.error("获取加密货币市场分析数据失败", e);
            throw e;
        }
    }
}