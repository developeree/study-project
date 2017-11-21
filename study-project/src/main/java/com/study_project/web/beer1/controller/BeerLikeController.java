package com.study_project.web.beer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study_project.web.beer.model.Like;
import com.study_project.web.beer.service.BeerLikeService;
import com.study_project.web.user.model.User;

@Controller
@RequestMapping("/beer")
public class BeerLikeController {
	
	@Autowired
	private BeerLikeService beerLikeService;
	
	@RequestMapping(value = "/{idx}/like", method=RequestMethod.POST)
	public String doLike(@PathVariable("idx") Integer beer_id, Like like, HttpSession session, @RequestParam("likeStatus") Integer likeStatus) throws Exception{
		like.setBeer_id(beer_id);
		System.out.println("라이크한글번호: "+like.getBeer_id());
		User user=(User) session.getAttribute("user");
		like.setUser_id(user.getIdx());
		System.out.println("라이크한유저: "+like.getUser_id());
		System.out.println("좋아요: "+likeStatus);
		like.setLike_status(likeStatus);
		beerLikeService.writeLike(like);
		return "redirect:/beer/{idx}";
	}
	
	@RequestMapping(value = "/{idx}/like/cancle", method=RequestMethod.POST)
	public String doLikeCancle(@PathVariable("idx") Integer beer_id, HttpSession session) throws Exception{
		System.out.println("드오냐");
		User user=(User) session.getAttribute("user");
		beerLikeService.removeLike(beer_id, user.getIdx());
		return "redirect:/beer/{idx}";
	}
}
