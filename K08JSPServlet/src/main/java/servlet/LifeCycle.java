package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/13Servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet {
	
	//(init()가 호출되기 전)전처리 메소드(거의 안함)
	@PostConstruct
	public void myPostConstruct() {
		System.out.println("myPostConstruct() 호출");
	}
	
	//서블릿 객체 생성시 한번만 호출됨
	@Override
	public void init() throws ServletException {
		System.out.println("init() 호출");
		super.init();
	}
	
	//GET, POST방식 다받음, 클라이언트 요청 분석을 위해 호출
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출");
		super.service(req, resp);
	}
	
	//get방식 처리
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	//post방식 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	//서블릿이 새로 컴파일되거나, 서버 종료시 호출(메모리에서 소멸)
	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}
	
	//(destroy()가 호출된 후)후처리 메소드
	@PreDestroy
	public void myPerDestroy() {
		System.out.println("myPerDestroy() 호출");
	}
}
