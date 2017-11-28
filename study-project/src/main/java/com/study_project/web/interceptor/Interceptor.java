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
		logger.info(" Request URI /t : " + request.getRequestURI());
		logger.info(" Request URL: " + request.getRequestURL());
		String test=request.getRequestURI();
		//숫자만체크
		String figure=test.replaceAll("[^0-9]", "");
		if(figure!=null){
			String beerUri="/web/beer/"+figure;
			if(beerUri.equals(request.getRequestURI())) return true; //제외
		}

//		int test1=test.lastIndexOf("/");
//		String idx=test.substring(test1+1);
		//이방식으로 하니까 idx에 board나 (번호)128 이런게 같아져서 막힘
//		String beerUri="/web/beer/"+idx;
		HttpSession session = request.getSession();

		System.out.println("세션 = " + session);
		//xml에서 /beer 설정이랑 다름 밑에경우는 탭화면은 들어가지고 글쓰기에서 막히는데 xml은 탭부터 막힘 뭐냐 시벌 갑자기 또대네 미친
//		if("/web/beer".equals(request.getRequestURI())) return true; //제외

		if (session.getAttribute("user") == null) {
			response.sendRedirect("/web/user/login.html");
			return false;
		}
//		if (session.getAttribute("user") == null && "/web/beer".equals(request.getRequestURI())) {
//			response.sendRedirect("/web/user/login.html");
//			return false;
//		}

		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		logger.info(" ========== Interceptor postHandle End ==========");
//		System.out.println("테스트1: "+request.getHeader("referer"));
	}
}
