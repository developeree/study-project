package com.study_pjoject.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study_pjoject.web.dao.UserDao;
import com.study_pjoject.web.model.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public User loginUser(User user) {
		return userDao.loginUser(user);
	}

	
}
