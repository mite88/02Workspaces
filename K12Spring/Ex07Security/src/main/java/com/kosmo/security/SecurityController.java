package com.kosmo.security;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {
/*
	@RequestMapping("/security1-1/index.do")
	public String security1() {
		return "09Security/Step1/index";
	}

	@RequestMapping("/security1-2/access.do")
	public String security1_1() {

		return "09Security/Step1/access";
	}
	*/

	@RequestMapping("/security2/index.do")
	public String securityIndex2(Principal principal, Model model, Authentication authentication) {

		return "09Security/Step2/index";
	}

	@RequestMapping("/security2/login.do")
	public String securityIndex2Login(Model model, Principal principal) {

		return "09Security/Step2/Login";
	}

	@RequestMapping("/security2/admin/main.do")
	public String securityIndex2AdminMain() {

		return "09Security/Step2/adminMain";
	}

	@RequestMapping("/security2/accessDenied.do")
	public String securityIndex2AccessDenied() {

		return "09Security/Step2/accessDenied";
	}

	/*
	@RequestMapping("/security2/index.do")
	public String securityIndex2_1(Principal principal, Authentication authentication, Model model) {

		String user_id = principal.getName();
		System.out.println("user_id=" + user_id);

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		String detail_id = userDetails.getUsername();
		System.out.println("detail_id=" + detail_id);

		Object object = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		UserDetails sch = (UserDetails) object;
		String sch_id = sch.getUsername();

		System.out.println("sch_id=" + sch_id);
		model.addAttribute("user_id", user_id);
		return "09Security/Step2/index";
	}
	
	@RequestMapping("/security2/login.do")
	public String securityIndex2_2(Model model, Principal principal) {
		String user_id ="";
		
		try {
			user_id = principal.getName();
			System.out.println("user_id="+user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user_id", user_id);
		return "09Security/Step2/login";
		
	}
	*/
}