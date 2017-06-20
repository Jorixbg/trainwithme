package com.leaps.service;

import com.leaps.entities.User;
import com.leaps.entities.UserProfile;

public interface UserService {
 
    User findById(int id);
     
    User findBySso(String sso);
    
    void createUser(User user);
    
    UserProfile fetchProfile(String type);
     
}
