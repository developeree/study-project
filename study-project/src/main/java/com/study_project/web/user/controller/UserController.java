package com.study_project.web.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	//메인 페이지 전환용 메서드
	@RequestMapping(value="/main.html", method = RequestMethod.GET)
	public String main () {
		logger.info(" [ welcome main [GET, pageTransform] ] ");
		return "/main";
	}
	
	//회원가입 메이지 전환용 메서드
	@RequestMapping(value="/signup.html", method = RequestMethod.POST)
	public String signup () {
		logger.info(" [ welcome signup.html [GET, pageTransform] ] ");
		return "/user/signup";
	}
	
	//회원가입 처리 메서드
	@RequestMapping(value="/signup.do", method = RequestMethod.POST)
	public String signup (Model model, User user, @RequestParam(value="secondMail")String secondMail) {
		logger.info(" [ welcome signup.do [POST, pageTransform] ] ");
		boolean signupComplate = false;
		try {
			user.setMail(user.getMail()+"@"+secondMail);
			logger.info(user.toString());
			signupComplate = userService.insertUser(user);
			signupComplate = true;
			model.addAttribute("signupComplate", signupComplate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/signupComplate";
	}
	
	
	
	
	@RequestMapping(value="/terms", method = RequestMethod.GET)
	public String terms () {
		return "/user/terms";
	}

	
	//로그인 페이지 전환용 메서드
	@RequestMapping(value="/login.html", method = RequestMethod.GET)
	public String login (HttpServletRequest request, HttpSession session) {
		logger.info(" [ welcome login.html [GET, pageTransform] ] ");
		session.setAttribute("pageInfo", request.getHeader("referer"));
		String rememberURI=request.getHeader("referer");
		session.setAttribute("rememberURI", rememberURI);
		System.out.println("이전페이지: "+rememberURI);
		System.out.println("메소드: "+request.getMethod());
		return "/user/login";
	}

	//로그인 처리
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login (HttpSession session, HttpServletRequest request
			, @RequestParam("id") String id
			, @RequestParam("password") String password
			, HttpServletResponse res) throws Exception {
		logger.info(" [ welcome login.do ] ");
		
		String rememberURI=(String)session.getAttribute("rememberURI");
		User user = userService.loginUser(id, password, res);
		System.out.println("아이피: "+request.getRemoteAddr());
		
		if(user!=null){
			session.setAttribute("user", user);
			logger.info("[Model User value > ] " + user.toString());
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