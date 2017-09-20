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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study_project.web.soju.model.Soju;
import com.study_project.web.soju.service.SojuService;


@Controller
@RequestMapping("/soju")
public class SojuController {
	
	private static final Logger logger = LoggerFactory.getLogger(SojuController.class);
	
	@Autowired
	private SojuService sojuService;
	
	//글목록
	@RequestMapping(method = RequestMethod.GET)
	public String sojuList (HttpSession session, Model model) throws Exception {
		logger.info("[ welcome soju ]");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<Soju> sojuList = sojuService.selectSojuList(paramMap);
		
		for (Soju soju : sojuList) {
			logger.info(soju.toString());
		}
		
		model.addAttribute("sojuList", sojuList);
		return "soju/sojuList";
	}
	
	//글쓰기 입력폼으로 이동
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public String sojuRegForm (HttpSession session, Model model,
			@PathVariable(value="idx") Integer idx) throws Exception {
		logger.info("[ welcome sojuReg ]");
		System.out.println("if 밖에서 idx = " + idx);
		if ( idx != 0 || idx != null) {
			System.out.println("if 안에서 idx = " + idx);
			Soju soju = sojuService.getSoju(idx);
			model.addAttribute("soju", soju);
		}
			
		return "soju/sojuReg";
	}
	
	//상세보기 입력폼전환
	@RequestMapping(value="/board/{idx}", method = RequestMethod.GET)
	public String detail (@PathVariable("idx") Integer idx, Model model) throws Exception {
		logger.info("[ welcome sojuDetailForm ]");
		Soju soju = sojuService.getSoju(idx);
		model.addAttribute("soju", soju);
		return "/soju/sojuDetail";
	}
	
	//소주 db입력
	@RequestMapping(value="/board", method = RequestMethod.POST)
	public String sojuReg (HttpSession session, Soju soju) throws Exception {
		logger.info("[ welcome sojuReg logic ]");
		try{
			sojuService.insertSoju(soju);
			logger.info("[ sojuReg toString ] " + soju.toString());
		} catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/soju";
	}
	
	//삭제
	@RequestMapping(value="/board/{idx}", method = RequestMethod.DELETE)
	public String delete (@PathVariable("idx") Integer idx) throws Exception {
		logger.info("[ welcome sojuDelete ]");
		sojuService.deleteSoju(idx);
		return "redirect:/soju";
	}
	
	
}
