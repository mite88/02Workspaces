package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.MemberDTO;

import com.member.MemberDAO;

import utils.JSFunction;

@WebServlet("/member/delete.do")
public class DeleteController extends HttpServlet {

	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//req.getRequestDispatcher("/member/Register.jsp").forward(req, resp);
		
		/*
		회원탈퇴부분
		*/
		
		//id의 경우 해당 from안에서 가져와야하기 때문에 session을 이용하여 가져옴
		//세션의 정보를 통해 회원정보조회
		HttpSession session = req.getSession();
		
		//session은 object 형이기때문에 toString()으로 해서 변환시킴
		String user_id = session.getAttribute("USER_ID").toString();
		String user_pw = req.getParameter("del_pw"); //prompt에서 

		System.out.println("prompt:"+user_pw);
		
		//DB 연결
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);

		//삭제
		int result = dao.memberDelete(dto);
		
		dao.close(); //반납
		
		//System.out.println("result:"+result);
		
		
		//삭제완료시...
		if(result == 1) {
			//세션삭제
			session.invalidate();
			JSFunction.alertLocation(resp, "삭제완료", "../index.do");
		}else {
			
			JSFunction.alertBack(resp, "삭제실패");

		}
		
	}
}