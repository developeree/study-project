package com.study_project.web.user.service;

import com.study_project.web.user.model.User;



public interface UserService {

	/**
	 * 사용자 로그인 정보를 얻어옵니다.
	 * @param User
	 * 			User model이 정의되어야 합니다.
	 * @return User
	 */
	public User loginUser (User user);
}
