package com.twm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController{
 
	@RequestMapping("/welcome")
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
 
		ModelAndView model = new ModelAndView("home");
		model.addObject("msg", "WIP");
		model.addObject("name", "About");
 
		return model;
	}
}