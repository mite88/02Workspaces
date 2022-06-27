package com.controller.user.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.MemberDAO;
import com.member.MemberDTO;

import common.JDBConnect;
import utils.AES256;
import utils.JSFunction;

@WebServlet("/member.do/login")
public class LoginController extends HttpServlet {
	
	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/user/member/Login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//아이디와 비번을 가져옵니다.
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		String id_check = req.getParameter("id_check");// 체크박스의 체크여부 넘어온다.
		
		//아이디 저장용 세션 생성
		Cookie cookie = new Cookie("userId", user_id);// 일단 쿠키 생성
		
		//DAO객체를 생성합니다
		MemberDAO mDao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		//DAO의 memberSelect()의 결과값을 DTO에 저장합니다
		
		AES256 aes = new AES256();//비번 암호화
		
		try {
			dto = mDao.memberSelect(user_id,  aes.encrypt(user_pw));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//System.out.println(dto.getUser_name());
		
		mDao.close(); //반납
		
		//회원정보를 찾으면...
		if(dto.getUser_id() != null) {
			//세션생셩
			HttpSession session = req.getSession();
			session.setAttribute("USER_ID", user_id);
		    session.setAttribute("USER_NAME", dto.getUser_name());
		    
		    if (id_check != null) { // 체크박스 체크여부에 따라 쿠키 저장 확인
				// 체크박스 체크 되었을 때
				// 쿠키 저장
				resp.addCookie(cookie);
				
				System.out.println("쿠키생성");
			} else {
				// 체크박스 체크 해제되었을 때
				// 쿠키 유효시간 0으로 해서 브라우저에서 삭제하게 한다.
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}
		    
		    JSFunction.alertLocation(resp, "로그인성공", "../index.do");
		}else {
			JSFunction.alertBack(resp, "맞는 회원정보가 없습니다");
		}
	}
}