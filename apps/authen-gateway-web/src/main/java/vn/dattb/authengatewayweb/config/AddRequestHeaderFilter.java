package vn.dattb.authengatewayweb.config;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
//@Component
public class AddRequestHeaderFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest servletRequest, HttpServletResponse servletResponse, FilterChain filterChain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        CustomHttpServletRequestWrapper wrappedRequest = new CustomHttpServletRequestWrapper(httpRequest);

        wrappedRequest.addHeader("X-Request-Start-Time", String.valueOf(System.currentTimeMillis()));
        wrappedRequest.addHeader("abc", "abc");

        Logger logger = org.slf4j.LoggerFactory.getLogger(AddRequestHeaderFilter.class);
        logger.info("Add request header filter");

        filterChain.doFilter(wrappedRequest, servletResponse);
    }
}
