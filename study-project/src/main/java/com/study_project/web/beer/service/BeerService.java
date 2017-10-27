package com.study_project.web.beer.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.study_project.web.beer.model.Beer;

public interface BeerService {
//	public List<Beer> getBeerList(String search,String keyfield, int pageNo) throws Exception;
	public List<Beer> getBeerList(Beer beer) throws Exception;
	public Beer getBeerOne(Integer idx) throws Exception;
	public void writeBeer(Beer beer) throws Exception;
	public void modifyBeer(Beer beer) throws Exception;
	public void removeBeer(Integer idx) throws Exception;
//	public List<Beer> searchList(String search,String keyfield) throws Exception;
//	public int totalBeerCount(String search,String keyfield) throws Exception;
	public int totalBeerCount(Beer beer) throws Exception;
	public void fileBeer(Beer beer,  MultipartFile thumbnail, HttpSession session) throws Exception;
	public void filesBeer(Beer beer,  List<MultipartFile> media, HttpSession session) throws Exception;
}
