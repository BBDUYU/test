package com.jang.cap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.cap.mapper.LoginMapper;
import com.jang.cap.model.UserVO;

@Service(value = "loginService")
public class LoginServiceImpl implements LoginService {
	
  @Autowired
  private LoginMapper loginMapper;
	
	@Override
	public UserVO findUser(UserVO userVO) {
		return loginMapper.findUser(userVO);

	}

	@Override
	public UserVO getUser(String userId) {
		return loginMapper.getUser(userId);

	}

	@Override
	public int insertUser(UserVO userVO) {
		return loginMapper.insertUser(userVO);

	}

	@Override
	public int updateUser(UserVO userVO) {
		return loginMapper.updateUser(userVO);

	}

	@Override
	public UserVO findId(String name, String email) {
		return loginMapper.findId(name, email);

	}

	@Override
	public UserVO findPass(String userId, String email) {
		return loginMapper.findPass(userId, email);

	}

	@Override
	public int updatePass(UserVO userVO) {
		return loginMapper.updatePass(userVO);

	}
	

}
