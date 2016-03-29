package com.twm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.twm.clients.TestClientGet;
import com.twm.utils.UserUtils;

@Controller
public class MainController{
 
	@RequestMapping({ "/", "/home" })
//	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView helloWorld(){
 
		ModelAndView model = new ModelAndView("home");
		model.addObject("msg", "WIP");
		model.addObject("name", "George");
 
		return model;
	}
	
	@RequestMapping("/about")
//	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView helloAbout(){
 
		ModelAndView model = new ModelAndView("about");
		model.addObject("msg", "WIP");
		model.addObject("name", "About");
 
		return model;
	}
	
	@RequestMapping("/name")
//	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView persistTest(HttpServletRequest request, 
	        HttpServletResponse response){
		
		String name = request.getParameter("name");
		TestClientGet.sendNameGet(name);
		ModelAndView model = new ModelAndView("home");
		model.addObject("msg", "WIP");
		model.addObject("name", "About");
 
		return model;
	}
	
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("message", "This is protected page - Admin Page!");
		model.setViewName("admin");

		return model;

	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}
}