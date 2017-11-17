package com.study_project.web.beer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study_project.web.beer.model.Comment;
import com.study_project.web.beer.service.BeerCommentService;

@Controller
@RequestMapping("/beer")
public class BeerCommentController {
	private static final Logger logger = LoggerFactory.getLogger(BeerCommentController.class);

	@Autowired
	private BeerCommentService beerCommentService;
	
	//댓글쓰기로직
	@RequestMapping(value = "/{idx}/commentNew", method=RequestMethod.POST)
	public String doCommentWrite(@PathVariable("idx") Integer beer_id, Comment comment) throws Exception{
		comment.setBeer_id(beer_id);
		beerCommentService.writeComment(comment);
		logger.info("[ beerReg toString ] " + comment.toString());
		return "redirect:/beer/{idx}";
	}
	//댓글수정로직
	@RequestMapping(value = "/{idx}/comment/{comment_idx}/up", method=RequestMethod.POST)
	public String doCommentModify(@PathVariable("idx") Integer beer_id,@PathVariable("comment_idx") Integer comment_idx, Comment comment) throws Exception{
		System.out.println("글번호: "+beer_id);
		System.out.println("댓글번호: "+comment_idx);
		comment.setBeer_id(beer_id);
		comment.setComment_idx(comment_idx);
		beerCommentService.modifyComment(comment);
		logger.info("[ beerReg toString ] " + comment.toString());
		return "redirect:/beer/{idx}";
	}
	//댓글삭제로직
	@RequestMapping(value = "/{idx}/comment/{comment_idx}/del", method=RequestMethod.POST)
	public String doCommentRemove(@PathVariable("idx") Integer beer_id,@PathVariable("comment_idx") Integer comment_idx) throws Exception{
		System.out.println("글번호: "+beer_id);
		System.out.println("댓글번호: "+comment_idx);
		beerCommentService.removeComment(comment_idx);
		return "redirect:/beer/{idx}";
	}
}
