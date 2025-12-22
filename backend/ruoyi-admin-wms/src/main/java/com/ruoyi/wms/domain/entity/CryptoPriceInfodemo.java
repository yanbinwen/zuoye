package com.ruoyi.wms.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 虚拟货币价格信息演示实体类
 *
 * @author ruoyi
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("crypto_price_info")
public class CryptoPriceInfodemo extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 排名
     */
    @TableField("`rank`")
    private Integer rank;

    /**
     * 名称
     */
    private String name;

    /**
     * 符号
     */
    private String symbol;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 涨跌幅
     */
    @TableField("`change`")
    private BigDecimal change;

    /**
     * 涨跌幅百分比
     */
    private BigDecimal changePercent;

    /**
     * 趋势(up/down)
     */
    private String trend;

    /**
     * 日期
     */
    @TableField("`date`")
    private LocalDateTime date;
}