package com.study_project.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study_project.web.user.model.User;

public class Interceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("LoginCheckIntercepter preHandle");
		
		boolean result = false;
		String rootPath = request.getContextPath();
		try {
			
			
			HttpSession session = request.getSession(false);
			
			if (session == null) {
				response.sendRedirect(rootPath);
				return false;
			} else {
				User user = (User)session.getAttribute("user");
				System.out.println("user="+user);
				if (user != null && user.getId() != "") {
					// Session exists.
					request.setAttribute("userId", user.getId());
				} else {
					// Session not exists.
					response.sendRedirect(rootPath);
					return false;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		return result;
	}
	
}
