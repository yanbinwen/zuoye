package com.ruoyi.wms.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.mybatis.core.domain.BaseEntity;
import com.ruoyi.wms.domain.entity.UserCryptoPurchases;
import io.github.linpeilie.annotations.AutoMapper;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = UserCryptoPurchases.class, reverseConvertGenerate = false)
public class UserCryptoPurchasesBo extends BaseEntity {

    /**
     * 主键ID
     */
    @NotNull(message = "ID不能为空", groups = {EditGroup.class})
    private Integer id;

    /**
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空", groups = {AddGroup.class, EditGroup.class})
    private Integer userId;

    /**
     * 虚拟货币名称
     */
    @NotBlank(message = "虚拟货币名称不能为空", groups = {AddGroup.class})
    private String cryptoName;

    /**
     * 购买数量
     */
    @NotNull(message = "购买数量不能为空", groups = {AddGroup.class, EditGroup.class})
    @DecimalMin(value = "0.00000001", inclusive = true, message = "购买数量必须大于0")
    private BigDecimal amount;

    /**
     * 单价
     */
    @NotNull(message = "单价不能为空", groups = {AddGroup.class})
    @DecimalMin(value = "0.00000001", inclusive = true, message = "单价必须大于0")
    private BigDecimal pricePerUnit;

    /**
     * 总花费
     */
    @NotNull(message = "总花费不能为空", groups = {AddGroup.class})
    @DecimalMin(value = "0.00000001", inclusive = true, message = "总花费必须大于0")
    private BigDecimal totalSpent;

    /**
     * 最小购买金额
     */
    @DecimalMin(value = "0", message = "最小购买金额不能小于0")
    private BigDecimal totalSpentMin;

    /**
     * 最大购买金额
     */
    @DecimalMin(value = "0", message = "最大购买金额不能小于0")
    private BigDecimal totalSpentMax;

    /**
     * 购买时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", timezone = "GMT")
    private LocalDateTime purchaseDate;

    /**
     * 开始时间
     */
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    private LocalDateTime endTime;
}