package com.study_project.web.mapper.sqlMap;

import java.sql.SQLException;
import java.util.List;

import com.study_project.web.beer.model.Comment;

public interface BeerCommentDao {
	public List<Comment> readCommentList(Integer beer_id) throws SQLException;
	public Comment readCommentOne(Integer comment_idx) throws SQLException;
	public void createComment(Comment comment) throws SQLException;
	public void updateComment(Comment comment) throws SQLException;
	public void deleteComment(Integer comment_idx) throws SQLException;
}
