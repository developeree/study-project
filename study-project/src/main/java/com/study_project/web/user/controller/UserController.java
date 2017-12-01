package com.study_project.web.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study_project.web.user.model.User;
import com.study_project.web.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
//	private String rememberURI;

	//메인 페이지 전환용 메서드
	@RequestMapping(value="/main.html", method = RequestMethod.GET)
	public String main () {
		logger.info(" [ welcome main [GET, pageTransform] ] ");
		return "/main";
	}
	@RequestMapping(value="/terms", method = RequestMethod.GET)
	public String terms () {
		return "/user/terms";
	}

	//로그인 페이지 전환용 메서드
	@RequestMapping(value="/login.html", method = RequestMethod.GET)
	public String login (HttpServletRequest request, HttpSession session) {
		logger.info(" [ welcome login.html [GET, pageTransform] ] ");
		String rememberURI=request.getHeader("referer");
		session.setAttribute("rememberURI", rememberURI);
		System.out.println("이전페이지: "+rememberURI);
		System.out.println("메소드: "+request.getMethod());
		return "/user/login";
	}

	//로그인 처리
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login (HttpSession session, HttpServletRequest request, @RequestParam("id") String id, @RequestParam("password") String password, HttpServletResponse res) throws Exception {
		logger.info(" [ welcome login.do ] ");
//		if(id==null||password==null||(id==null&&password==null)){
//			System.out.println("어디서 에러야");
//			return "/user/loginfail";
//		}
		String rememberURI=(String)session.getAttribute("rememberURI");
		User user = userService.loginUser(id, password, res);
		System.out.println("아이피: "+request.getRemoteAddr());
		System.out.println("리턴주소: "+rememberURI);
		if(user!=null){
		session.setAttribute("user", user);
		System.out.println("유저정보: "+user);
		return "redirect:"+rememberURI;
		}
		return "redirect:/user/loginfail.html";
	}
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String doLogout(HttpSession session){
		session.invalidate();
		return "redirect:/user/main.html";
	}
	@RequestMapping(value="/loginfail.html", method = RequestMethod.GET)
	public String logfail(HttpSession session){
		System.out.println("로그인실패");
		return "/user/loginfail";
	}
}