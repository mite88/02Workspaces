package com.controller.contact;

import java.io.IOException;
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

import com.contact.ContactDAO;
import com.contact.ContactDTO;

import common.MailSend;
import fileupload.FileUtil;
import utils.BoardPage;
import utils.JSFunction;

@WebServlet("/contact.do/*")
public class ContactController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI(); // URI값
		String path = req.getContextPath(); // 컨텍스트 경로

		String command = uri.substring(path.length()); // 요청 분기
		String page_name="";//페이지 이동위치
		String title_name="";//페이지 제목
		
		int num=0; //게시판번호
		
		//포워딩에 사용하기 위한 변수
		RequestDispatcher dispatcher = null;
		String method = req.getMethod();

		System.out.println(command);

		if (command.contains("/contact.do/list/1") && method.equals("GET")) {
			// 공지사항
			page_name="/user/contact/list.jsp";
			title_name ="공지";
			num=1;
			
			Contact_List(req, resp, num, path);
		}else if (command.contains("/contact.do/list/2") && method.equals("GET")) {
			// 홍보게시판
			page_name="/user/contact/list.jsp";
			title_name ="홍보게시판";
			num=2;
			
			Contact_List(req, resp, num, path);
		}else if (command.contains("/contact.do/view/1") && method.equals("GET")) {
			// 공지사항
			page_name="/user/contact/v.jsp";
			title_name ="공지";
			num=1;
			
			Contact_View(req, resp, num);
		}else if (command.contains("/contact.do/view/2") && method.equals("GET")) {
			// 홍보게시판
			page_name="/user/contact/v.jsp";
			title_name ="홍보게시판";
			num=2;
			
			Contact_View(req, resp, num);
		}else if (command.contains("/contact.do/inquiry_list") && method.equals("GET")) {
			// 문의게시판
			page_name="/user/contact/inquiry_list.jsp";
			title_name ="문의게시판";
		}else if (command.contentEquals("/contact.do/faq") && method.equals("GET")) {
			// faq
			page_name="/user/contact/faq.jsp";
			title_name ="FAQ";
		}else if (command.contentEquals("/contact.do/franchise") ) {
			if(method.equals("GET")){
				// 제휴문의
				page_name="/user/contact/franchise.jsp";
				title_name ="제휴문의";
			}else if(method.equals("POST")) {
				System.out.println("POST");
				//메일보내기
				Mail_send(req, resp);
			}
		} else if(command.contentEquals("/contact.do/download")){
			//다운로드
			//파라미터 받아오기
			//원본파일명
			String ofile = req.getParameter("ofile");
			//서버에 저장된 파일명
			String sfile = req.getParameter("sfile");
			//게시물의 일련번호
			String idx = req.getParameter("idx");
			
			//파일 다운로드 처리
			FileUtil.download(req, resp, "/Uploads/contact", sfile, ofile);
			
			//파일 다운로드 수 증가
			ContactDAO dao = new ContactDAO();
			dao.downCountPlus(idx);
			dao.close();
			
			
		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		
		if(page_name!="") {
			System.out.println("!!!!!");
			req.setAttribute("title_name", title_name);
			req.setAttribute("num", num);
			
			dispatcher = req.getRequestDispatcher(page_name);
			dispatcher.forward(req, resp);
		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		

	}


	//게시판 리스트
	private void Contact_List(HttpServletRequest req, HttpServletResponse resp, int num, String path) {
		System.out.println("!!");
		ContactDAO dao = new ContactDAO();
			
		//파라미터 및 View로 전달할 데이터를 저장하기 위해 Map컬렉션을 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검섹어 관련 파라미터 처리
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		//type넣기
		map.put("type", num);
		
		if(searchWord != null) {
			//검색어를 입력한 경우에만 Model(데이터베이스)로 전달하기 위해 저장함
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//게시물의 갯수를 카운트 함. 검색어가 있는 경우 Map컬렉션을 통해 전달됨.
		int totalCount = dao.selectCount(map);
		
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

		//현재 페이지에 출력할 게시물을 얻어옴.
		List<ContactDTO> boardLists = dao.selectListPage(map);
		//커넥션풀에 자원 반납
		dao.close();
		
		//페이지 번호 생성을 위한 유틸리티 클래스 호출
		String pagingImg = BoardPage.pageingStr(totalCount, pageSize, blockPage, pageNum,  path+"/contact.do/list/"+num, searchField, searchWord);
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
				
		System.out.println("pagingImg:"+pagingImg);
		System.out.println("totalCount:"+totalCount);
		System.out.println("pageSize:"+pageSize);
		System.out.println("pageNum"+pageNum);
		System.out.println("pageTemp:"+pageTemp+"/searchField:"+searchField+"/searchWord:"+searchWord);
		//View로 전달할 객체들을 request영역에 저장한다.
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		
	}
	
	
	//게시판보기(사용자용)
	private void Contact_View(HttpServletRequest req, HttpServletResponse resp, int num) {
		//커넥션풀을 통해 DB연결
		ContactDAO dao = new ContactDAO();
		//일련번호를 파라미터로 받음
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println(idx);
		//조회수 증가
		dao.updateVisitCount(idx);
		//게시물 조회
		ContactDTO dto = dao.selectView(idx);
		dao.close();
		
		//내용에 대해 줄바꿈 처리를 위해 <br>태그로 변환한다.
		//<textarea>에서 엔터키를 통한 줄바꿈은 \r\n으로 저장된다.
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		//request영역에 DTO를 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
	}

	//메일보내기 메서드
	private void Mail_send(HttpServletRequest req, HttpServletResponse resp) {
		 ServletContext application = this.getServletContext();
		common.MailSend ms = new MailSend();
		
		int re = ms.sendMail(req, resp, application);

		System.out.println("re:"+re);
		
		
		// 메일전송완료시...
		if (re == 1) {
			 //다운한 파일 지우기
		    //FileUtil.deleteFile(req, "/Uploads/contact", mr.getParameter("file"));
			JSFunction.alertLocation(resp, "전송완료", "../index.do");
		} else {

			JSFunction.alertBack(resp, "전송실패");

		}
		
	}


}
