package com.controller.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.MailSend;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/board/contact.do")
public class Board_ContactController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/board/contact.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 ServletContext application = this.getServletContext();
		common.MailSend ms = new MailSend();
		
		int re = ms.sendMail(req, resp, application);

		System.out.println("re:"+re);
		
		
		// 메일전송완료시...
		if (re == 1) {
			 //다운한 파일 지우기
		    FileUtil.deleteFile(req, "/Uploads", mr.getParameter("file"));
			JSFunction.alertLocation(resp, "전송완료", "../index.do");
		} else {

			JSFunction.alertBack(resp, "전송실패");

		}
		

	}

}
