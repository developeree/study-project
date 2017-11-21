package com.study_project.web.beer.service;

import java.util.List;

import com.study_project.web.beer.model.Like;

public interface BeerLikeService {
	public List<Like> getLikeList(Integer user_id) throws Exception;
	public Like getLikeOne(Integer beer_id, Integer user_id) throws Exception;
	public void writeLike(Like like) throws Exception;
	public void removeLike(Integer beer_id, Integer user_id) throws Exception;
}
