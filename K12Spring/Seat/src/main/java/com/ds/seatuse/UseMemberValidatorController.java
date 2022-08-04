package com.ds.seatuse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.vo.Seat_Member;
/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("smVO")
public class UseMemberValidatorController {
	private static final Logger logger = LoggerFactory.getLogger(UseMemberValidatorController.class);

	@Autowired
	private SeatMemberDAO smDAO;

	//회원가입들어가기
	@RequestMapping(value = "homejoin.do", method = RequestMethod.GET)
	public String homeJoinGET(Model model,Seat_Member smVO) {
		model.addAttribute("smVO", new Seat_Member());
		return "use/member/homejoin";

	}

	//회원가입하기
	@RequestMapping(value = "homejoin.do", method = RequestMethod.POST)
	public String homeJoinPOST
	(SessionStatus sessionStatus,HttpServletResponse res, Model model
			,@ModelAttribute @Valid Seat_Member smVO , 
			BindingResult bindingResult,Map<String, BindingResult> map)
					throws IOException {

		//한글설정
		res.setCharacterEncoding("UTF-8"); 
		res.setContentType("text/html; charset=UTF-8");

		//값확인용
		logger.debug("smVO : {}", smVO);

		// .smVO -> CommandName 혹은 ModelAttribute 에 지정된 이름
		map.put(BindingResult.class.getName() + ".smVO", bindingResult);

		PrintWriter out = res.getWriter();

		//제대로 들어갔는지 확인
		if(bindingResult.hasErrors()) {
			System.out.println("에러발생");
			logger.debug("Binding Result has error!");
			List<ObjectError> errors = bindingResult.getAllErrors();

			for(ObjectError error : errors){
				sessionStatus.setComplete();
				logger.debug("error : {}", error.getDefaultMessage());
				model.addAttribute("smVO1", smVO);
			}

			return "use/member/homejoin";
		} else {
			System.out.println("회원가입성공!!");

			smDAO.seatInsertMember(smVO);

			out.println("<script language='javascript'>");
			out.println("alert('회원가입이 완료되었습니다');");
			out.println("window.location.href='home.do'"); 
			out.println("</script>"); 
			out.close();
			return null;
		}

	}



	//Mypage 들어가기(회원수정)
	@RequestMapping(value = "homeMyPage2.do", method = RequestMethod.GET)
	public String homeMyPage2GET(Model model,HttpSession session, HttpServletRequest req) {

		Seat_Member smVO= new Seat_Member();

		//id 알아내기
		String m_id=(String)session.getAttribute("USESID");

		//데이터 받기
		smVO=smDAO.seatSelectMemberOne(m_id);
		model.addAttribute("smVO",smVO);
		return "use/mypage/mypage2";
	}


	//회원수정하기
	@RequestMapping(value = "homememberupdate.do", method = RequestMethod.POST)
	public String homeJoinUpdatePOST
	(SessionStatus sessionStatus,HttpServletResponse res, Model model
			,@ModelAttribute @Valid Seat_Member smVO , 
			BindingResult bindingResult,Map<String, BindingResult> map)
					throws IOException {

		//한글설정
		res.setCharacterEncoding("UTF-8"); 
		res.setContentType("text/html; charset=UTF-8");

		//값확인용
		logger.debug("smVO : {}", smVO);

		// .smVO -> CommandName 혹은 ModelAttribute 에 지정된 이름
		map.put(BindingResult.class.getName() + ".smVO", bindingResult);


		//제대로 들어갔는지 확인
		if(bindingResult.hasErrors()) {
			System.out.println("에러발생");
			logger.debug("Binding Result has error!");
			List<ObjectError> errors = bindingResult.getAllErrors();

			for(ObjectError error : errors){
				sessionStatus.setComplete();
				logger.debug("error : {}", error.getDefaultMessage());
				model.addAttribute("smVO1", smVO);
			}

			return "use/mypage/mypage2";
		} else {
			System.out.println("회원수정성공!!");

			smDAO.seatUpdateMember(smVO);

			model.addAttribute("msg", "회원수정성공");
			model.addAttribute("url", "home.do");


			return "alert";
		}

	}

}

