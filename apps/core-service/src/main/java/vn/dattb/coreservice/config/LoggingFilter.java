package vn.dattb.coreservice.config;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;

//@Component
@Slf4j
public class LoggingFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        log.info("Request URL: {}", req.getRequestURL());
        log.info("Request Start: {}", req.getHeader("X-Request-Start-Time"));
        log.info("Request abc: {}", req.getHeader("abc"));
        log.info("Request forwarded-for: {}", req.getHeader("X-Forwarded-For"));
        //log forwareded-host
        log.info("Request forwarded-host: {}", req.getHeader("X-Forwarded-Host"));
        //log forwareded-proto
        log.info("Request forwarded-proto: {}", req.getHeader("X-Forwarded-Proto"));

        chain.doFilter(request, response);
    }
}