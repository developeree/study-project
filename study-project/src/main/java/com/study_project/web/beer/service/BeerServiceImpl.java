package com.study_project.web.beer.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.beer.model.Beer;
import com.study_project.web.mapper.sqlMap.BeerDao;

@Service
public class BeerServiceImpl implements BeerService{
	@Autowired
	private BeerDao beerDao;

//	@Override
//	public List<Beer> getBeerList(String search, String keyfield, int pageNo) throws Exception{
//		pageNo=(pageNo-1)*5;
//		return beerDao.readBeerList(search, keyfield, pageNo);
//	}
	
	
	@Override
	public List<Beer> getBeerList(Beer beer) throws Exception{
		return beerDao.readBeerList(beer);
	}
	

	@Override
	public Beer getBeerOne(Integer idx) throws Exception{
		return beerDao.readBeerOne(idx);
	}

	@Override
	public void writeBeer(Beer beer) throws Exception{
		beerDao.createBeer(beer);
	}

	@Override
	public void modifyBeer(Beer beer) throws Exception{
		beerDao.updateBeer(beer);
	}

	@Override
	public void removeBeer(Integer idx) throws Exception{
		beerDao.deleteBeer(idx);
	}

//	@Override
//	public List<Beer> searchList(String search,String keyfield) throws Exception{
//		return beerDao.searchBeer(search,keyfield);
//	}

//	@Override
//	public int totalBeerCount(String search,String keyfield) throws Exception{
//		return beerDao.totalBeerCount(search, keyfield);
//	}
	
	@Override
	public int totalBeerCount(Beer beer) throws Exception{
		return beerDao.totalBeerCount(beer);
	}
	
}
