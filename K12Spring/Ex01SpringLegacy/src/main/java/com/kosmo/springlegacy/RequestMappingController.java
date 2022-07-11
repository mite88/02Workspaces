package com.kosmo.springlegacy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import common.StudentDTO;

@Controller
public class RequestMappingController {

	// get or post 방식의전송을 위한 인덱스 페이지 매핑
	@RequestMapping("/requestMapping/index.do")
	public String rmIndex() {
		return "02RequestMapping/index";
	}

	// 전송방식 명시시엔 같이써야함
	@RequestMapping(value = "/requestMapping/getSearch.do", method = RequestMethod.GET)
	public String getSearch(HttpServletRequest req, Model model) {

		/*
		 * 요청 처리를 위한 메서드 저으이 시 해당 메서드에서 사용하고자하는 내장객체가 존재한다면 매개변수 형태로선언 하면 즉시 사용가능
		 */
		System.out.println("requestMapping.GET방식으로 폼값전송");

		// request 내장객체를 통해 폼값받기
		String sColumn = req.getParameter("searchColumn");
		String sWord = req.getParameter("searchWord");

		// Model객체에 데이터저장
		model.addAttribute("sColumn", sColumn);
		model.addAttribute("sWord", sWord);

		return "02RequestMapping/getSearch";
	}

	// 전송방식이 POST임, 파라미터를 어노테이션으로 받은 후 변수에 저장
	@RequestMapping(method = RequestMethod.POST, value = "/requestMapping/postLogin.do")
	public ModelAndView postLogin(@RequestParam("user_id") String id, @RequestParam("user_pw") String pw) {

		/*
		ModelAndView
		View로 전송할 데이터의 저장과 View의 경로를 반환하는
		2기능을 동시에 처리할 수 있는 클래스
		
		-view설정 : 참조변수.setViewName("뷰경로 및 파일명");
		-model설정 : 참조변수.addObject("속성명", "속성값");
		
		최종적으로 뷰 호출시 ModelAndView 참조변수를 반활함
		*/
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("02RequestMapping/postLogin");
		mv.addObject("id", id);
		mv.addObject("pw", pw);

		return mv;
	}

	/*
	@ModelAttribute
	뷰로 전달되는 커멘드객체명을 변경할때 사용
	StudentDTO -> si
	*/
	@RequestMapping("/requestMapping/modelAttribute.do")
	public String studentInfo(@ModelAttribute("si") StudentDTO studentDTO) {
		return "02RequestMapping/modelAttribute";
	}

}
