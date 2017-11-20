package com.study_project.web.soju.dao;

import com.study_project.web.soju.model.SojuLike;

public interface SojuLikeDao {

	/**
	 * 소주글으 좋아요 등록.
	 * @param SojuLike (model)
	 * @return void
	 */
	public void insertLike (SojuLike sojuLike);
	
	/**
	 * 소주글으 좋아요 삭제.
	 * @param SojuLike (model)
	 * @return void
	 */
	public void deleteLike (SojuLike sojuLike);
}
