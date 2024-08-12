package vn.dattb.authengatewayweb.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

//@Component
@Slf4j
public class AddRequestHeaderFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest servletRequest, HttpServletResponse servletResponse, FilterChain filterChain) throws ServletException, IOException {
        CustomHttpServletRequestWrapper wrappedRequest = new CustomHttpServletRequestWrapper(servletRequest);

        wrappedRequest.addHeader("X-Request-Start-Time", String.valueOf(System.currentTimeMillis()));
        wrappedRequest.addHeader("abc", "abc");

        log.info("Add request header filter");

        filterChain.doFilter(wrappedRequest, servletResponse);
    }
}
