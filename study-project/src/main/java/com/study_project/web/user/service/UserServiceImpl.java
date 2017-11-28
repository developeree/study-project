package com.study_project.web.user.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.user.dao.UserDao;
import com.study_project.web.user.model.User;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public User loginUser(String id, String password, HttpServletResponse res) throws Exception{
		User set=new User();
		set.setId(id);
		set.setPassword(password);
		return userDao.loginUser(set,res);
	}

	
}
