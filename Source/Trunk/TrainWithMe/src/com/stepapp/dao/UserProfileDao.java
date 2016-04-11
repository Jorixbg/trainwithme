package com.stepapp.dao;

import com.stepapp.entities.UserProfile;

public interface UserProfileDao {

	UserProfile fetchProfile(String type);
}
