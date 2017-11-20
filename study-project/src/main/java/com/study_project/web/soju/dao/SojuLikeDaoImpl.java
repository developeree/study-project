package com.study_project.web.soju.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study_project.web.soju.model.SojuLike;

@Repository
public class SojuLikeDaoImpl implements SojuLikeDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insertLike(SojuLike sojuLike) {
		session.insert("sojuLikeSql.sojuLikeInsert", sojuLike);
	}

	@Override
	public void deleteLike(SojuLike sojuLike) {
		session.delete("sojuLikeSql.sojuLikeDelete", sojuLike);
	}
	
}
