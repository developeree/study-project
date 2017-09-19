package com.study_project.web.beer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.beer.model.Beer;
import com.study_project.web.mapper.sqlMap.BeerDao;

@Service
public class BeerServiceImpl implements BeerService{
	@Autowired
	private BeerDao beerDao;

	@Override
	public List<Beer> getBeerList() {
		return beerDao.selectBeerList();
	}

	@Override
	public Beer getBeerOne(Integer idx) {
		return beerDao.readBeer(idx);
	}

	@Override
	public void writeBeer(Beer beer) {
		beerDao.createBeer(beer);
	}

	@Override
	public void modifyBeer(Beer beer) {
		beerDao.updateBeer(beer);
	}

	@Override
	public void removeBeer(Integer idx) {
		beerDao.deleteBeer(idx);
	}
	

}
