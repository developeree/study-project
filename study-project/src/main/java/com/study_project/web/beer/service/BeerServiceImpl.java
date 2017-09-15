package com.study_project.web.beer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.beer.dao.BeerDao;
import com.study_project.web.beer.model.Beer;

@Service
public class BeerServiceImpl implements BeerService{
	@Autowired
	private BeerDao beerDao;
	
	@Override
	public void writeBeer(Beer beer) {
		beerDao.createBeer(beer);
	}
}
