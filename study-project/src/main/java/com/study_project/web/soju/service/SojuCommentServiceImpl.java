package com.study_project.web.soju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study_project.web.soju.dao.SojuCommentDao;
import com.study_project.web.soju.model.SojuComment;

@Service
public class SojuCommentServiceImpl implements SojuCommentService {
	@Autowired
	private SojuCommentDao sojuCommentDao;

	@Override
	public int count(Integer idx) {
		return sojuCommentDao.count(idx);
	}

	@Override
	public void insertSojuComment(SojuComment sojuComment) {
		sojuCommentDao.insertSojuComment(sojuComment);
	}

	@Override
	public List<SojuComment> selectSojuCommentList(Integer idx) {
		return sojuCommentDao.selectSojuCommentList(idx);
	}

	@Override
	public void deleteSojuComment(SojuComment sojuComment) {
		sojuCommentDao.deleteSojuComment(sojuComment);
	}

	@Override
	public void updateSojuComment(SojuComment sojuComment) {
		sojuCommentDao.updateSojuComment(sojuComment);
	}
	
	
}
