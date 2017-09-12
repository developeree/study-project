package com.study_project.web.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_project.web.user.dao.UserDao;
import com.study_project.web.user.model.User;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public User loginUser(User user) {
		return userDao.loginUser(user);
	}

	
}
