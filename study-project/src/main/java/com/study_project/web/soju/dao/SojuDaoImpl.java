package com.study_project.web.soju.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study_project.web.soju.model.Soju;

@Repository
public class SojuDaoImpl implements SojuDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Soju> selectSojuList(Map<String, Object> map) {
		List<Soju> resultList = null;
		resultList = session.selectList("sojuSql.selectSojuList", map);
		
		if (resultList == null) {
			resultList = new ArrayList<Soju>();
		}
		
		return resultList;
	}

	@Override
	public Integer insertSoju(Soju soju) {
		int result = 0;
		result = session.insert("sojuSql.insertSoju",soju);
		return result;
	}
	
	
	
}
