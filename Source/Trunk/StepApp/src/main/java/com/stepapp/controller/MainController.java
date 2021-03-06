package com.stepapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stepapp.clients.TestClientGet;

@Controller
public class MainController{
 
	@RequestMapping("/home")
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
}