package com.study_project.web.soju.service;

import java.util.List;
import java.util.Map;

import com.study_project.web.soju.model.Soju;

public interface SojuService {

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
