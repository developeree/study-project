package com.study_project.web.soju.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.soju.dao.SojuDao;
import com.study_project.web.soju.model.Soju;

@Service
public class SojuServiceImpl implements SojuService {

	@Autowired
	private SojuDao sojuDao;

	@Override
	public List<Soju> selectSojuList(Map<String, Object> map) {
		return sojuDao.selectSojuList(map);
	}

	@Override
	public Integer insertSoju(Soju soju) {
		return sojuDao.insertSoju(soju);
	}
	
	
}
