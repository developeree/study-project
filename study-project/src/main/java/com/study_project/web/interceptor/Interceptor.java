package com.study_project.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study_project.web.user.model.User;

public class Interceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("LoginCheckIntercepter preHandle");
		logger.info(" ========== Interceptor preHandle Start ==========");
		logger.info(" Request URI /t : " + request.getRequestURI());
		System.out.println("이전페이지 정보 = " + request.getHeader("referer"));
		HttpSession session = request.getSession();
		System.out.println("세션 = " + session);
		String test = (String)request.getAttribute("pageSelect");
		System.out.println("페이지정보 = " + test);
		 
		if("/web/user/login.html".equals(request.getRequestURI())) return true; //제외
		if("/web/user/login.do".equals(request.getRequestURI())) return true; //제외
		if("/web/user/main.html".equals(request.getRequestURI())) return true; //제외
		if("/web/user/logout.html".equals(request.getRequestURI())) return true; //제외
		if("/web/soju//board/{idx}".equals(request.getRequestURI())) return true; //제외
		if("/web/soju/soju.html".equals(request.getRequestURI())) return true; //제외
		if("/web/resources/css/login.css".equals(request.getRequestURI())) return true; //제외
		if("/web/resources/images".equals(request.getRequestURI())) return true; //제외
		
		if("/web/soju/{idx}".equals(request.getRequestURI())) return true; //제외
		
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/web/user/login.html");
			return false;
		}

		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info(" ========== Interceptor postHandle End ==========");
	}
	
}
