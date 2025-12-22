package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.CryptoPriceInfodemo;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 虚拟货币价格信息演示Vo
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = CryptoPriceInfodemo.class)
public class CryptoPriceInfodemoVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @ExcelProperty(value = "主键ID")
    private Integer id;

    /**
     * 排名
     */
    @ExcelProperty(value = "排名")
    private Integer rank;

    /**
     * 名称
     */
    @ExcelProperty(value = "名称")
    private String name;

    /**
     * 符号
     */
    @ExcelProperty(value = "符号")
    private String symbol;

    /**
     * 价格
     */
    @ExcelProperty(value = "价格")
    private BigDecimal price;

    /**
     * 涨跌幅
     */
    @ExcelProperty(value = "涨跌幅")
    private BigDecimal change;

    /**
     * 涨跌幅百分比
     */
    @ExcelProperty(value = "涨跌幅百分比")
    private BigDecimal changePercent;

    /**
     * 趋势(up/down)
     */
    @ExcelProperty(value = "趋势")
    private String trend;

    /**
     * 日期
     */
    @ExcelProperty(value = "日期")
    private LocalDateTime date;

    /**
     * 创建者
     */
    @ExcelProperty(value = "创建者")
    private String createBy;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private LocalDateTime createTime;

    /**
     * 更新者
     */
    @ExcelProperty(value = "更新者")
    private String updateBy;

    /**
     * 更新时间
     */
    @ExcelProperty(value = "更新时间")
    private LocalDateTime updateTime;
}