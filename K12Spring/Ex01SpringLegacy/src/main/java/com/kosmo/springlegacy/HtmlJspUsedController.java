package com.kosmo.springlegacy;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HtmlJspUsedController {
	
	@RequestMapping("htmlJspUsed/includeUse.do")
	public String includeUse(Model model) {
		return "08HtmlJspUsed/includeUse";
	}
}
