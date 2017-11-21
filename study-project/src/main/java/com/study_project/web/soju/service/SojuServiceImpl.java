package com.study_project.web.soju.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.soju.dao.SojuDao;
import com.study_project.web.soju.model.Soju;
import com.study_project.web.soju.model.SojuLike;
import com.study_project.web.user.model.User;

@Service
public class SojuServiceImpl implements SojuService {

	@Autowired
	private SojuDao sojuDao;
	
	@Override
	public int count(Map<String, Object> paramMap) {
		return sojuDao.count(paramMap);
	}

	@Override
	public List<Soju> selectSojuList(Map<String, Object> map) {
		return sojuDao.selectSojuList(map);
	}

	@Override
	public Integer insertSoju(Soju soju) {
		return sojuDao.insertSoju(soju);
	}

	@Override
	public void insertSojuFile(Soju soju) {
		sojuDao.insertSojuFile(soju);
	}

	@Override
	public List<Soju> selectSojuFile(Integer idx) {
		return sojuDao.selectSojuFile(idx);
	}

	@Override
	public Soju getSoju(Integer idx) {
		return sojuDao.getSoju(idx);
	}

	@Override
	public Integer updateSoju(Soju soju) {
		return sojuDao.updateSoju(soju);
	}

	@Override
	public void deleteSoju(Integer idx) {
		sojuDao.deleteSoju(idx);
	}

	@Override
	public String sojuLikeSelect(Integer idx, HttpSession session) {
		SojuLike sojuLike = new SojuLike();
		User user = (User)session.getAttribute("user");
		sojuLike.setSoju_idx(idx);
		sojuLike.setUser_id(user.getId());
		return sojuDao.sojuLikeSelect(sojuLike);
	}
	
}
