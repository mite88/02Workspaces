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

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	
	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/member/Login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//아이디와 비번을 가져옵니다.
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		
		//DAO객체를 생성합니다
		MemberDAO mDao = new MemberDAO();
		
		//DAO의 memberSelect()의 결과값을 DTO에 저장합니다
		
		MemberDTO dto = mDao.memberSelect(user_id, user_pw);
		//System.out.println(dto.getUser_name());
		
		mDao.close(); //반납
		
		//회원정보를 찾으면...
		if(dto.getUser_id() != null) {
			//세션생셩
			HttpSession session = req.getSession();
			session.setAttribute("USER_ID", user_id);
		    session.setAttribute("USER_NAME", dto.getUser_name());
		    
		    JSFunction.alertLocation(resp, "로그인성공", "../index.do");
		}else {
			JSFunction.alertBack(resp, "맞는 회원정보가 없습니다");
		}
	}
}