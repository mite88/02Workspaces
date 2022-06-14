package com.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.MemberDAO;
import com.member.MemberDTO;

import common.JDBConnect;
import utils.JSFunction;

@WebServlet("/member/modify.do")
public class ModifyController extends HttpServlet {
	
	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션의 정보를 통해 회원정보조회
		HttpSession session = req.getSession();
		
		//session은 object 형이기때문에 toString()으로 해서 변환시킴
		String user_id = session.getAttribute("USER_ID").toString();
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.memberSelect(user_id, "");
		System.out.println(dto.getUser_name());
		
		dao.close(); //반납
		
		//회원정보 전달
		req.setAttribute("dto", dto);
		
		//합쳐진 값 나누기위해 값 전달하기
		req.setAttribute("user_phone1", dto.getUser_phone().split("-")[0]);
		req.setAttribute("user_phone2", dto.getUser_phone().split("-")[1]);
		req.setAttribute("user_phone3", dto.getUser_phone().split("-")[2]);
		
		req.getRequestDispatcher("/member/Modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
req.setCharacterEncoding("UTF-8"); //인코딩 지정 xml에서 작업했다면 안해도되지만...
		
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw1");
		String user_name = req.getParameter("user_name");
		String user_email = req.getParameter("user_email1")+"@"+req.getParameter("user_email2");
		String user_phone = req.getParameter("user_phone1")+"-"+req.getParameter("user_phone2")+"-"+req.getParameter("user_phone3");
		//checkBox의 여러 내용을 저장하기위해 getParameterValues 사용
		String[] user_hoddy = req.getParameterValues("user_hoddy");
		String user_job = req.getParameter("user_job");
		String user_info = req.getParameter("user_info");
		String memberLevel = "user";
		
		//megister_date은 기본으로 sysdate를 지정하였으므로 할필요없습니다
		
		MemberDAO mDao = new MemberDAO();
		MemberDTO mDto = new MemberDTO();
		
		mDto.setUser_id(user_id);
		mDto.setUser_pw(user_pw);
		mDto.setUser_name(user_name);
		mDto.setUser_email(user_email);
		mDto.setUser_phone(user_phone);
		String hoddy_formatted = String.join(", ", user_hoddy);
		mDto.setUser_hoddy(hoddy_formatted);
		mDto.setUser_job(user_job);
		mDto.setUser_info(user_info);
		mDto.setMemberLevel(memberLevel);
		
		int joinResult = mDao.memberUpdate(mDto);
		
		mDao.close(); //반납
		
		if (joinResult == 1) {

			JSFunction.alertLocation(resp, "회원수정성공", "../index.do");
		} else {
			
			JSFunction.alertBack(resp, "회원수정실패");

		}

	}
}