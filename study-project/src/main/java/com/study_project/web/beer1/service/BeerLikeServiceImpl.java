package com.study_project.web.beer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.beer.model.Like;
import com.study_project.web.mapper.sqlMap.BeerLikeDao;

@Service
public class BeerLikeServiceImpl implements BeerLikeService{
	@Autowired
	private BeerLikeDao beerLikeDao;

	@Override
	public List<Like> getLikeList(Integer user_id) throws Exception {
		return beerLikeDao.readLikeList(user_id);
	}

	@Override
	public Like getLikeOne(Integer beer_id, Integer user_id) throws Exception {
		Like set=new Like();
		set.setBeer_id(beer_id);
		set.setUser_id(user_id);
//		System.out.println("비어 아이디: "+beer_id);
//		System.out.println("유저 아이디: "+user_id);
		return beerLikeDao.readLikeOne(set);
	}

	@Override
	public void writeLike(Like like) throws Exception {
		beerLikeDao.createLike(like);
	}

	@Override
	public void removeLike(Integer beer_id, Integer user_id) throws Exception {
		Like set=new Like();
		set.setBeer_id(beer_id);
		set.setUser_id(user_id);
		beerLikeDao.deleteLike(set);
	}
}
