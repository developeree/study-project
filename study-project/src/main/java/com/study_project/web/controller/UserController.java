package com.study_project.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study_project.web.model.User;
import com.study_project.web.service.UserService;



@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="main", method = RequestMethod.GET)
	public String main () {
		logger.info(" [ welcome main ] ");
		return "main";
	}
	
	@RequestMapping(value="login.html", method = RequestMethod.GET)
	public String login () {
		logger.info(" [ welcome login.html ] ");
		return "user/login";
	}
	
	//로그인 처리
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String login (HttpSession session, User user) throws Exception {
		logger.info(" [ welcome login.do ] ");
		user = userService.loginUser(user);
		if(user!=null){
		session.setAttribute("user", user);
		logger.info("[Model User value > ] " + user.toString());
		 return "redirect:/main";
		}
		return "redirect:/loginfail";
	}
}