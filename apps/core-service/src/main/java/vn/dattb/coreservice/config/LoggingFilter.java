package vn.dattb.coreservice.config;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

//@Component
public class LoggingFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(LoggingFilter.class);

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        logger.info("Request URL: " + req.getRequestURL());
        logger.info("Request Start: " + req.getHeader("X-Request-Start-Time"));
        logger.info("Request abc: " + req.getHeader("abc"));
        logger.info("Request forwarded-for: " + req.getHeader("X-Forwarded-For"));
        //log forwareded-host
        logger.info("Request forwarded-host: " + req.getHeader("X-Forwarded-Host"));
        //log forwareded-proto
        logger.info("Request forwarded-proto: " + req.getHeader("X-Forwarded-Proto"));

        chain.doFilter(request, response);
    }
}