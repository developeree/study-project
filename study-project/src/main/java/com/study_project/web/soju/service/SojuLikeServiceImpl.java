package com.study_project.web.soju.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.soju.dao.SojuLikeDao;
import com.study_project.web.soju.model.SojuLike;
import com.study_project.web.user.model.User;

@Service
public class SojuLikeServiceImpl implements SojuLikeService {
	
	@Autowired
	private SojuLikeDao sojuLikeDao;

	@Override
	public void insertLike(Integer idx, Integer likeStatus, HttpSession session) {
		SojuLike sojuLike = new SojuLike();
		User user = (User)session.getAttribute("user");
		sojuLike.setUser_idx(user.getIdx());
		sojuLike.setUser_id(user.getId());
		sojuLike.setSoju_idx(idx);
		sojuLike.setStatus(likeStatus);
		sojuLikeDao.insertLike(sojuLike);
	}

	@Override
	public void deleteLike(SojuLike sojuLike) {
		sojuLikeDao.deleteLike(sojuLike);
	}
	
}