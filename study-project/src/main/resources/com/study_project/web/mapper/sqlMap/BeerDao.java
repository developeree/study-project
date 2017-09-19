package com.study_project.web.mapper.sqlMap;

import java.util.List;

import com.study_project.web.beer.model.Beer;

public interface BeerDao {
	public List<Beer> readBeerList();
	public Beer readBeerOne(Integer idx);
	public void createBeer(Beer beer);
	public void updateBeer(Beer beer);
	public void deleteBeer(Integer idx);
}
