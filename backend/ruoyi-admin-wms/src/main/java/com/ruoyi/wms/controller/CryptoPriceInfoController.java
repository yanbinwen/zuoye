package com.ruoyi.wms.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.idempotent.annotation.RepeatSubmit;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;

import com.ruoyi.common.web.core.BaseController;
import com.ruoyi.wms.domain.bo.CryptoPriceInfoBo;
import com.ruoyi.wms.domain.vo.CryptoPriceInfoVo;
import com.ruoyi.wms.service.CryptoPriceInfoService;
import com.ruoyi.wms.service.CryptoDifyService;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/cryptoPriceInfo")
public class CryptoPriceInfoController extends BaseController {

    private final CryptoPriceInfoService cryptoPriceInfoService;
    private final CryptoDifyService cryptoDifyService;

    /**
     * 查询虚拟货币价格信息列表（分页）
     */
    @GetMapping("/list")
    public TableDataInfo<CryptoPriceInfoVo> list(CryptoPriceInfoBo bo, PageQuery pageQuery) {
        return cryptoPriceInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询虚拟货币价格信息列表（不分页）
     */
    @GetMapping("/listNoPage")
    public R<List<CryptoPriceInfoVo>> listNoPage(CryptoPriceInfoBo bo) {
        return R.ok(cryptoPriceInfoService.queryList(bo));
    }

    /**
     * 根据ID获取虚拟货币价格信息详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    public R<CryptoPriceInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                      @PathVariable Integer id) {
        return R.ok(cryptoPriceInfoService.queryById(id));
    }

    /**
     * 新增虚拟货币价格信息
     */
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody CryptoPriceInfoBo bo) {
        cryptoPriceInfoService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改虚拟货币价格信息
     */
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody CryptoPriceInfoBo bo) {
        cryptoPriceInfoService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 根据ID删除虚拟货币价格信息
     *
     * @param id 主键
     */
    @DeleteMapping("/{id}")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                         @PathVariable Integer id) {
        cryptoPriceInfoService.deleteById(id);
        return R.ok();
    }

    /**
     * 刷新虚拟货币价格信息
     */
    @PostMapping("/refresh")
    public R<Void> refresh() {
        try {
            cryptoDifyService.fetchAndSaveCryptoData();
            return R.ok();
        } catch (Exception e) {
            return R.fail("刷新数据失败：" + e.getMessage());
        }
    }
}