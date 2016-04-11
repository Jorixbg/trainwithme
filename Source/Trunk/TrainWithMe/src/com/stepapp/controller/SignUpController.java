package com.stepapp.controller;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.stepapp.entities.State;
import com.stepapp.entities.User;
import com.stepapp.entities.UserProfile;
import com.stepapp.entities.UserProfileType;
import com.stepapp.service.UserService;

@Controller
public class SignUpController {
	
	@Autowired
	UserService userService;
	
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String sid;
	private String error;

	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView signupPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		model.setViewName("signup");
		return model;
	}
	
	@RequestMapping(value = "/signupaction", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView signupActionPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		if (!validateInputs(request)) {
			model.addObject("signUpError", error);
		}
		createUser();
		model.setViewName("signup");
		return model;
		
	}

	private void createUser() {
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setSsoId(sid);
		user.setPassword(password);
		user.setState(State.ACTIVE.getState());
		Set<UserProfile> userProfiles = new HashSet<UserProfile>();
		userProfiles.add(userService.fetchProfile(UserProfileType.USER.getUserProfileType()));
		user.setUserProfiles(userProfiles);
		userService.createUser(user);
		
	}

	private boolean validateInputs(HttpServletRequest req) {
		firstName = req.getParameter("first_name");
		lastName = req.getParameter("last_name");
		email = req.getParameter("email");
		password = req.getParameter("password");
		sid = req.getParameter("sid");
		if(StringUtils.isBlank(firstName) || StringUtils.isBlank(lastName) ||
				StringUtils.isBlank(email) || StringUtils.isBlank(password) || StringUtils.isBlank(sid)){
			error = "Missing input";
			return false;
		}
		
		return true;
	}
}
