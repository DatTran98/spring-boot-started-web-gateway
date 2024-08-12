package vn.dattb.authengatewayweb.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean<AddRequestHeaderFilter> loggingFilter() {
        FilterRegistrationBean<AddRequestHeaderFilter> registrationBean = new FilterRegistrationBean<>();

        registrationBean.setFilter(new AddRequestHeaderFilter());
        registrationBean.addUrlPatterns("/*");
        registrationBean.setOrder(1);

        //add order

        return registrationBean;
    }
    
}
