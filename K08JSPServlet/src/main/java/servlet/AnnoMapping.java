package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
web.xml 대신 @WebServlet 어노테이션으로
요쳥명에 대한 매핑진행
편하지만 차후 유지보수를 위해서는 요청명과 서블릿 클래스의 
관계를 명확히 한 다음 사용해야함
*/
@WebServlet("/13Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//request영역에 속성값저장
		req.setAttribute("message", "@WebServlet으로 매핑");
		//JSP로 포워드 검
		req.getRequestDispatcher("/13Servlet/AnnoMapping.jsp").forward(req, resp);
	}
}
