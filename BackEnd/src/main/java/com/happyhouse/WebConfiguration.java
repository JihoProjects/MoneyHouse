package com.happyhouse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.happyhouse.interceptor.ConfirmInterceptor;

@Configuration
public class WebConfiguration extends WebMvcConfigurerAdapter {

    @Autowired
    private ConfirmInterceptor confirmInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // 해당 URL에서 Interceptor를 조정해야 한다.
        registry.addInterceptor(confirmInterceptor).addPathPatterns("/qnainput/**");

    }

}
