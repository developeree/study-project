package com.study_project.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study_project.web.model.User;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public User loginUser(User user) {

		User resultUser = null;
		resultUser = session.selectOne("loginSql.login", resultUser);
		
		if (resultUser == null) {
			resultUser = new User();
		}
		
		return resultUser;

	}
	
}
