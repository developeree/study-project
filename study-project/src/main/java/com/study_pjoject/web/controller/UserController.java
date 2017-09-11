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
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login (HttpSession session) throws Exception {
		logger.info(" [ login.do ] ");
		User user = new User();
		logger.info("[Model User value > ] " + user.toString());
		user = userService.loginUser(user);
		return "";
	}
}