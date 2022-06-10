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

@WebServlet("/member/logout.do")
public class LogoutController extends HttpServlet {
	JDBConnect jdbc= new JDBConnect();
	
	//여기선 로그아웃은 한가지 경우이기에 service메서드로 해봅시다
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그아웃시 세션내용을 지웁니다
		HttpSession session = req.getSession();
		
		session.removeAttribute("USER_ID");
		session.removeAttribute("USER_NAME");
		
		//한꺼번에 지우기
		//session.invalidate();

		//메인페이지로 이동
		resp.sendRedirect("../index.do");
	}


}
