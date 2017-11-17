package com.study_project.web.soju.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study_project.web.soju.model.Soju;
import com.study_project.web.soju.model.SojuComment;

@Repository
public class SojuCommentDaoImpl implements SojuCommentDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int count(Integer idx) {
		Integer result = session.selectOne("sojuSql.commentCount", idx);
		return result;
	}

	@Override
	public void insertSojuComment(SojuComment sojuComment) {
		session.insert("sojuSql.insertSojuComment", sojuComment);
	}

	@Override
	public List<SojuComment> selectSojuCommentList(Integer idx) {
		List<SojuComment> resultList = session.selectList("sojuSql.selectSojuCommentList",idx);
		if (resultList == null) {
			resultList = new ArrayList<SojuComment>();
		}
		return resultList;
	}

	@Override
	public void deleteSojuComment(SojuComment sojuComment) {
		session.delete("sojuSql.deleteSojuComment", sojuComment);
	}

	@Override
	public void updateSojuComment(SojuComment sojuComment) {
		session.update("sojuSql.updateSojuComment", sojuComment);
	}
	
	
}
