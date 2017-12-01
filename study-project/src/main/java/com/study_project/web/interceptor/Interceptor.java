package com.study_project.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("LoginCheckIntercepter preHandle");
		logger.info(" ========== Interceptor preHandle Start ==========");
		logger.info(" Request URL: " + request.getRequestURL());
		
		String req_Uri=request.getRequestURI();
		String figure = req_Uri.replaceAll("[^0-9]", "");
		if (figure!=null) {
			String beerUri = "/web/beer/" + figure;
			String sojuUri = "/web/soju/" + figure;
			
			if(beerUri.equals(request.getRequestURI())) return true; //제외
			if(sojuUri.equals(request.getRequestURI())) return true; //제외
			
		}

		HttpSession session = request.getSession();
//		if("/web/soju/".equals(request.getRequestURI())) return true; //제외

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
