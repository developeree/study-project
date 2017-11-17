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
	public int count(Map<String, Object> paramMap) {
		return session.selectOne("sojuSql.count", paramMap);
	}

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
		result = session.insert("sojuSql.insertSoju", soju);
		return result;
	}
	
	@Override
	public void insertSojuFile(Soju soju) {
		session.insert("sojuSql.insertSojuFile", soju);
	}

	@Override
	public List<Soju> selectSojuFile(Integer idx) {
		List<Soju> resultList = session.selectList("sojuSql.getSojuFileList",idx);
		if (resultList == null) {
			resultList = new ArrayList<Soju>();
		}
		return resultList;
	}

	@Override
	public Soju getSoju(Integer idx) {
		Soju result = null;
		result = session.selectOne("sojuSql.getSoju", idx);
		
		if (result == null) {
			result = new Soju();
		}
		return result;
	}

	@Override
	public Integer updateSoju(Soju soju) {
		Integer result = 0;
		result = session.update("sojuSql.updateSoju", soju);
		return result;
	}

	@Override
	public void deleteSoju(Integer idx) {
		session.delete("sojuSql.deleteSoju", idx);
	}
	
	
	
}
