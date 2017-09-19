package com.study_project.web.beer.service;

import java.util.List;

import com.study_project.web.beer.model.Beer;

public interface BeerService {
	public List<Beer> getBeerList();
	public Beer getBeerOne(Integer idx);
	public void writeBeer(Beer beer);
	public void modifyBeer(Beer beer);
	public void removeBeer(Integer idx);
}
