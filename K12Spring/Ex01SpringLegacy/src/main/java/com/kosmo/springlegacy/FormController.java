package com.kosmo.springlegacy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import common.MemberDTO;

/*
 1. 사용자의 요청을 제일먼저 받는 DispatcherServlet은 기본지정된 패키지를 스캔하여
 컨트롤러 클래스를 찾고 해당 요청명에 매핑된 매서드를 찾아 요청을 전달 및 로직을 수행함 
 */

/*
@Controller
해당 클래스를 컨트롤러로 사용시 클래스명 앞에 선언
패키지를 스캔시 해당 어노테이션이 있는 클래스를 찾아 요청전달

@RequestMapping
요청명 매핑
요청명은 서블릿과 마찬가지로 컨택스트 루트를 제외한 나머지경로명
 */
@Controller
public class FormController {

	//폼값받기 1]파라미터로 전달된 값을 HttpServletRequest내장객체를 통해 받음(JSP, Servlet)
	@RequestMapping(value = "/form/servletRequest", method = RequestMethod.GET)
	private String loginMember(HttpServletRequest req, Model model) {
		
		//request내장객체로 파라미터받기
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		//View로 전달된 데이터를 Model객체로 저장
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("message", "로그인정보 전달됨");
		
		//경로 반환
		return "01Form/servletRequest";

	}

	/*
	 폼값받기2]
	 @RequestParam 어노테이션으로 폼값받기
	 
	 파리미터 형식으로 사용함, 어노테이션으로 폼값을 받은 후 우측 변수에 즉시대입
	 하여 메서드내에서 사용
	 */
	@RequestMapping("form/requestParam.do")
	private String joinMember(Model model, 
			@RequestParam("name") String name, @RequestParam("id") String id,  
			 @RequestParam("pw") String pw, @RequestParam("email") String email ) {

		//받은 폼값을 DTO에 저장함
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setPw(pw);
		memberDTO.setEmail(email);
		memberDTO.setName(name);
		
		//DTO를 Model객체에 저장 후 View를 호출함
		model.addAttribute("memberDTO",memberDTO);
		
		return "01Form/requestParam";
	
	}
	
	/*
	 폼값받기3]
	 커멘드 객체를 이용하여 폼값 한번에 받기
	 
	 조건1:쿼리스트링으로 전달되는 파라미터의 갯수 및 폼값을 저장할
	 DTO 및 VO의 멤버변수의 갯수가 동일한 것으로 권장함
	 
	 조건2:커멘드객체를 사용할때는 클래스명 앞글자를 소문자로 바꾼 
	 형태의 매개변수를 사용해야함
	 EX) MemberDTO -> memberDTO
	 
	 조건3:커멘드객체 생성시 파라미터의 갯수는 달라도 되지만
	 파라미터명과 멤버변수명은 동일해야하며, 이에 해당하는 DTO(getter/setter)
	 가 반드시 생성되어야함
	 */
	@RequestMapping("form/commandObjGet.do")
	private String commandObjGet(MemberDTO memberDTO) {
		
		//커멘드객체 사용시 폼값 받는 즉시 Model객체에 저장되어 별도의 코드가 필요하지 않음
		return "01Form/commandObjGet";
	
	}
	
	/*
	폼값받기4]
	@PathVariable 어노테이션 사용하기
	
	요청명 뒤에 경로처럼 붙는 값이 실제 사용가능한 파라미터가 됨
	파라미터는 마치 경로명처럼 사용되는데,
	이 때 웹브라우저는 요청명으로 인식하므로 리소스 사용시 경로를 주의해야하며
	파라미터 갯수가 틀리면 404에러가 발생함
	*/
	@RequestMapping("form/{memberId}/{memberName}")
	private String pathVariable(Model model, 
			@PathVariable String memberId, @PathVariable String memberName) {
		
		model.addAttribute("memberId",memberId);
		model.addAttribute("memberName",memberName);
		
		return "01Form/pathVariable";
	
	}
}
