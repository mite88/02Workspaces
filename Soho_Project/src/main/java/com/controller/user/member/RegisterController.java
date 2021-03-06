package com.controller.user.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.MemberDTO;
import com.member.MemberDAO;

import utils.AES256;
import utils.JSFunction;

@WebServlet("/member.do/register")
public class RegisterController extends HttpServlet {

	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("title_name", "회원가입");
		req.getRequestDispatcher("/user/member/Register.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.getRequestDispatcher("/member/Register.jsp").forward(req, resp);
		
		
		//다크모드땜에 구분해야함 ㅇㅊㅇ
		String uri = req.getRequestURI(); // URI값
		String path = req.getContextPath(); // 컨텍스트 경로

		String command = uri.substring(path.length()); // 요청 분기


		if (command.contains("/admin.do/books/list") ) {
			
		}
		
		/*
		회원가입 전송 부분 
		*/
		
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
		AES256 aes = new AES256();//비번 암호화
		
		mDto.setUser_id(user_id);
		
		System.out.println(user_pw);
		
		try {
			mDto.setUser_pw(aes.encrypt(user_pw));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mDto.setUser_name(user_name);
		mDto.setUser_email(user_email);
		mDto.setUser_phone(user_phone);
		String hoddy_formatted = String.join(", ", user_hoddy);
		mDto.setUser_hoddy(hoddy_formatted);
		mDto.setUser_job(user_job);
		mDto.setUser_info(user_info);
		mDto.setMemberLevel(memberLevel);
		
		int joinResult = mDao.memberInsert(mDto);
		mDao.close(); //반납
		
		if (joinResult == 1) {

			JSFunction.alertLocation(resp, "회원가입성공", "../index.do");
		} else {
			
			JSFunction.alertBack(resp, "회원가입실패");

		}
	}
}