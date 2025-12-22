package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.wms.domain.entity.CryptoNews;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@AutoMapper(target = CryptoNews.class, reverseConvertGenerate = false)
public class CryptoNewsBo {

    /**
     * 主键ID
     */
    @NotNull(message = "ID不能为空", groups = {EditGroup.class})
    private Long id;

    /**
     * 新闻标题
     */
    @NotBlank(message = "新闻标题不能为空", groups = {AddGroup.class, EditGroup.class})
    private String title;

    /**
     * 新闻内容
     */
    @NotBlank(message = "新闻内容不能为空", groups = {AddGroup.class, EditGroup.class})
    private String content;

    /**
     * 加密货币名称
     */
    @NotBlank(message = "加密货币名称不能为空", groups = {AddGroup.class, EditGroup.class})
    private String currency;

    /**
     * 价格趋势
     */
    @NotBlank(message = "价格趋势不能为空", groups = {AddGroup.class, EditGroup.class})
    private String trend;

    /**
     * 波动幅度描述
     */
    private String magnitude;

    /**
     * 创建时间
     */
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    private LocalDateTime updatedAt;
}