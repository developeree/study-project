package com.study_project.web.soju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study_project.web.soju.model.Soju;
import com.study_project.web.soju.service.SojuService;


@Controller
public class SojuController {
	
	private static final Logger logger = LoggerFactory.getLogger(SojuController.class);
	
	@Autowired
	private SojuService sojuService;
	
	//글목록
	@RequestMapping(value="/soju.html", method = RequestMethod.GET)
	public String sojuList (HttpSession session, Model model) throws Exception {
		logger.info("[ welcome sojuList.html ]");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<Soju> sojuList = sojuService.selectSojuList(paramMap);
		
		for (Soju soju : sojuList) {
			logger.info(soju.toString());
		}
		
		model.addAttribute("sojuList", sojuList);
		return "soju/sojuList";
	}
	
	//입력
	@RequestMapping(value="/sojuReg.html", method = RequestMethod.GET)
	public String sojuReg (HttpSession session) throws Exception {
		logger.info("[ welcome soju,html ]");
		return "soju/sojuReg";
	}
	
	public String sojuReg1 (HttpSession session) throws Exception {
		
		return "redirect:/image.html";
	}
	
}
