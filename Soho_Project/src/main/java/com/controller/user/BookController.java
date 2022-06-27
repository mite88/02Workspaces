package com.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.books.BooksDAO;
import com.books.BooksDTO;
import com.contact.ContactDTO;
import com.google.gson.Gson;
import com.office.OfficeDAO;
import com.office.OfficeDTO;

import utils.BoardPage;
import utils.BookBoardPage;
import utils.JSFunction;

@WebServlet("/books.do/*")
public class BookController extends HttpServlet {
	
	//포멧지정
	SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");

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
		}else if (command.contains("/books.do/confirm") && method.equals("GET")) {
			// 예약확인
			page_name="/user/books/confirm.jsp";
			title_name ="예약확인";
			
			Map<String, Object> map = new HashMap<String, Object>();
			HttpSession session = req.getSession();
			
			//session은 object 형이기때문에 toString()으로 해서 변환시킴
			String user_id = session.getAttribute("USER_ID").toString();
			int offilce_code = 0;  //사무실코드
			
			
			if( req.getParameter("code") != "" && req.getParameter("code")!= null) {
				offilce_code = Integer.parseInt(req.getParameter("code"));  //사무실코드

			}


			//검섹어 관련 파라미터 처리
			String searchField = req.getParameter("searchField");
			String searchWord = req.getParameter("searchWord");
			
			if(searchWord != null) {
				//검색어를 입력한 경우에만 Model(데이터베이스)로 전달하기 위해 저장함
				map.put("searchField", searchField);
				map.put("searchWord", searchWord);
			}
			
			//게시물의 갯수를 카운트 함. 검색어가 있는 경우 Map컬렉션을 통해 전달됨.
			int totalCount = dao.selectCount(map, user_id);
			
			/* 페이지 처리 start*/
			//서블릿에서 web.xml에 접근하기 위해 application내장객체를 얻어옴
			ServletContext application = getServletContext();
			//컨텍스트 초기화 파라미터를 얻어옴.
			//한페이지당 출력할 게시물의 갯수
			int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
			//한 블럭당 출력할 페이지 번호 갯수
			int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
			
			/*
			목록에 첫 진입시에는 무조건 1페이지로 가정한 후 게시물을 얻어옴.
			특정 페이지로 진입한 경우에는 파라미터를 받아서 구간을 계산하여 얻어옴.
			 */
			int pageNum = 1;
			//파라미터로 넘어오는 pageNum이 있다면 값을 얻어와서..
			String pageTemp = req.getParameter("pageNum");

			//정수로 변환한 후 현재 페이지번호로 지정한다.
			if(pageTemp != null && !pageTemp.equals("")) {
				pageNum = Integer.parseInt(pageTemp);
			}
			
			//게시물의 구간을 계산함.
			/*
			MySQL의 경우 페이징을 위해 Limit를 사용한다.
			사용법 : limit 게시물의 시작인덱스, 출력할 게시물의 갯수
				따라서 start(시작위치)만 계산하면 된다.
				start => 
					1페이지일때 : (1-1) * 2 = 0
					2페이지일때 : (2-1) * 2 = 2
					3페이지일때 : (3-1) * 2 = 4 
			 */
			int start = (pageNum - 1) * pageSize;
			int end = pageSize;
			//계산된 값은 Model로 전달하기 위해 Map컬렉션에 저장함.
			map.put("start", start);
			map.put("end", end);
			/* 페이지 처리 end */

			List<BooksDTO> Lists = dao.BookUser_Lists(map, user_id,offilce_code ); //리스트
			dao.close(); //자원해제
			
			//페이지 번호 생성을 위한 유틸리티 클래스 호출
			String pagingImg = BookBoardPage.pageingStr
					(totalCount, pageSize, blockPage, pageNum,  path+"/books.do/confirm/",searchField, searchWord);
			map.put("pagingImg", pagingImg);
			map.put("totalCount", totalCount);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);
					
			System.out.println("pagingImg:"+pagingImg);
			System.out.println("totalCount:"+totalCount);
			System.out.println("pageSize:"+pageSize);
			System.out.println("pageNum"+pageNum);

			//View로 전달할 객체들을 request영역에 저장한다.
			
			req.setAttribute("Lists", Lists);
			req.setAttribute("map", map);
			

		}else if (command.contentEquals("/books.do/select_ajax") && method.equals("GET")) {
			// 리스트
			String start_datetmime = req.getParameter("start_datetmime"); 
			String end_datetmime =req.getParameter("end_datetmime"); 
			int offilce_code = 0;  //사무실코드
			
			
			if( req.getParameter("code") != "") {
				offilce_code = Integer.parseInt(req.getParameter("code"));  //사무실코드

			}
			System.out.println(offilce_code);
			
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
			out.flush();
			out.close();
		} else if (command.contentEquals("/books.do/create_ajax") && method.equals("POST")) {
			//일정등록

			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			
			System.out.println(req.getParameter("code"));
	
			dto.setTitle(req.getParameter("title"));
			dto.setStart(Timestamp.valueOf(req.getParameter("start") +" 00:00:00.0"));
			dto.setEnd(Timestamp.valueOf(req.getParameter("end")+" 23:59:59.999"));
			dto.setMessage(req.getParameter("message"));
			dto.setUser_id(req.getParameter("user_id"));
			dto.setOffice_num(Integer.parseInt(req.getParameter("code")));
			
			dao = new BooksDAO();
			int result =dao.BookCreate(dto);
			dao.close();
			
			System.out.println("!!");
			
			PrintWriter out = resp.getWriter();
			out.write(result);
			out.flush();
			out.close();
			
		
		}
		
		if(page_name!="" && !command.contains("_ajax")) {
			req.setAttribute("title_name", title_name);
			req.setAttribute("result", 1);
			
			dispatcher = req.getRequestDispatcher(page_name);
			dispatcher.forward(req, resp);
		}else if( command.contains("_ajax")){
			
		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		

	}

}
