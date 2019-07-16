package com.neuedu.his.global;

import com.neuedu.his.global.interceptors.AuthInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@MapperScan("com.neuedu.his.global.dao")
public class GlobalApplication implements WebMvcConfigurer {

    public static void main(String[] args) {
        SpringApplication.run(GlobalApplication.class,args);
    }

    /**
     * 配置Interceptors,权限拦截器拦截所有路径，除了登录/login路径
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthInterceptor()).addPathPatterns("/**").excludePathPatterns("/login");
    }
}
