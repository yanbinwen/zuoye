package com.ruoyi.wms.service;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.CryptoNewsBo;
import com.ruoyi.wms.domain.entity.CryptoNews;
import com.ruoyi.wms.domain.vo.CryptoNewsVo;
import com.ruoyi.wms.mapper.CryptoNewsMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 加密货币新闻数据Service业务层处理
 *
 * @author ruoyi
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class CryptoNewsService {

    private final CryptoNewsMapper cryptoNewsMapper;
    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;

    // Dify API相关配置
    @Value("${dify.api.url}")
    private String difyApiUrl;

    @Value("${dify.api.news-key:app-o0sVWjMFrzS5tyDzaewafxXD}")
    private String difyApiKey;

    /**
     * 根据ID查询加密货币新闻（主键精准查询）
     */
    public CryptoNewsVo queryById(Long id) {
        CryptoNews cryptoNews = cryptoNewsMapper.selectById(id);
        return MapstructUtils.convert(cryptoNews, CryptoNewsVo.class);
    }
    
    /**
     * 从API响应中提取summary字段
     */
    private String extractSummaryFromResponse(JsonNode responseData) {
        try {
            // 尝试从不同可能的位置提取summary
            if (responseData.has("summary")) {
                return responseData.get("summary").asText();
            }
            
            // 尝试从content或其他常见字段中查找summary
            if (responseData.has("content")) {
                JsonNode contentObj = responseData.get("content");
                if (contentObj.isObject() && contentObj.has("summary")) {
                    return contentObj.get("summary").asText();
                }
            }
            
            // 尝试从news_analysis中提取
            if (responseData.has("news_analysis")) {
                JsonNode analysisObj = responseData.get("news_analysis");
                if (analysisObj.isObject() && analysisObj.has("summary")) {
                    return analysisObj.get("summary").asText();
                }
            }
            
            // 尝试从cryptocurrency_news_analysis中提取 (新增支持)
            if (responseData.has("cryptocurrency_news_analysis")) {
                JsonNode cryptoAnalysisObj = responseData.get("cryptocurrency_news_analysis");
                if (cryptoAnalysisObj.isObject() && cryptoAnalysisObj.has("summary")) {
                    log.info("从cryptocurrency_news_analysis中找到summary字段");
                    return cryptoAnalysisObj.get("summary").asText();
                }
            }
            
            log.info("未找到summary字段，返回默认文本");
            return "加密货币市场实时分析摘要将在此显示"; // 默认值
        } catch (Exception e) {
            log.error("提取summary字段失败", e);
            return "加密货币市场实时分析摘要将在此显示"; // 异常情况下的默认值
        }
    }

    /**
     * 查询加密货币新闻列表（分页查询）
     */
    public TableDataInfo<CryptoNewsVo> queryPageList(CryptoNewsBo bo, PageQuery pageQuery) {
        Map<String, Object> params = new HashMap<>();
        if (bo != null) {
            if (bo.getId() != null) params.put("id", bo.getId());
            if (bo.getTitle() != null) params.put("title", bo.getTitle());
            if (bo.getContent() != null) params.put("content", bo.getContent());
            if (bo.getCurrency() != null) params.put("currency", bo.getCurrency());
            if (bo.getTrend() != null) params.put("trend", bo.getTrend());
        }
        LambdaQueryWrapper<CryptoNews> lqw = buildQueryWrapper(params);
        Page<CryptoNews> page = cryptoNewsMapper.selectPage(pageQuery.build(), lqw);
        // 创建一个新的Page对象用于存储转换后的记录
        Page<CryptoNewsVo> result = new Page<>(page.getCurrent(), page.getSize(), page.getTotal());
        result.setRecords(page.getRecords().stream()
                .map(item -> MapstructUtils.convert(item, CryptoNewsVo.class))
                .collect(java.util.stream.Collectors.toList()));
        return TableDataInfo.build(result);
    }

    /**
     * 查询加密货币新闻列表（支持模糊查询）
     */
    public List<CryptoNewsVo> queryList(CryptoNewsBo bo) {
        Map<String, Object> params = new HashMap<>();
        if (bo != null) {
            if (bo.getId() != null) params.put("id", bo.getId());
            if (bo.getTitle() != null) params.put("title", bo.getTitle());
            if (bo.getContent() != null) params.put("content", bo.getContent());
            if (bo.getCurrency() != null) params.put("currency", bo.getCurrency());
            if (bo.getTrend() != null) params.put("trend", bo.getTrend());
        }
        LambdaQueryWrapper<CryptoNews> lqw = buildQueryWrapper(params);
        List<CryptoNews> list = cryptoNewsMapper.selectList(lqw);
        return list.stream()
                .map(item -> MapstructUtils.convert(item, CryptoNewsVo.class))
                .collect(java.util.stream.Collectors.toList());
    }

    /**
     * 构建查询条件
     */
    private LambdaQueryWrapper<CryptoNews> buildQueryWrapper(Map<String, Object> params) {
        LambdaQueryWrapper<CryptoNews> lqw = Wrappers.lambdaQuery();

        // 主键精准查询
        if (params.containsKey("id") && params.get("id") != null) {
            lqw.eq(CryptoNews::getId, params.get("id"));
        }

        // 标题模糊查询
        if (params.containsKey("title") && StrUtil.isNotBlank((String) params.get("title"))) {
            lqw.like(CryptoNews::getTitle, params.get("title"));
        }

        // 内容模糊查询
        if (params.containsKey("content") && StrUtil.isNotBlank((String) params.get("content"))) {
            lqw.like(CryptoNews::getContent, params.get("content"));
        }

        // 加密货币名称模糊查询
        if (params.containsKey("currency") && StrUtil.isNotBlank((String) params.get("currency"))) {
            lqw.like(CryptoNews::getCurrency, params.get("currency"));
        }

        // 价格趋势精准查询
        if (params.containsKey("trend") && StrUtil.isNotBlank((String) params.get("trend"))) {
            lqw.eq(CryptoNews::getTrend, params.get("trend"));
        }

        // 按创建时间倒序
        lqw.orderByDesc(CryptoNews::getCreatedAt);

        return lqw;
    }

    /**
     * 新增加密货币新闻
     */
    public int insert(CryptoNews cryptoNews) {
        return cryptoNewsMapper.insert(cryptoNews);
    }

    /**
     * 通过Bo新增加密货币新闻
     */
    public int insertByBo(CryptoNewsBo bo) {
        CryptoNews cryptoNews = MapstructUtils.convert(bo, CryptoNews.class);
        return insert(cryptoNews);
    }

    /**
     * 修改加密货币新闻
     */
    public int update(CryptoNews cryptoNews) {
        return cryptoNewsMapper.updateById(cryptoNews);
    }

    /**
     * 通过Bo修改加密货币新闻
     */
    public int updateByBo(CryptoNewsBo bo) {
        CryptoNews cryptoNews = MapstructUtils.convert(bo, CryptoNews.class);
        return update(cryptoNews);
    }

    /**
     * 批量删除加密货币新闻
     */
    public int deleteByIds(Collection<Long> ids) {
        return cryptoNewsMapper.deleteBatchIds(ids);
    }

    /**
     * 删除加密货币新闻
     */
    public int deleteById(Long id) {
        return cryptoNewsMapper.deleteById(id);
    }

    /**
     * 调用Dify API获取加密货币新闻数据并存储到数据库
     */
    @Transactional
    public Map<String, Object> fetchAndSaveCryptoNewsData() throws Exception {
        log.info("开始调用Dify API获取加密货币新闻数据");
        
        // 声明response变量在方法级别，使其在整个方法内可见
        JsonNode response = null;

        try {
            // 构建请求头
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setBearerAuth(difyApiKey);

            // 构建请求参数
            Map<String, Object> requestBody = new HashMap<>();
            Map<String, Object> inputs = new HashMap<>();
            // 添加必要的url1参数
            inputs.put("url1", "https://cn.investing.com/news/cryptocurrency-news");
            
            requestBody.put("inputs", inputs);
            requestBody.put("query", "请从提供的加密货币新闻网站爬取最新的加密货币相关新闻数据，包括标题(title)、内容(content)、加密货币名称(currency)、价格趋势(trend)和波动幅度描述(magnitude)等信息。请严格按照以下格式返回数据：[{\"title\":\"新闻标题\",\"content\":\"新闻内容\",\"currency\":\"加密货币名称\",\"trend\":\"上涨/下跌/持平\",\"magnitude\":\"波动幅度描述\"}]。请确保返回有效的JSON数组格式，不要包含其他无关文本。");
            requestBody.put("response_mode", "blocking");
            requestBody.put("user", "crypto-news-user");

            // 包装请求头和请求体
            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

            // 调用Dify API，设置超时重试
            int maxRetryCount = 3;
            int currentRetry = 0;
            long baseSleepTime = 5000; // 基础等待时间5秒
            
            // 优化超时设置，确保RequestFactory正确配置
            ClientHttpRequestFactory requestFactory = restTemplate.getRequestFactory();
            if (requestFactory instanceof SimpleClientHttpRequestFactory) {
                SimpleClientHttpRequestFactory factory = (SimpleClientHttpRequestFactory) requestFactory;
                // 连接超时设置为30秒，读取超时设置为2分钟
                factory.setConnectTimeout(30000);
                factory.setReadTimeout(120000);
                factory.setBufferRequestBody(true); // 启用请求体缓冲
                log.debug("已配置请求超时: 连接超时30000ms, 读取超时120000ms");
            } else {
                log.warn("无法设置超时，RequestFactory类型不支持: {}", requestFactory.getClass().getName());
            }
            
            log.info("准备调用Dify API: {}, API密钥前8位: {}", difyApiUrl, difyApiKey.substring(0, 8) + "...");
            
            while (currentRetry < maxRetryCount) {
                try {
                    long startTime = System.currentTimeMillis();
                    response = restTemplate.postForObject(difyApiUrl, requestEntity, JsonNode.class);
                    long endTime = System.currentTimeMillis();
                    
                    log.info("Dify API第{}次调用成功，耗时{}ms", currentRetry + 1, (endTime - startTime));
                    // 打印完整的Dify API原始响应数据（未加密）
                    log.info("Dify API原始响应完整数据: {}", response != null ? response.toString() : "null");
                    break; // 调用成功，跳出循环
                } catch (ResourceAccessException e) {
                    // 处理连接和超时异常
                    currentRetry++;
                    String errorMessage = e.getMessage() != null ? e.getMessage() : "未知错误";
                    log.error("Dify API连接异常(第{}次尝试): {}", currentRetry, errorMessage);
                    
                    if (errorMessage.contains("Connection timed out")) {
                        log.warn("连接超时可能是由于网络限制或API服务不可用，请检查网络连接和API服务状态");
                    } else if (errorMessage.contains("Connection refused")) {
                        log.warn("连接被拒绝，可能是API地址错误或服务未启动");
                    }
                    
                    if (currentRetry >= maxRetryCount) {
                        log.error("Dify API调用达到最大重试次数({}次)，最后一次错误: {}", maxRetryCount, errorMessage);
                        throw new Exception("获取加密货币新闻数据失败：连接超时或API服务不可用，请稍后重试");
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
                    log.warn("调用Dify API获取新闻数据失败，正在重试第{}次: {}", currentRetry, e.getMessage());
                    if (currentRetry >= maxRetryCount) {
                        log.error("Dify API调用达到最大重试次数", e);
                        throw new Exception("获取加密货币新闻数据失败，请稍后重试");
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
                throw new Exception("获取加密货币新闻数据失败，响应为空");
            }
            
            log.info("Dify API新闻数据调用成功，响应状态存在: {}", response.has("answer"));

            try {
                // 从response节点下直接获取answer字段
                String answer = response.path("answer").asText();
                if (answer == null || answer.isEmpty()) {
                    log.error("Dify API响应中缺少answer字段或answer为空");
                    throw new Exception("获取加密货币新闻数据失败，响应中缺少answer字段");
                }
                
                log.info("Dify API返回的answer长度: {}", answer.length());
                log.info("Dify API返回的answer前100字符: {}", answer.substring(0, Math.min(answer.length(), 100)));
                // 打印完整的answer内容（未加密），特别关注是否包含summary字段
                log.info("Dify API返回的完整answer内容: {}", answer);
                // 检查是否包含summary相关内容
                if (answer.contains("summary")) {
                    log.info("⚠️ 注意：answer中包含summary相关内容！");
                    // 尝试定位summary字段的位置
                    int summaryIndex = answer.indexOf("summary");
                    if (summaryIndex > -1) {
                        // 显示summary字段附近的内容，前后各100个字符
                        int start = Math.max(0, summaryIndex - 50);
                        int end = Math.min(answer.length(), summaryIndex + 150);
                        log.info("📊 summary字段上下文内容: {}", answer.substring(start, end));
                    }
                }
                if (answer.contains("cryptocurrency_news_analysis")) {
                    log.info("⚠️ 注意：answer中包含cryptocurrency_news_analysis相关内容！");
                    // 尝试定位cryptocurrency_news_analysis字段的位置
                    int analysisIndex = answer.indexOf("cryptocurrency_news_analysis");
                    if (analysisIndex > -1) {
                        // 显示cryptocurrency_news_analysis字段附近的内容，前后各100个字符
                        int start = Math.max(0, analysisIndex - 20);
                        int end = Math.min(answer.length(), analysisIndex + 200);
                        log.info("📊 cryptocurrency_news_analysis字段上下文内容: {}", answer.substring(start, end));
                    }
                }
                
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
                    log.error("清理后的新闻JSON字符串为空");
                    throw new Exception("获取加密货币新闻数据失败，返回数据为空");
                }
                
                log.info("清理后的新闻JSON字符串前50字符: {}", cleanAnswer.substring(0, Math.min(cleanAnswer.length(), 50)));
                // 打印完整的清理后JSON字符串
                log.info("清理后的完整JSON字符串: {}", cleanAnswer);
                
                try {
                    // 解析JSON数据
                    JsonNode newsData = objectMapper.readTree(cleanAnswer);
                    log.info("解析后的新闻JSON结构有效");
                    // 打印解析后的完整JSON结构
                    log.info("解析后的完整JSON结构: {}", newsData.toString());
                    
                    // 保存新闻数据到数据库
                    saveCryptoNewsToDB(newsData);
                } catch (Exception e) {
                    log.error("解析新闻JSON数据失败: {}", e.getMessage());
                    throw new Exception("解析加密货币新闻数据失败: " + e.getMessage());
                }
            } catch (Exception e) {
                log.error("处理Dify API响应数据失败: {}", e.getMessage());
                throw e;
            }
        } catch (Exception e) {
            log.error("调用Dify API获取加密货币新闻数据发生未预期异常: {}", e.getMessage());
            throw e;
        }

        List<CryptoNews> savedNewsList = new ArrayList<>();
            try {
                // 尝试从Dify API响应中提取summary和新闻数据
                if (response != null && response.has("answer")) {
                    String answer = response.path("answer").asText();
                    if (answer != null && !answer.isEmpty()) {
                        // 清理Markdown代码块格式
                        String cleanJson = cleanMarkdownCodeBlock(answer);
                        JsonNode summaryData = objectMapper.readTree(cleanJson);
                        // 保存数据到数据库并获取保存的新闻列表
                        savedNewsList = saveCryptoNewsToDB(summaryData);
                    }
                }
            } catch (Exception e) {
                log.error("处理新闻数据失败", e);
            }
        
        log.info("Dify API获取加密货币新闻数据完成，共保存 {} 条记录", savedNewsList.size());
        
        // 准备返回结果
        Map<String, Object> result = new HashMap<>();
        // 从响应中提取summary字段
        String summary = "加密货币市场实时分析摘要"; // 初始默认值
        
        try {
            if (response != null && response.has("answer")) {
                String answer = response.path("answer").asText();
                if (answer != null && !answer.isEmpty()) {
                    // 清理Markdown代码块格式
                    String cleanJson = cleanMarkdownCodeBlock(answer);
                    JsonNode summaryData = objectMapper.readTree(cleanJson);
                    summary = extractSummaryFromResponse(summaryData);
                }
            }
        } catch (Exception e) {
            log.error("提取summary失败", e);
        }
        
        // 准备返回结果
        result.put("summary", summary);
        result.put("newsList", savedNewsList);
        return result;
    }

    /**
     * 清理Markdown代码块格式
     * @param content 包含Markdown格式的内容
     * @return 清理后的纯JSON字符串
     */
    private String cleanMarkdownCodeBlock(String content) {
        if (content == null) {
            return "";
        }
        // 移除```json和```标记
        String clean = content.trim();
        if (clean.startsWith("```json")) {
            clean = clean.substring(7);
        } else if (clean.startsWith("```")) {
            clean = clean.substring(3);
        }
        if (clean.endsWith("```")) {
            clean = clean.substring(0, clean.length() - 3);
        }
        return clean.trim();
    }

    /**
     * 将加密货币新闻数据保存到数据库
     *
     * @param newsData 包含新闻数据的JSON对象
     */
    private List<CryptoNews> saveCryptoNewsToDB(JsonNode newsData) throws Exception {
        log.info("开始保存加密货币新闻数据到数据库");
        
        // 打印完整的原始数据结构用于调试
        log.info("原始数据完整结构: {}", newsData.toString());
        log.info("原始数据节点类型: {}", newsData.getNodeType());

        List<CryptoNews> savedNewsList = new ArrayList<>();
        try {
            // 直接插入新数据，保留现有数据
            // 批量保存新数据
            List<CryptoNews> newsList = new ArrayList<>();

            // 解析多种可能的数据结构
            JsonNode dataArray = null;
            
            // 1. 如果根节点就是数组，直接使用
            if (newsData.isArray()) {
                dataArray = newsData;
                log.info("根节点为数组格式的数据");
            }
            // 2. 尝试解析news_analysis.currency_predictions数组（根据当前日志显示的格式）
            else if (newsData.has("news_analysis") && newsData.get("news_analysis").isObject()) {
                JsonNode newsAnalysisNode = newsData.get("news_analysis");
                log.info("找到news_analysis对象，检查其中是否包含currency_predictions数组");
                
                // 优先检查news_analysis节点下是否有news_data数组
                if (newsAnalysisNode.has("news_data") && newsAnalysisNode.get("news_data").isArray()) {
                    dataArray = newsAnalysisNode.get("news_data");
                    log.info("从news_analysis对象的news_data字段获取到数组，长度: {}", dataArray.size());
                }
                // 然后检查currency_predictions数组（兼容旧格式）
                else if (newsAnalysisNode.has("currency_predictions") && newsAnalysisNode.get("currency_predictions").isArray()) {
                    dataArray = newsAnalysisNode.get("currency_predictions");
                    log.info("从news_analysis对象的currency_predictions字段获取到数组，长度: {}", dataArray.size());
                } else {
                    log.info("news_analysis节点结构: {}", newsAnalysisNode.toString());
                    // 遍历news_analysis节点的所有字段，寻找可能的数组字段
                    for (Iterator<Map.Entry<String, JsonNode>> it = newsAnalysisNode.fields(); it.hasNext();) {
                        Map.Entry<String, JsonNode> entry = it.next();
                        log.info("在news_analysis下找到字段: {}, 类型: {}", 
                                entry.getKey(), entry.getValue().getNodeType());
                        if (entry.getValue().isArray()) {
                            log.info("在news_analysis下找到数组字段: {}", entry.getKey());
                            // 验证该数组是否包含新闻条目结构
                            if (!entry.getValue().isEmpty()) {
                                log.info("数组第一个元素结构: {}", entry.getValue().get(0).toString());
                                // 更新验证逻辑，检查更多可能的新闻字段
                                if (entry.getValue().get(0).has("title") || entry.getValue().get(0).has("currency") || 
                                    entry.getValue().get(0).has("predicted_trend")) {
                                    dataArray = entry.getValue();
                                    log.info("确认该数组包含新闻数据结构");
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            // 3. 尝试解析news_data数组（新格式）
            else if (newsData.has("news_data") && newsData.get("news_data").isArray()) {
                dataArray = newsData.get("news_data");
                log.info("找到news_data数组格式的数据");
            }
            // 4. 尝试解析cryptocurrency_news_analysis结构（其他可能的格式）
            else if (newsData.has("cryptocurrency_news_analysis")) {
                JsonNode analysisNode = newsData.get("cryptocurrency_news_analysis");
                log.info("cryptocurrency_news_analysis节点结构: {}", analysisNode.toString());
                // 检查analysis节点下是否有news_data数组
                if (analysisNode.has("news_data") && analysisNode.get("news_data").isArray()) {
                    dataArray = analysisNode.get("news_data");
                    log.info("找到cryptocurrency_news_analysis下的news_data数组");
                }
                // 检查analysis节点下是否有其他可能的新闻数据数组
                else {
                    // 遍历analysis节点的所有字段，寻找可能的数组字段
                    for (Iterator<Map.Entry<String, JsonNode>> it = analysisNode.fields(); it.hasNext();) {
                        Map.Entry<String, JsonNode> entry = it.next();
                        log.info("在cryptocurrency_news_analysis下找到字段: {}, 类型: {}", 
                                entry.getKey(), entry.getValue().getNodeType());
                        if (entry.getValue().isArray()) {
                            log.info("在cryptocurrency_news_analysis下找到数组字段: {}", entry.getKey());
                            // 验证该数组是否包含新闻条目结构
                            if (!entry.getValue().isEmpty()) {
                                log.info("数组第一个元素结构: {}", entry.getValue().get(0).toString());
                                if (entry.getValue().get(0).has("title") || entry.getValue().get(0).has("currency")) {
                                    dataArray = entry.getValue();
                                    log.info("确认该数组包含新闻数据结构");
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            // 4. 尝试解析crypto_news_data数组（旧格式）
            else if (newsData.has("crypto_news_data") && newsData.get("crypto_news_data").isArray()) {
                dataArray = newsData.get("crypto_news_data");
                log.info("找到crypto_news_data数组格式的数据");
            }
            // 5. 尝试解析cryptocurrency_news数组（旧格式）
            else if (newsData.has("cryptocurrency_news") && newsData.get("cryptocurrency_news").isArray()) {
                dataArray = newsData.get("cryptocurrency_news");
                log.info("找到cryptocurrency_news数组格式的数据");
            }
            // 6. 遍历根节点的所有字段，寻找可能包含新闻数据的数组
            else if (newsData.isObject()) {
                log.info("开始遍历根节点的所有字段寻找新闻数据");
                for (Iterator<Map.Entry<String, JsonNode>> it = newsData.fields(); it.hasNext();) {
                    Map.Entry<String, JsonNode> entry = it.next();
                    log.info("在根节点下找到字段: {}, 类型: {}", entry.getKey(), entry.getValue().getNodeType());
                    
                    // 检查是否为数组
                    if (entry.getValue().isArray()) {
                        JsonNode arrayNode = entry.getValue();
                        log.info("找到数组字段: {}, 长度: {}", entry.getKey(), arrayNode.size());
                        
                        // 如果数组不为空，检查第一个元素是否可能是新闻数据
                        if (!arrayNode.isEmpty()) {
                            JsonNode firstElement = arrayNode.get(0);
                            log.info("数组第一个元素结构: {}", firstElement.toString());
                            
                            // 判断是否包含新闻相关字段
                            if (firstElement.has("title") || firstElement.has("content") || 
                                firstElement.has("currency") || firstElement.has("trend")) {
                                dataArray = arrayNode;
                                log.info("确认该数组包含新闻数据结构");
                                break;
                            }
                        }
                    }
                }
            }

            // 记录当前解析到的数据结构
            log.info("dataArray是否为空: {}", dataArray == null);
            if (dataArray != null) {
                log.info("获取到的加密货币新闻数据数组，长度：{}", dataArray.size());
                if (dataArray.isEmpty()) {
                    log.warn("获取到的加密货币新闻数据数组为空，无需保存");
                    return savedNewsList; // 返回空列表，符合方法返回类型要求
                }
                
                int processedCount = 0;
                int validCount = 0;
                
                for (JsonNode newsNode : dataArray) {
                    processedCount++;
                    
                    // 打印每条数据的完整结构用于调试
                    log.info("处理第{}条新闻数据: {}", processedCount, newsNode.toString());
                    
                    try {
                        // 提取所有可用字段用于调试
                        Set<String> fields = new HashSet<>();
                        if (newsNode.isObject()) {
                            for (Iterator<String> it = newsNode.fieldNames(); it.hasNext();) {
                                fields.add(it.next());
                            }
                        }
                        log.info("新闻数据可用字段: {}", fields);
                        
                        // 创建实体对象
                        CryptoNews cryptoNews = new CryptoNews();
                        
                        // 优先适配currency_predictions格式
                        String currency = "";
                        String title = "";
                        
                        // 1. 处理加密货币名称
                        if (newsNode.has("currency")) {
                            currency = newsNode.get("currency").asText();
                            log.info("从currency字段获取到加密货币名称: {}", currency);
                        } else if (newsNode.has("cryptocurrency")) {
                            currency = newsNode.get("cryptocurrency").asText();
                        } else if (newsNode.has("coin")) {
                            currency = newsNode.get("coin").asText();
                        } else {
                            // 如果没有明确的货币字段，设置为未知
                            currency = "未知加密货币";
                            log.warn("缺少加密货币名称字段，设置为未知");
                        }
                        
                        // 2. 处理标题 - 优先使用title字段
                        if (newsNode.has("title")) {
                            title = newsNode.get("title").asText();
                            log.info("从title字段获取标题: {}", title);
                        } else if (newsNode.has("predicted_trend")) {
                            // 从predicted_trend构建标题
                            String predictedTrend = newsNode.get("predicted_trend").asText();
                            title = currency + " 预测趋势: " + predictedTrend;
                            log.info("基于predicted_trend构建标题: {}", title);
                        } else if (newsNode.has("headline")) {
                            title = newsNode.get("headline").asText();
                        } else if (newsNode.has("topic")) {
                            title = newsNode.get("topic").asText();
                        } else {
                            log.warn("缺少标题相关字段，尝试使用其他字段");
                            // 如果完全没有标题相关字段，可以使用部分内容作为标题
                            if (newsNode.has("content") || newsNode.has("description") || newsNode.has("reasoning")) {
                                String text = "";
                                if (newsNode.has("reasoning")) {
                                    text = newsNode.get("reasoning").asText();
                                } else if (newsNode.has("content")) {
                                    text = newsNode.get("content").asText();
                                } else {
                                    text = newsNode.get("description").asText();
                                }
                                // 截取前50个字符作为标题
                                title = text.length() > 50 ? text.substring(0, 50) + "..." : text;
                            } else {
                                log.warn("无法提取标题，跳过此条数据");
                                continue;
                            }
                        }
                        
                        // 设置标题和货币名称
                        cryptoNews.setTitle(title);
                        cryptoNews.setCurrency(currency);
                        
                        // 处理内容字段 - 尝试多种可能的内容来源，优先适配currency_predictions格式
                        StringBuilder contentBuilder = new StringBuilder();
                        
                        // 1. 优先使用reasoning字段（currency_predictions格式）
                        if (newsNode.has("reasoning")) {
                            contentBuilder.append("分析理由: \n").append(newsNode.get("reasoning").asText()).append("\n\n");
                            log.info("从reasoning字段获取内容");
                        }
                        
                        // 2. 添加current_price信息（currency_predictions格式）
                        if (newsNode.has("current_price")) {
                            contentBuilder.append("当前价格: " + newsNode.get("current_price").asText()).append("\n");
                        }
                        
                        // 3. 添加target_range信息（currency_predictions格式）
                        if (newsNode.has("target_range")) {
                            contentBuilder.append("目标价格区间: " + newsNode.get("target_range").asText()).append("\n");
                        }
                        
                        // 4. 直接使用content字段（兼容旧格式）
                        if (newsNode.has("content")) {
                            contentBuilder.append("\n").append(newsNode.get("content").asText());
                        }
                        // 5. 使用description字段（兼容旧格式）
                        else if (newsNode.has("description")) {
                            contentBuilder.append("\n").append(newsNode.get("description").asText());
                        }
                        // 6. 使用key_points数组（兼容旧格式）
                        else if (newsNode.has("key_points") && newsNode.get("key_points").isArray()) {
                            contentBuilder.append("\n要点: ");
                            JsonNode keyPointsNode = newsNode.get("key_points");
                            for (int i = 0; i < keyPointsNode.size(); i++) {
                                if (i > 0) {
                                    contentBuilder.append("；");
                                }
                                contentBuilder.append(keyPointsNode.get(i).asText());
                            }
                        }
                        
                        // 7. 添加sentiment信息（兼容旧格式）
                        if (newsNode.has("sentiment")) {
                            contentBuilder.append("\n情感分析：").append(newsNode.get("sentiment").asText());
                        }
                        
                        // 8. 添加timestamp信息（兼容旧格式）
                        if (newsNode.has("timestamp")) {
                            contentBuilder.append("\n发布时间：").append(newsNode.get("timestamp").asText());
                        }
                        
                        // 设置内容，确保不为空
                        cryptoNews.setContent(contentBuilder.toString().isEmpty() ? "暂无详细内容" : contentBuilder.toString());
                        
                        // 处理趋势字段 - 优先适配sentiment（news_data格式）
                        String trend = "持平"; // 默认值
                        
                        if (newsNode.has("sentiment")) {
                            String sentiment = newsNode.get("sentiment").asText().toLowerCase();
                            log.info("处理sentiment字段: {}", sentiment);
                            if (sentiment.contains("积极") || sentiment.contains("positive") || sentiment.contains("上涨")) {
                                trend = "上涨";
                            } else if (sentiment.contains("消极") || sentiment.contains("negative") || sentiment.contains("下跌")) {
                                trend = "下跌";
                            }
                        } else if (newsNode.has("predicted_trend")) {
                            // 从predicted_trend字段映射趋势
                            String predictedTrend = newsNode.get("predicted_trend").asText().toLowerCase();
                            log.info("处理predicted_trend字段: {}", predictedTrend);
                            
                            if (predictedTrend.contains("上涨") || predictedTrend.contains("上行") || 
                                predictedTrend.contains("up") || predictedTrend.contains("positive")) {
                                trend = "上涨";
                            } else if (predictedTrend.contains("下跌") || predictedTrend.contains("下行") || 
                                       predictedTrend.contains("down") || predictedTrend.contains("negative")) {
                                trend = "下跌";
                            } else if (predictedTrend.contains("震荡") || predictedTrend.contains("波动") || 
                                       predictedTrend.contains("neutral")) {
                                trend = "持平";
                            }
                        } else if (newsNode.has("trend")) {
                            // 直接使用trend字段（兼容旧格式）
                            trend = newsNode.get("trend").asText();
                        } else if (newsNode.has("direction")) {
                            trend = newsNode.get("direction").asText();
                        } else if (newsNode.has("sentiment")) {
                            // 根据情感分析映射到趋势（兼容旧格式）
                            String sentiment = newsNode.get("sentiment").asText().toLowerCase();
                            if (sentiment.contains("积极") || sentiment.contains("利好") || 
                                sentiment.contains("positive") || sentiment.contains("up")) {
                                trend = "上涨";
                            } else if (sentiment.contains("消极") || sentiment.contains("利空") || 
                                       sentiment.contains("negative") || sentiment.contains("down")) {
                                trend = "下跌";
                            }
                        }
                        
                        cryptoNews.setTrend(trend);
                        
                        // 处理波动幅度描述 - 优先适配impact（news_data格式）
                        if (newsNode.has("impact")) {
                            cryptoNews.setMagnitude(newsNode.get("impact").asText());
                            log.info("使用impact字段作为波动幅度: {}", cryptoNews.getMagnitude());
                        } else if (newsNode.has("target_range")) {
                            // 使用target_range作为波动幅度描述
                            cryptoNews.setMagnitude("价格目标区间: " + newsNode.get("target_range").asText());
                        } else if (newsNode.has("magnitude")) {
                            cryptoNews.setMagnitude(newsNode.get("magnitude").asText());
                        } else if (newsNode.has("change")) {
                            cryptoNews.setMagnitude(newsNode.get("change").asText());
                        } else {
                            cryptoNews.setMagnitude("未知"); // 设置默认值
                        }
                        
                        // 设置创建和更新时间
                        cryptoNews.setCreatedAt(LocalDateTime.now());
                        cryptoNews.setUpdatedAt(LocalDateTime.now());

                        // 添加到列表
                        newsList.add(cryptoNews);
                        validCount++;
                        log.info("成功解析一条新闻数据: 标题={}, 加密货币={}, 趋势={}", 
                                cryptoNews.getTitle(), cryptoNews.getCurrency(), cryptoNews.getTrend());
                    } catch (Exception e) {
                        log.error("解析加密货币新闻数据失败，数据: {}", newsNode, e);
                        // 跳过无效数据，继续处理下一条
                    }
                }
                
                log.info("新闻数据处理完成，共处理{}条，有效数据{}条", processedCount, validCount);
            } else {
                log.warn("未找到有效的加密货币新闻数据数组，原始数据结构: {}", newsData.getNodeType());
                // 输出数据结构以便调试
                log.info("完整原始数据结构: {}", newsData.toString());
                
                // 尝试直接将根节点作为单个新闻对象处理（如果它包含必要字段）
                if (newsData.isObject() && (newsData.has("title") || newsData.has("content"))) {
                    log.info("尝试将根节点作为单个新闻对象处理");
                    try {
                        CryptoNews cryptoNews = new CryptoNews();
                        
                        // 填充必要字段
                        if (newsData.has("title")) {
                            cryptoNews.setTitle(newsData.get("title").asText());
                        } else {
                            cryptoNews.setTitle("单条新闻");
                        }
                        
                        if (newsData.has("currency")) {
                            cryptoNews.setCurrency(newsData.get("currency").asText());
                        } else {
                            cryptoNews.setCurrency("未知加密货币");
                        }
                        
                        cryptoNews.setContent(newsData.has("content") ? 
                            newsData.get("content").asText() : "暂无内容");
                        cryptoNews.setTrend(newsData.has("trend") ? 
                            newsData.get("trend").asText() : "持平");
                        cryptoNews.setMagnitude(newsData.has("magnitude") ? 
                            newsData.get("magnitude").asText() : "未知");
                        
                        cryptoNews.setCreatedAt(LocalDateTime.now());
                        cryptoNews.setUpdatedAt(LocalDateTime.now());
                        
                        newsList.add(cryptoNews);
                        log.info("成功将根节点处理为单条新闻数据");
                    } catch (Exception e) {
                        log.error("处理根节点作为单条新闻失败", e);
                    }
                }
            }

            // 批量插入数据库
            if (!newsList.isEmpty()) {
                log.info("准备插入数据库的新闻数据数量: {}", newsList.size());
                
                // 使用MyBatis-Plus的批量插入方法
                int insertCount = 0;
                for (CryptoNews news : newsList) {
                    try {
                        log.info("插入数据: 标题={}, 加密货币={}", news.getTitle(), news.getCurrency());
                        int result = cryptoNewsMapper.insert(news);
                        if (result > 0) {
                            insertCount++;
                        }
                    } catch (Exception e) {
                        log.error("插入单条新闻数据失败", e);
                    }
                }
                
                log.info("加密货币新闻数据保存完成，成功插入{}条数据", insertCount);
                
                // 验证数据库中的记录数量
                Long count = cryptoNewsMapper.selectCount(null);
                log.info("数据库中当前加密货币新闻数据数量：{}", count);
            } else {
                log.warn("没有有效数据可保存到数据库");
                // 打印原始数据结构用于调试
                log.info("最终未能找到有效加密货币新闻数据，原始数据格式可能需要进一步适配");
            }
            savedNewsList = newsList;
        } catch (Exception e) {
            log.error("保存加密货币新闻数据到数据库失败：", e);
            throw new RuntimeException("保存加密货币新闻数据失败", e);
        }
        return savedNewsList;
    }
}