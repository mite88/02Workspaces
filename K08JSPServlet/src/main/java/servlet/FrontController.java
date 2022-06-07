package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//어노테이션으로 설정함(*을 통해 여러 요청명을 매핑함)
@WebServlet("*.one")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//request내장 객체로 현재 요청되 url얻음 
		String uri = req.getRequestURI(); //호스트명 제외한 나머지 경로
		//url에서 마지막의 '/'의 위치찾음
		int lastSlash = uri.lastIndexOf("/");
		//url을 잘라 요청명을 찾음
		String commandStr = uri.substring(lastSlash);
		
		//요청명에 따라 메서드 실행함
		if (commandStr.equals("/regist.one")) {
			registFunc(req);
		} else if (commandStr.equals("/login.one")) {
			loginFunc(req);
		} else if (commandStr.equals("/freeboard.one")) {
			freeboardFunc(req);
		}
		
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		req.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(req, resp);
	}

	//페이지별 처리 메서드-request 영역에 속성저장
	private void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}

	private void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}

	private void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");
	}

}