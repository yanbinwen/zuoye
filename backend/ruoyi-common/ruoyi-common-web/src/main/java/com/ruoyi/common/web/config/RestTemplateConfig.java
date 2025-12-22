package com.ruoyi.common.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 * RestTemplate 配置类
 *
 * @author ruoyi
 */
@Configuration
public class RestTemplateConfig {

    @Bean
    public RestTemplate restTemplate() {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        // 设置连接超时为10分钟
        factory.setConnectTimeout(600000);
        // 设置读取超时为10分钟
        factory.setReadTimeout(600000);
        return new RestTemplate(factory);
    }

}