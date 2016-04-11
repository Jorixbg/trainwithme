package com.stepapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.stepapp.clients.TestClientGet;

@Controller
public class MainController {

	@RequestMapping(value = { "/", "/home" }, method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("home");
		model.addObject("user", getPrincipal());

		return model;
	}

	@RequestMapping(value = "/about", method = { RequestMethod.POST, RequestMethod.GET })
	// @RequestMapping(method = RequestMethod.GET)
	public ModelAndView helloAbout() {

		ModelAndView model = new ModelAndView("about");
		model.addObject("name", "About");
		model.addObject("user", getPrincipal());

		return model;
	}

	@RequestMapping("/name")
	public ModelAndView persistTest(HttpServletRequest request, HttpServletResponse response) {

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

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/fbauth", method = RequestMethod.GET)
	public ModelAndView fbAuthenticate(HttpServletRequest request, HttpServletResponse response) {

		String token = request.getParameter("token");
		if (StringUtils.isNotBlank(token)) {
			request.getSession().setAttribute("fbToken", token);
			// TODO store token
		}

		ModelAndView model = new ModelAndView();
		model.setViewName("home");
		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		if (userName.equals("anonymousUser")) {
			return null;
		}
		return userName;
	}
}