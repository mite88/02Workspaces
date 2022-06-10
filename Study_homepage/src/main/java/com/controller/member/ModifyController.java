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

@WebServlet("/member/modify.do")
public class ModifyController extends HttpServlet {
	JDBConnect jdbc= new JDBConnect();

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
		
		jdbc.close();
		
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
		req.getRequestDispatcher("/member/Modify.jsp").forward(req, resp);
	}
}
