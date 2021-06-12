package com.happyhouse.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * QnA 글 등록 시 로그인 한 사용자만 기능을 사용하도록 조정
 * 
 * @see com.happyhouse.controller.HomeController#login()
 * @author jihogrammer@gmail.com
 *
 */
@Component
public class ConfirmInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        String user = (String) session.getAttribute("id");

        // 만약 로그인 하지 않은 사용자가 QnA를 등록하고자 할 때 Main Page로 redirect 한다.
        if(user == null) {
            response.sendRedirect(request.getContextPath());
            return false;
        }
        return true;
    }

}