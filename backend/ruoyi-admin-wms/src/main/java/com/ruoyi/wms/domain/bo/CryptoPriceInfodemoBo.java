package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.CryptoPriceInfodemo;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = CryptoPriceInfodemo.class, reverseConvertGenerate = false)
public class CryptoPriceInfodemoBo extends BaseEntity {

    /**
     * 主键ID
     */
    @NotNull(message = "ID不能为空", groups = {EditGroup.class})
    private Integer id;

    /**
     * 排名
     */
    @NotNull(message = "排名不能为空", groups = {AddGroup.class, EditGroup.class})
    private Integer rank;

    /**
     * 名称
     */
    @NotBlank(message = "名称不能为空", groups = {AddGroup.class, EditGroup.class})
    private String name;

    /**
     * 符号
     */
    @NotBlank(message = "符号不能为空", groups = {AddGroup.class, EditGroup.class})
    private String symbol;

    /**
     * 价格
     */
    @NotNull(message = "价格不能为空", groups = {AddGroup.class, EditGroup.class})
    @DecimalMin(value = "0.000", inclusive = true, message = "价格不能小于0")
    private BigDecimal price;

    /**
     * 涨跌幅
     */
    @NotNull(message = "涨跌幅不能为空", groups = {AddGroup.class, EditGroup.class})
    private BigDecimal change;

    /**
     * 涨跌幅百分比
     */
    @NotNull(message = "涨跌幅百分比不能为空", groups = {AddGroup.class, EditGroup.class})
    private BigDecimal changePercent;

    /**
     * 趋势(up/down)
     */
    @NotBlank(message = "趋势不能为空", groups = {AddGroup.class, EditGroup.class})
    private String trend;

    /**
     * 日期
     */
    private LocalDateTime date;
}