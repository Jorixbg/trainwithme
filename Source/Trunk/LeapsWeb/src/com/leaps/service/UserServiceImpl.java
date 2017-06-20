package com.leaps.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leaps.dao.UserDao;
import com.leaps.dao.UserProfileDao;
import com.leaps.entities.User;
import com.leaps.entities.UserProfile;

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
