package com.stepapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stepapp.dao.UserDao;
import com.stepapp.dao.UserProfileDao;
import com.stepapp.entities.User;
import com.stepapp.entities.UserProfile;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	@Autowired
	private UserProfileDao userProfileDao;

	public User findById(int id) {
		return dao.findById(id);
	}

	public User findBySso(String sso) {
		return dao.findBySSO(sso);
	}

	@Override
	public void createUser(User user) {
		dao.createUser(user);
	}

	@Override
	public UserProfile fetchProfile(String type) {
		return userProfileDao.fetchProfile(type);
	}

}
