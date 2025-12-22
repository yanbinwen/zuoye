package com.ruoyi.wms.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.idempotent.annotation.RepeatSubmit;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.web.core.BaseController;
import com.ruoyi.wms.domain.bo.UserCryptoPurchasesBo;
import com.ruoyi.wms.domain.vo.UserCryptoPurchasesVo;
import com.ruoyi.wms.service.UserCryptoPurchasesService;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wms/userCryptoPurchases")
public class UserCryptoPurchasesController extends BaseController {

    private final UserCryptoPurchasesService userCryptoPurchasesService;

    /**
     * 查询用户虚拟货币购买记录列表（分页）
     */
    @GetMapping("/list")
    public TableDataInfo<UserCryptoPurchasesVo> list(UserCryptoPurchasesBo bo, PageQuery pageQuery) {
        return userCryptoPurchasesService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询用户虚拟货币购买记录列表（不分页）
     */
    @GetMapping("/listNoPage")
    public R<List<UserCryptoPurchasesVo>> listNoPage(UserCryptoPurchasesBo bo) {
        return R.ok(userCryptoPurchasesService.queryList(bo));
    }

    /**
     * 根据ID获取用户虚拟货币购买记录详细信息
     *
     * @param id 主键
     */
    @GetMapping("/{id}")
    public R<UserCryptoPurchasesVo> getInfo(@NotNull(message = "主键不能为空")
                                         @PathVariable Integer id) {
        return R.ok(userCryptoPurchasesService.queryById(id));
    }

    /**
     * 新增用户虚拟货币购买记录
     */
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody UserCryptoPurchasesBo bo) {
        userCryptoPurchasesService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 修改用户虚拟货币购买记录
     */
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody UserCryptoPurchasesBo bo) {
        userCryptoPurchasesService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 根据ID删除用户虚拟货币购买记录
     *
     * @param id 主键
     */
    @DeleteMapping("/{id}")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                        @PathVariable Integer id) {
        userCryptoPurchasesService.deleteById(id);
        return R.ok();
    }

    /**
     * 获取所有唯一的虚拟货币名称列表
     */
    @GetMapping("/cryptoNames")
    public R<List<String>> getCryptoNames() {
        return R.ok(userCryptoPurchasesService.getUniqueCryptoNames());
    }
    
    /**
     * 获取指定虚拟货币的最新价格
     */
    @GetMapping("/latestPrice/{cryptoName}")
    public R<BigDecimal> getLatestPrice(@PathVariable String cryptoName) {
        BigDecimal price = userCryptoPurchasesService.getLatestCryptoPrice(cryptoName);
        return R.ok(price);
    }
    
    /**
     * 获取所有虚拟货币的最新价格映射
     */
    @GetMapping("/latestPrices")
    public R<Map<String, BigDecimal>> getLatestPrices() {
        return R.ok(userCryptoPurchasesService.getLatestCryptoPrices());
    }
}