package com.study_project.web.user.dao;

import javax.servlet.http.HttpServletResponse;

import com.study_project.web.user.model.User;





public interface UserDao {
	
	/**
	 * 사용자 로그인 정보를 얻어옵니다.
	 * @param User
	 * 			User model이 정의되어야 합니다.
	 * @return User
	 */
	public User loginUser(User user, HttpServletResponse res) throws Exception;
//	public User getUser(User user);
	
	/**
	 * 새로운 사용자를 등록합니다.
	 * @param User
	 * 			User model이 정의되어야 합니다.
	 * @return boolean
	 */
	public boolean insertUser (User user) throws Exception;
}
