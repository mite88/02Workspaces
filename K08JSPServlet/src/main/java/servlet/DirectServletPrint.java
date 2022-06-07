package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 생성을 위해 HttpServlet 상속함
public class DirectServletPrint extends HttpServlet{
	
	//post요청이라 doPost메서드로 함
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//서블릿에서 직접 html태그 출력을 위해 문서 컨텐츠 타입설정
		resp.setContentType("text/html;charset=UTF-8");
		//직접출력을 위한 객체 생성
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head><title>DirectServletPrint</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력합니다.</h2>");
		writer.println("<p>jsp로 포워드 하지 않습니다.</p>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
}
