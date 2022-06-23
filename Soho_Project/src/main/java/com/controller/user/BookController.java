package com.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.books.BooksDAO;
import com.books.BooksDTO;
import com.google.gson.Gson;
import com.office.OfficeDAO;
import com.office.OfficeDTO;

import utils.JSFunction;

@WebServlet("/books.do/*")
public class BookController extends HttpServlet {

	// 여기서 doGet, doPost를 만들겁니다
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BooksDTO dto = new BooksDTO();
		BooksDAO dao = new BooksDAO();
		
		String uri = req.getRequestURI(); // URI값
		String path = req.getContextPath(); // 컨텍스트 경로

		String command = uri.substring(path.length()); // 요청 분기
		String page_name="";//페이지 이동위치
		String title_name="";//페이지 제목
		
		//포워딩에 사용하기 위한 변수
		RequestDispatcher dispatcher = null;
		String method = req.getMethod();

		System.out.println(command);

		if (command.contentEquals("/books.do/books") && method.equals("GET")) {
			// 예약캘린더
			page_name="/user/books/books.jsp";
			title_name ="예약하기";
		}else if (command.contentEquals("/books.do/confirm") && method.equals("GET")) {
			// 예약확인
			page_name="/user/books/confirm.jsp";
			title_name ="예약확인";
		}else if (command.contentEquals("/books.do/select_ajax") && method.equals("GET")) {
			// 리스트
			String start_datetmime = req.getParameter("start_datetmime"); 
			String end_datetmime =req.getParameter("end_datetmime"); 
			int offilce_code = Integer.parseInt(req.getParameter("code"));  //사무실코드
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			List<BooksDTO> Lists = dao.BookLists(map, start_datetmime, end_datetmime, offilce_code); //리스트
			dao.close(); //자원해제
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			
			map.put("Lists", Lists);
			 
			//전체 지점리스트 용
			OfficeDAO o_dao = new OfficeDAO();

					
			List<OfficeDTO> offlice_list = o_dao.officeSelect(map); //리스트
			o_dao.close(); //자원해제
			
			dao.close(); //자원해제
			o_dao.close(); //자원해제
			
			map.put("offlice_list", offlice_list);

			String gson = new Gson().toJson(map);
			System.out.println(map);
			
			PrintWriter out = resp.getWriter();
			out.write(gson);
			//out.flush();
			//out.close();
		} 
		
		if(page_name!="" && !command.contains("/books.do/select_ajax")) {
			req.setAttribute("title_name", title_name);
			req.setAttribute("result", 1);
			
			dispatcher = req.getRequestDispatcher(page_name);
			dispatcher.forward(req, resp);
		}else if( command.contains("/books.do/select_ajax")){
			
		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		

	}

}
