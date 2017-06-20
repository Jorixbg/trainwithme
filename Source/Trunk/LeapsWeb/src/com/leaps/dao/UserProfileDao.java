package com.leaps.dao;

import com.leaps.entities.UserProfile;

public interface UserProfileDao {

	UserProfile fetchProfile(String type);
}
