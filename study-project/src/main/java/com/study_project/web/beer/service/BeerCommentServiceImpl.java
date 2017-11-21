package com.study_project.web.beer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.beer.model.Beer;
import com.study_project.web.beer.model.Comment;
import com.study_project.web.mapper.sqlMap.BeerCommentDao;
import com.study_project.web.mapper.sqlMap.BeerDao;

@Service
public class BeerCommentServiceImpl implements BeerCommentService{
	@Autowired
	private BeerCommentDao beerCommentDao;
	@Autowired
	private BeerDao beerDao;
	
	@Override
	public List<Comment> getCommentList(Integer beer_id) throws Exception {
		return beerCommentDao.readCommentList(beer_id);
	}

	@Override
	public Comment getCommentOne(Integer comment_idx) throws Exception {
		return beerCommentDao.readCommentOne(comment_idx);
	}
	
	@Override
	public void writeComment(Comment comment) throws Exception {
		Beer beer=beerDao.readBeerOne(comment.getBeer_id());
		beer.setComment_count(beer.getComment_count()+1);
		beerDao.updateBeer(beer);
		beerCommentDao.createComment(comment);
	}

	@Override
	public void modifyComment(Comment comment) throws Exception {
		beerCommentDao.updateComment(comment);
	}

	@Override
	public void removeComment(Integer comment_idx) throws Exception {
		Comment get=beerCommentDao.readCommentOne(comment_idx);
		System.out.println("삭제정보: "+get);
		Beer beer=beerDao.readBeerOne(get.getBeer_id());
		beer.setComment_count(beer.getComment_count()-1);
		beerDao.updateBeer(beer);
		beerCommentDao.deleteComment(get.getComment_idx());
	}
}
