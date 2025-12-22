package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.wms.domain.entity.UserCryptoPurchases;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 用户虚拟货币购买记录Vo
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = UserCryptoPurchases.class)
public class UserCryptoPurchasesVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @ExcelProperty(value = "主键ID")
    private Integer id;

    /**
     * 用户ID
     */
    @ExcelProperty(value = "用户ID")
    private Integer userId;

    /**
     * 虚拟货币名称
     */
    @ExcelProperty(value = "虚拟货币名称")
    private String cryptoName;

    /**
     * 购买数量
     */
    @ExcelProperty(value = "购买数量")
    private BigDecimal amount;

    /**
     * 单价
     */
    @ExcelProperty(value = "单价")
    private BigDecimal pricePerUnit;

    /**
     * 总花费
     */
    @ExcelProperty(value = "总花费")
    private BigDecimal totalSpent;

    /**
     * 购买时间
     */
    @ExcelProperty(value = "购买时间")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", timezone = "GMT")
    private LocalDateTime purchaseDate;

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