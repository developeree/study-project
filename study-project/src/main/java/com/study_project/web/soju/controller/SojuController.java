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
		return "/soju/sojuList";
	}
	
	//상세보기 입력폼전환
	@RequestMapping(value="/{idx}", method = RequestMethod.GET)
	public String detailForm (@PathVariable("idx") Integer idx, Model model) throws Exception {
		logger.info("[ welcome sojuDetailForm ]");
		Soju soju = sojuService.getSoju(idx);
		model.addAttribute("soju", soju);
		return "/soju/sojuDetail";
	}
	
	//글쓰기로 페이지전환
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public String insertForm (HttpSession session, Model model) throws Exception {
		logger.info("[ welcome sojuReg ]");
		return "/soju/sojuReg";
	}
	
	//수정하기로 페이지전환
	@RequestMapping(value="/board/{idx}", method = RequestMethod.GET)
	public String modifyForm (@PathVariable(value="idx") Integer idx, Model model) throws Exception {
		logger.info("[ wecome sojuModifyForm ]");
		Soju soju = sojuService.getSoju(idx);
		model.addAttribute("soju", soju);
		return "/soju/sojuReg";
	}
	
	//글쓰기 로직 수행
	@RequestMapping(value="/board", method = RequestMethod.POST)
	public String insert (HttpSession session, Soju soju) throws Exception {
		logger.info("[ welcome sojuReg logic ]");
		try{
			sojuService.insertSoju(soju);
			logger.info("[ sojuReg toString ] " + soju.toString());
		} catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/soju";
	}
	
	@RequestMapping(value="/board/{idx}", method = RequestMethod.PATCH)
	public String modify (@PathVariable("idx") Integer idx, Soju soju) throws Exception {
		sojuService.updateSoju(soju);
		return "redirect:/soju";
	}
	
	//삭제 로직 수행
	@RequestMapping(value="/board/{idx}", method = RequestMethod.DELETE)
	public String delete (@PathVariable("idx") Integer idx) throws Exception {
		logger.info("[ welcome sojuDelete ]");
		sojuService.deleteSoju(idx);
		return "redirect:/soju";
	}
	
	
	
	
}
