package com.study_project.web.beer.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study_project.web.beer.model.Beer;

@Repository
public class BeerDaoImpl implements BeerDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public void createBeer(Beer beer) {
		session.insert("beer.createBeer", beer);
	}

}
