package com.leaps.dao;

import com.leaps.entities.User;

public interface UserDao {

	User findById(int id);

	User findBySSO(String sso);

	void createUser(User user);

}
