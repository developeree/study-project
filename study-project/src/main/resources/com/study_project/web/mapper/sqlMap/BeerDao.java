package com.study_project.web.mapper.sqlMap;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study_project.web.beer.model.Beer;

public interface BeerDao {
	//getter, setter 없이 할렴 파라미터 필요한듯..
//	public List<Beer> readBeerList(@Param("search")String search,@Param("keyfield")String keyfield, @Param("pageNo")int pageNo) throws SQLException;
	public List<Beer> readBeerList(Beer beer) throws SQLException;
	public Beer readBeerOne(Integer idx) throws SQLException;
	public void createBeer(Beer beer) throws SQLException;
	public void updateBeer(Beer beer) throws SQLException;
	public void deleteBeer(Integer idx) throws SQLException;
//	public List<Beer> searchBeer(@Param("search")String search,@Param("keyfield")String keyfield) throws SQLException;
//	public int totalBeerCount(@Param("search")String search,@Param("keyfield")String keyfield) throws SQLException;
	public int totalBeerCount(Beer beer) throws SQLException;
	public void createMediaFile(Beer beer) throws SQLException;
}
