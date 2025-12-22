package com.ruoyi.wms.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.idempotent.annotation.RepeatSubmit;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.web.core.BaseController;
import com.ruoyi.wms.domain.bo.CryptoNewsBo;
import com.ruoyi.wms.domain.entity.CryptoNews;
import com.ruoyi.wms.domain.vo.CryptoNewsVo;
import com.ruoyi.wms.service.CryptoNewsService;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import java.util.Map;

@Validated
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/cryptoNews")
public class CryptoNewsController extends BaseController {

    private final CryptoNewsService cryptoNewsService;

    /**
     * 查询加密货币新闻列表（分页）
     */
    @GetMapping("/list")
    public R<TableDataInfo<CryptoNewsVo>> list(CryptoNewsBo bo, PageQuery pageQuery) {
        return R.ok(cryptoNewsService.queryPageList(bo, pageQuery));
    }

    /**
     * 查询加密货币新闻列表（不分页）
     */
    @GetMapping("/listNoPage")
    public R<List<CryptoNewsVo>> listNoPage(CryptoNewsBo bo) {
        return R.ok(cryptoNewsService.queryList(bo));
    }

    /**
     * 根据ID获取加密货币新闻详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    public R<CryptoNewsVo> getInfo(@NotNull(message = "主键不能为空")
                                @PathVariable Long id) {
        return R.ok(cryptoNewsService.queryById(id));
    }

    /**
     * 新增加密货币新闻
     */
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody CryptoNewsBo bo) {
        cryptoNewsService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改加密货币新闻
     */
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody CryptoNewsBo bo) {
        cryptoNewsService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 根据ID删除加密货币新闻
     *
     * @param id 主键
     */
    @DeleteMapping("/{id}")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                         @PathVariable Long id) {
        cryptoNewsService.deleteById(id);
        return R.ok();
    }
    
    /**
     * 刷新加密货币新闻数据
     * 从Dify API获取最新的加密货币新闻数据并存储到数据库
     */
    @PostMapping("/refresh")
    public R<Map<String, Object>> refreshCryptoNewsData() {
        try {
            log.info("开始刷新加密货币新闻数据");
            Map<String, Object> result = cryptoNewsService.fetchAndSaveCryptoNewsData();
            log.info("加密货币新闻数据刷新成功");
            return R.ok(result);
        } catch (Exception e) {
            log.error("加密货币新闻数据刷新失败: {}", e.getMessage());
            return R.fail("加密货币新闻数据刷新失败: " + e.getMessage());
        }
    }
}