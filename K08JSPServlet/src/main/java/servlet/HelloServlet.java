package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 서블릿 클래스를 만들기위한절차
 1. HttpServlet상속
 2. doGet / doPost 중 요청에 맞는걸 만듬
   (패키지임포트 및 예외처리는자동으로 완성됨)
 3. request내장객체 사용시 매개변수 req사용
 * */
public class HelloServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//리퀘스트 영역에 속성값 저장
		req.setAttribute("message", "Hello Servlet..!");
		//View에 해당하는 JSP페이지로 포워드하기 - 서블릿에서 저장한 속성값 사용가능
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
