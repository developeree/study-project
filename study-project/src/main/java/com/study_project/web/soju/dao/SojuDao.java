package com.study_project.web.soju.dao;

import java.util.List;
import java.util.Map;

import com.study_project.web.soju.model.Soju;

public interface SojuDao {
	
	/**
	 * 등록된 소주정보 글정보의  전체 갯수를 얻어옵니다.
	 * @param paramMap
	 * 			searchCol, searchVal이 있는 경우 해당 항목만 가져옵니다.
	 * @return count :: int
	 */
	public int count(Map<String, Object> paramMap);
	
	/**
	 * Soju 정보 목록을 불러온다.
	 * @param map (String, Object)
	 * 		searchCol, searchVal이 있는 경우 해당 항목만 가져옵니다.
	 * @return List of Soju
	 */
	public List<Soju> selectSojuList (Map<String, Object> map);
	
	/**
	 * 소주 정보를 등록한다.
	 * @param Soju (model)
	 * @return int insertResult
	 */
	public Integer insertSoju (Soju soju);
	
	/**
	 * 소주 파일정보를 등록한다.
	 * @param Soju (model)
	 * @return void
	 */
	public void insertSojuFile (Soju soju);
	
	/**
	 * 선택된 소주 정보의 파일을 불러온다.
	 * @param idx(idx)
	 * @return Soju_file
	 */
	public List<Soju> selectSojuFile (Integer idx);
	
	/**
	 * 선택된 소주 정보를 불러온다.
	 * @param ntmPid(idx)
	 * @return Soju
	 */
	public Soju getSoju (Integer idx);
	
	/**
	 * 소주 정보를 수정한다.
	 * @param Soju
	 * @return Integer updateResult
	 */
	public Integer updateSoju (Soju soju);
	
	/**
	 * 소주 정보를 삭제한다.
	 * @param Soju
	 * @return void
	 */
	public void deleteSoju (Integer idx);
}
