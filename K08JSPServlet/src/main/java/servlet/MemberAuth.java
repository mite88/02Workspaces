package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.*;
//MVC패턴으로 회원인증을 처리하기 위한 서블릿 정의
public class MemberAuth extends HttpServlet {
	//서블릿에서 멤버변수 선언
	MemberDAO dao;
	
	//클라이언트가 최초 요청시 서블릿 객체 생성후 한번번 실행되는 메서드로 DB연결 처리해줌
	@Override
	public void init() throws ServletException {
		//서블릿 내 application내장객체를 얻음
		//model2에선 서블릿이 먼저 요청을 받기에 각 내장객체를 얻어올수 있는 메서드가 존재함 
		ServletContext application = this.getServletContext();
		
		//web.xml에 저장된 컨텍스트 초기화 파라미터 얻기
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");
		
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
		
	}
	
	//service()메서드는 get/post방식 둘다 요청을 받을수 있어 해당 메서드내 요청을 받을순있지만 권장하진 않음
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//서블릿 초기화 파라미터 얻기
		String admin_id = this.getInitParameter("admin_id");
		
		//쿼리스트링으로 전달된 파라미터 얻기
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		//회원인증을 위한 메서드 호출
		//아이디, 비번일치하는 정보 찾기
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		String memberName = memberDTO.getName();
		
		System.out.println("id:"+id+"/memberName:"+memberName);
		
		if(memberName != null) {
			req.setAttribute("authMessage", memberName+" 회원님 방가방가 ^^*");
		}else {
			if(admin_id.equals(id)) {
				req.setAttribute("authMessage", admin_id+"는 최고 관리자");
			}else {
				req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
			}
			
		}
		req.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(req, resp);
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}
