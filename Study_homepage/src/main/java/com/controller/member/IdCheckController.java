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

import com.member.MemberDTO;
import com.member.MemberDAO;

import utils.JSFunction;

@WebServlet("/member/idcheck.do")
public class IdCheckController extends HttpServlet {


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		int result = 0;

		String id = req.getParameter("user_id"); 
		
		//아이디체크
		MemberDTO dto =  dao.memberSelect(id, "");
		dao.close(); //반납
		
		//id는 받아버려서 다른걸로 확인했습니다
		if(dto.getUser_name() != null) {
			result =1;
		}
		
		req.setAttribute("result", result);
		req.getRequestDispatcher("/user/member/idcheck.jsp").forward(req, resp);
	}
}