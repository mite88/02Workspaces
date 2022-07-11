package com.kosmo.springlegacy;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import common.MemberDTO;
import common.MemberValidator;

@Controller
public class ValidateController {

	@RequestMapping(value = "/validate/memberRegist.do")
	public String memberRegist(Locale locale, Model model) {

		return "03Validate/memberRegist";
	}

	@RequestMapping("/validate/registProc.do")
	public String registProce(@ModelAttribute("mInfo") @Validated MemberDTO memberDTO, BindingResult result, Model model) {

		String viewPage = "03Validate/memberDone";

		MemberValidator validator = new MemberValidator();
		validator.validate(memberDTO, result);

		if (result.hasErrors()) {
			System.out.println("유효성 체크 실패 : " + result.toString());
			model.addAttribute("formError", " 폼값 유효성체크 실패");
			viewPage = "03Validate/memberRegist";
		}
		return viewPage;
	}

}
