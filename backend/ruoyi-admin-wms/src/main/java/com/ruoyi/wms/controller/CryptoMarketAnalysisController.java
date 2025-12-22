package com.ruoyi.wms.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.wms.service.CryptoMarketAnalysisService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 加密货币市场分析控制器
 */
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/cryptoAnalysis")
public class CryptoMarketAnalysisController {

    private final CryptoMarketAnalysisService cryptoMarketAnalysisService;

    /**
     * 获取加密货币市场分析摘要
     * @return 包含summary字段的分析结果
     */
    @PostMapping("/summary")
    public R<Map<String, Object>> getMarketAnalysisSummary() {
        try {
            log.info("开始获取加密货币市场分析摘要");
            // 调用服务层获取市场分析数据
            Map<String, Object> analysisData = cryptoMarketAnalysisService.getMarketAnalysis();
            log.info("获取加密货币市场分析摘要成功");
            return R.ok("获取市场分析摘要成功", analysisData);
        } catch (Exception e) {
            log.error("获取加密货币市场分析摘要失败", e);
            return R.fail(e.getMessage() != null ? e.getMessage() : "获取市场分析摘要失败");
        }
    }
}