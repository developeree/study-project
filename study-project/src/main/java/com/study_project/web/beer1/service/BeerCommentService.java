package com.study_project.web.beer.service;

import java.util.List;

import com.study_project.web.beer.model.Comment;

public interface BeerCommentService {
	public List<Comment> getCommentList(Integer beer_id) throws Exception;
	public Comment getCommentOne(Integer comment_idx) throws Exception;
	public void writeComment(Comment comment) throws Exception;
	public void modifyComment(Comment comment) throws Exception;
	public void removeComment(Integer comment_idx) throws Exception;
}
