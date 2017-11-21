package com.study_project.web.soju.service;

import javax.servlet.http.HttpSession;


public interface SojuLikeService {

	/**
	 * 소주글으 좋아요 등록.
	 * @param SojuLike (model)
	 * @return void
	 */
	public void insertLike (Integer idx, String likeStatus, HttpSession session);
	
	/**
	 * 소주글으 좋아요 삭제.
	 * @param SojuLike (model)
	 * @return void
	 */
	public void deleteLike (Integer soju_idx, HttpSession session);
}
