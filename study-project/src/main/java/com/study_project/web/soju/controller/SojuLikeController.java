package com.study_project.web.soju.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study_project.web.soju.model.SojuLike;
import com.study_project.web.soju.service.SojuLikeService;
import com.study_project.web.user.model.User;

@Controller
@RequestMapping("/soju")
public class SojuLikeController {
	private static final Logger logger = LoggerFactory.getLogger(SojuLikeController.class);
	
	@Autowired
	private SojuLikeService sojuLikeService;
	
	@RequestMapping(value="/like.ajax", method = RequestMethod.POST)
	public void likeInsert (@RequestParam("idx") Integer idx
			,@RequestParam ("likeStatus") String likeStatus
			,HttpSession session) throws Exception {
		logger.info(" [ welcome sojuLike likeInsert ] ");
		sojuLikeService.insertLike(idx, likeStatus, session);
	}
	
	@RequestMapping(value="/nolike.ajax", method = RequestMethod.POST)
	public void likeDelete (@RequestParam("soju_idx") Integer soju_idx,
			HttpSession session) throws Exception {
		logger.info(" [ welcome sojuLike likeDelete ] ");
		sojuLikeService.deleteLike(soju_idx, session);
	}
	
}
