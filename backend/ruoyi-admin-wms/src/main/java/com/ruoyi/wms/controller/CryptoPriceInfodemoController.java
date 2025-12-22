package com.ruoyi.wms.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.idempotent.annotation.RepeatSubmit;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.web.core.BaseController;
import com.ruoyi.wms.domain.bo.CryptoPriceInfodemoBo;
import com.ruoyi.wms.domain.vo.CryptoPriceInfodemoVo;
import com.ruoyi.wms.service.CryptoPriceInfodemoService;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/cryptoPriceInfodemo")
public class CryptoPriceInfodemoController extends BaseController {

    private final CryptoPriceInfodemoService cryptoPriceInfodemoService;

    /**
     * 查询虚拟货币价格信息演示列表（分页）
     */
    @GetMapping("/list")
    public TableDataInfo<CryptoPriceInfodemoVo> list(CryptoPriceInfodemoBo bo, PageQuery pageQuery) {
        return cryptoPriceInfodemoService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询虚拟货币价格信息演示列表（不分页）
     */
    @GetMapping("/listNoPage")
    public R<List<CryptoPriceInfodemoVo>> listNoPage(CryptoPriceInfodemoBo bo) {
        return R.ok(cryptoPriceInfodemoService.queryList(bo));
    }

    /**
     * 根据ID获取虚拟货币价格信息演示详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    public R<CryptoPriceInfodemoVo> getInfo(@NotNull(message = "主键不能为空")
                                            @PathVariable Integer id) {
        return R.ok(cryptoPriceInfodemoService.queryById(id));
    }

    /**
     * 新增虚拟货币价格信息演示
     */
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody CryptoPriceInfodemoBo bo) {
        cryptoPriceInfodemoService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改虚拟货币价格信息演示
     */
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody CryptoPriceInfodemoBo bo) {
        cryptoPriceInfodemoService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 根据ID删除虚拟货币价格信息演示
     *
     * @param id 主键
     */
    @DeleteMapping("/{id}")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                         @PathVariable Integer id) {
        cryptoPriceInfodemoService.deleteById(id);
        return R.ok();
    }
}