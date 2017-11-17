package com.study_project.web.soju.dao;

import java.util.List;
import java.util.Map;

import com.study_project.web.soju.model.SojuComment;

public interface SojuCommentDao {
	
	/**
	 * 해당 상품평 글번호의 전체갯수를 불러옵니다.
	 * @param Integer idx
	 * @return count :: int
	 */
	public int count(Integer idx);
	
	/**
	 * 소주글의 상품평을 등록한다.
	 * @param SojuComment (model)
	 * @return int insertResult
	 */
	public void insertSojuComment (SojuComment sojuComment);
	
	/**
	 * 선택된 소주 정보의 상품평의 목록을 불러온다.
	 * @param idx(idx)
	 * @return List<SojuComment>
	 */
	public List<SojuComment> selectSojuCommentList (Integer idx);
	
	/**
	 * 소주 상품평을 삭제한다.
	 * @param SojuComment (model)
	 * @return void
	 */
	public void deleteSojuComment (SojuComment sojuComment);
	
	/**
	 * 소주 상품평을 갱신한다.
	 * @param SojuComment (model)
	 * @return void
	 */
	public void updateSojuComment (SojuComment sojuComment);
}
