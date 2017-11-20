package com.study_project.web.soju.service;

import javax.servlet.http.HttpSession;

import com.study_project.web.soju.model.SojuLike;

public interface SojuLikeService {

	/**
	 * 소주글으 좋아요 등록.
	 * @param SojuLike (model)
	 * @return void
	 */
	public void insertLike (Integer idx, Integer likeStatus, HttpSession session);
	
	/**
	 * 소주글으 좋아요 삭제.
	 * @param SojuLike (model)
	 * @return void
	 */
	public void deleteLike (SojuLike sojuLike);
}
