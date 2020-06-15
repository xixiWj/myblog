package com.wj.blog.service.impl;

import com.wj.blog.common.domain.User;
import com.wj.blog.common.domain.UserException;
import com.wj.blog.dao.UserMapper;
import com.wj.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = true,propagation = Propagation.SUPPORTS)
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	public User checkName(String user_name) {
		return userMapper.findUserByName(user_name);
	}

	@Override
	public List<User> findAllUser() {
		return userMapper.findAll();
	}

	@Transactional(rollbackFor = Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
	@Override
	public void register(User user) {
		userMapper.insert(user);
	}
	
	public User login(User user) throws UserException {
		User user1 = userMapper.findUserByName(user.getUserName());
		if(user1==null) {
			throw new UserException("用户名或密码错误！");
		}else if(!user.getUserPassword().equals(user1.getUserPassword())) {
			throw new UserException("用户名或密码错误！");
		}else {
			return user1;
		}
	}

	@Override
	public User findByName(String username) {
		User user =null;
		try {
			user= userMapper.findUserByName(username);
		}catch (Exception e){

		}finally {
			return user;
		}

	}

	@Override
	public void update(User user, boolean b, String userId) {
		userMapper.updateByPrimaryKeySelective(user);
	}
}
