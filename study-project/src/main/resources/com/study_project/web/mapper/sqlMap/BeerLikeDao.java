package com.study_project.web.mapper.sqlMap;

import java.sql.SQLException;
import java.util.List;

import com.study_project.web.beer.model.Like;

public interface BeerLikeDao {
	public List<Like> readLikeList(Integer user_id) throws SQLException;
	public Integer readLikeOne(Like like) throws SQLException;
	public void createLike(Like like) throws SQLException;
	public void deleteLike(Like like) throws SQLException;
}
