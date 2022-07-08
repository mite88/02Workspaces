package com.nakja.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value="/", method = {RequestMethod.GET, RequestMethod.POST})
	private String home() {
		System.out.println("Spring MVC Project 완성");	
		return "home";
	}
}
