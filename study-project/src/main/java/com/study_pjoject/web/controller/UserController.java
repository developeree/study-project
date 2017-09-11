package com.study_pjoject.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study_pjoject.web.model.User;
import com.study_pjoject.web.service.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	//로그인 처리
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login (HttpSession session, User user) throws Exception {
		logger.info(" [ welcome login.do ] ");
		logger.info("[Model User value > ] " + user.toString());
		user = userService.loginUser(user);
		session.setAttribute("user", user);
		
		return "user/loginsuccesstest";
	}
}