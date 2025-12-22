package com.ruoyi.common.json.handler;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.ser.std.NumberSerializer;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

/**
 * 超出 JS 最大最小值 处理
 *
 * @author Lion Li
 */
@JacksonStdImpl
public class BigNumberSerializer extends NumberSerializer {

    /**
     * 根据 JS Number.MAX_SAFE_INTEGER 与 Number.MIN_SAFE_INTEGER 得来
     */
    private static final BigDecimal MAX_SAFE_INTEGER = new BigDecimal("9007199254740991");
    private static final BigDecimal MIN_SAFE_INTEGER = new BigDecimal("-9007199254740991");

    /**
     * 提供实例
     */
    public static final BigNumberSerializer INSTANCE = new BigNumberSerializer(Number.class);

    public BigNumberSerializer(Class<? extends Number> rawType) {
        super(rawType);
    }

    @Override
    public void serialize(Number value, JsonGenerator gen, SerializerProvider provider) throws IOException {
        BigDecimal bd;
        if (value instanceof BigDecimal) {
            bd = (BigDecimal) value;
        } else if (value instanceof BigInteger) {
            bd = new BigDecimal((BigInteger) value);
        } else {
            bd = new BigDecimal(value.toString());
        }
        // 超出范围 序列化位字符串
        if (bd.compareTo(MIN_SAFE_INTEGER) > 0 && bd.compareTo(MAX_SAFE_INTEGER) < 0) {
            super.serialize(value, gen, provider);
        } else {
            gen.writeString(value.toString());
        }
    }
}
