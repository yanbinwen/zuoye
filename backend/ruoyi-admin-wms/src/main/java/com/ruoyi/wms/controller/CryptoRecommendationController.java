package com.ruoyi.wms.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.web.core.BaseController;
import com.ruoyi.wms.service.CryptoRecommendationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 虚拟货币推荐控制器
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/cryptoRecommendation")
public class CryptoRecommendationController extends BaseController {

    private final CryptoRecommendationService cryptoRecommendationService;

    /**
     * 获取推荐的虚拟货币列表
     * @return 推荐的虚拟货币列表
     */
    @GetMapping("/getRecommendations")
    public R<List<CryptoRecommendationService.RecommendedCoin>> getRecommendations() {
        try {
            List<CryptoRecommendationService.RecommendedCoin> recommendations = cryptoRecommendationService.getRecommendedCoins();
            return R.ok(recommendations);
        } catch (Exception e) {
            return R.fail("获取推荐虚拟货币失败：" + e.getMessage());
        }
    }
}