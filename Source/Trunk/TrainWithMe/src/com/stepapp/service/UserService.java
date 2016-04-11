package com.stepapp.service;

import com.stepapp.entities.User;
import com.stepapp.entities.UserProfile;

public interface UserService {
 
    User findById(int id);
     
    User findBySso(String sso);
    
    void createUser(User user);
    
    UserProfile fetchProfile(String type);
     
}
