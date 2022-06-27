package com.contoller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.MemberDAO;
import com.member.MemberDTO;

import utils.AES256;
import utils.JSFunction;

@WebServlet("/admin.do/login")
public class LoginController extends HttpServlet {

	// 여기서 doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 아이디와 비번을 가져옵니다.
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");

		// DAO객체를 생성합니다
		MemberDAO mDao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		AES256 aes = new AES256();//비번 암호화
		
		try {
			//관리자전용확인
			dto = mDao.memberLogin_admin(user_id,  aes.encrypt(user_pw));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

		mDao.close(); // 반납

		// 회원정보를 찾으면...
		if (dto.getUser_id() != null) {
			// 세션생셩
			HttpSession session = req.getSession();
			session.setAttribute("ADMIN_ID", user_id);
			session.setAttribute("ADMIN_NAME", dto.getUser_name());

			JSFunction.alertLocation(resp, "로그인성공", "../admin.do");
		} else {
			JSFunction.alertBack(resp, "맞는 회원정보가 없습니다 관리자 정보를 입력하세요");
		}
	}
}
