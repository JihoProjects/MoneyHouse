package com.moneyhouse.jwt;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import io.jsonwebtoken.Claims;

/**
 * JWT를 사용하여 인증을 확인하는 필터
 * 
 * @author 김지호 jihogrammer@gmail.com
 */
public class JwtAuthenticationFilter extends BasicAuthenticationFilter {

    private JwtProvider jwtProvider;

    public JwtAuthenticationFilter(AuthenticationManager authenticationManager, JwtProvider jwtProvider) {
        super(authenticationManager);
        this.jwtProvider = jwtProvider;
    }

    /**
     * SecurityContext 에 Authentication 객체 세팅.
     * */
    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain chain) throws IOException, ServletException {

        Authentication authentication = getAuthentication(request);

        if (authentication != null) {
            SecurityContext context = SecurityContextHolder.getContext();
            context.setAuthentication(authentication);
        }

        chain.doFilter(request, response);

    }

    /**
     * 헤더의 Authorization로부터 토큰을 가져와 사용자의 정보를 담을 Authentication 객체로 변환
     * @param request
     * @return 인증 객체
     */
    private Authentication getAuthentication(HttpServletRequest request) {

        String token = request.getHeader("moneyhouse-token");

        // token이 유효할 경우
        if (token != null && token.length() > 0 && jwtProvider.validateToken(token)) {
            Claims claims = jwtProvider.getClaims(token);
            return new UsernamePasswordAuthenticationToken(claims, null);
        }

        // token이 유효하지 않음
        return null;

    }

}
