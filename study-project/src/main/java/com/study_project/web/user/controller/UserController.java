package com.study_project.web.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study_project.web.user.model.User;
import com.study_project.web.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	//메인 페이지 전환용 메서드
	@RequestMapping(value="/main.html", method = RequestMethod.GET)
	public String main () {
		logger.info(" [ welcome main [GET, pageTransform] ] ");
		return "/main";
	}
	
	//로그인 페이지 전환용 메서드
	@RequestMapping(value="/login.html", method = RequestMethod.GET)
	public String login (HttpServletRequest request, HttpSession session) {
		logger.info(" [ welcome login.html [GET, pageTransform] ] ");
		session.setAttribute("pageInfo", request.getHeader("referer"));
		return "/user/login";
	}
	
	//로그인 처리
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login (HttpSession session, User user, HttpServletRequest request) throws Exception {
		logger.info(" [ welcome login.do ] ");
		user = userService.loginUser(user);
		System.out.println("아이피: "+request.getRemoteAddr());
		if(user!=null){
			session.setAttribute("user", user);
			logger.info("[Model User value > ] " + user.toString());
			String pageInfo = (String)session.getAttribute("pageInfo");
			int extIdx = pageInfo.lastIndexOf("web")+3;
			String pageSelect = pageInfo.substring(extIdx);
			return "redirect:"+pageSelect;
		}
		return "redirect:/user/loginfail";
	}
	  @RequestMapping(value="/logout", method = RequestMethod.GET)
	  public String doLogout(HttpSession session){
		session.invalidate();
	    return "/main";
	  }
}