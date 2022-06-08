package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//어노테이션을 통한 매핑
@WebServlet("/BoardSkin/view.do")
public class ViewController extends HttpServlet {
	
	//doGet() 및 doPost() 전에 실행되는 메서드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO();
		//일련번호 파라미터 받음
		String idx =req.getParameter("idx");
		
		//조회수증가
		dao.updateVisitCount(idx);
		//게시물 받기
		MVCBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		//줄바꿈처리
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/BoardSkin/viewT.jsp").forward(req, resp);
	}
}
