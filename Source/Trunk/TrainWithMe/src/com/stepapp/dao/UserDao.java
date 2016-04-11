package com.stepapp.dao;

import com.stepapp.entities.User;

public interface UserDao {

	User findById(int id);

	User findBySSO(String sso);

	void createUser(User user);

}
