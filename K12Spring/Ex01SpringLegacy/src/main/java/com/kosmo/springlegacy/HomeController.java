package com.kosmo.springlegacy;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Home(Locale locale, Model model) {
		
		return "home";
	}
	
	
	//@RequestMapping(value = "/home/helloSpring", method = RequestMethod.GET)
	@RequestMapping("/home/helloSpring")
	public String helloSpring(Locale locale, Model model) {
		String firstMessage ="My First SPRING MVC 컨트롤러";
		
		
		model.addAttribute("firstMessage", firstMessage );
		
		return "HelloSpring";
	}

	
}
