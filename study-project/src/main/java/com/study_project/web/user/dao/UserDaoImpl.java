package com.study_project.web.user.dao;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study_project.web.user.model.User;



@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public User loginUser(User user, HttpServletResponse res){
		User resultUser = null;
		resultUser = session.selectOne("loginSql.login", user);
		
//		try{
//		if (resultUser == null) {
//			 res.sendRedirect("/web/user/loginfail.html"); 
//			System.out.println("여기드오냐: "+resultUser);
//		}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
		
		return resultUser;
	}
//	@Override
//	public User getUser(User user) {
//		User resultUser = null;
//		resultUser = session.selectOne("loginSql.login", user);
//		
//		if (resultUser == null) {
//			resultUser = new User();
//		}
//		
//		return resultUser;
//	}
}
