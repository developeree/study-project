package com.study_project.web.soju.dao;

import java.util.List;
import java.util.Map;

import com.study_project.web.soju.model.Soju;

public interface SojuDao {

	/**
	 * Soju 정보 목록을 불러온다.
	 * @param map (String, Object)
	 * 		searchCol, searchVal이 있는 경우 해당 항목만 가져옵니다.
	 * @return List of Soju
	 */
	public List<Soju> selectSojuList (Map<String, Object> map);
}
