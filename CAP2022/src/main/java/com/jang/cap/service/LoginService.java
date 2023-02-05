package com.jang.cap.service;

import org.apache.ibatis.annotations.Param;

import com.jang.cap.model.UserVO;

public interface LoginService {
	
	UserVO findUser(UserVO userVO);
	
	UserVO getUser(String userId);

	int insertUser(UserVO userVO);
	
	int updateUser(UserVO userVO);

	UserVO findId(@Param("name")String name, @Param("email")String email);
	UserVO findPass(@Param("userId")String userId, @Param("email")String email);
    int updatePass(UserVO userVO);
}
