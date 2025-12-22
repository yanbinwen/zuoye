package com.ruoyi.wms.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.wms.domain.entity.CryptoNews;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 加密货币新闻数据Vo
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = CryptoNews.class)
public class CryptoNewsVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @ExcelProperty(value = "主键ID")
    private Long id;

    /**
     * 新闻标题
     */
    @ExcelProperty(value = "新闻标题")
    private String title;

    /**
     * 新闻内容
     */
    @ExcelProperty(value = "新闻内容")
    private String content;

    /**
     * 加密货币名称
     */
    @ExcelProperty(value = "加密货币名称")
    private String currency;

    /**
     * 价格趋势
     */
    @ExcelProperty(value = "价格趋势")
    private String trend;

    /**
     * 波动幅度
     */
    @ExcelProperty(value = "波动幅度")
    private String magnitude;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    @ExcelProperty(value = "更新时间")
    private LocalDateTime updatedAt;
}