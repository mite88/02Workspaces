package com.controller.contact;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MailSend;
import utils.JSFunction;

@WebServlet("/contact.do/*")
public class Contact_ContactController extends HttpServlet {
	
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

		if (command.contentEquals("/contact.do/list/1") && method.equals("GET")) {
			// 공지사항
			page_name="/user/contact/list.jsp";
			title_name ="공지";
			num=1;
		}else if (command.contentEquals("/contact.do/list/2") && method.equals("GET")) {
			// 홍보게시판
			page_name="/user/contact/list.jsp";
			title_name ="홍보게시판";
			num=2;
		}else if (command.contentEquals("/contact.do/inquiry_list") && method.equals("GET")) {
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
				Mail_send(req, resp);
			}
		} else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		
		if(page_name!="") {
			req.setAttribute("title_name", title_name);
			req.setAttribute("num", num);
			
			dispatcher = req.getRequestDispatcher(page_name);
			dispatcher.forward(req, resp);
		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		

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
		    //FileUtil.deleteFile(req, "/Uploads", mr.getParameter("file"));
			JSFunction.alertLocation(resp, "전송완료", "../index.do");
		} else {

			JSFunction.alertBack(resp, "전송실패");

		}
		
	}


}
