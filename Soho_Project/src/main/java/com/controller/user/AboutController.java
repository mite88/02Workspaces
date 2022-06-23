package com.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.office.OfficeDAO;
import com.office.OfficeDTO;

import utils.JSFunction;

@WebServlet("/about.do/*")
public class AboutController extends HttpServlet {

	// 여기서 doGet, doPost를 만들겁니다
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI(); // URI값
		String path = req.getContextPath(); // 컨텍스트 경로

		String command = uri.substring(path.length()); // 요청 분기
		String page_name="";//페이지 이동위치
		String title_name="";//페이지 제목
		
		//포워딩에 사용하기 위한 변수
		RequestDispatcher dispatcher = null;
		String method = req.getMethod();

		System.out.println(command);

		if (command.contentEquals("/about.do/ceo") && method.equals("GET")) {
			// 인사말
			page_name="/user/about/ceo.jsp";
			title_name ="인사말";
		} else if (command.contentEquals("/about.do/about") && method.equals("GET")) {
			// 소개
			page_name="/user/about/about.jsp";
			title_name ="소개";
		} else if (command.contentEquals("/about.do/term") && method.equals("GET")) {
			// 팀원
			page_name="/user/about/term.jsp";
			title_name ="팀원";
		} else if (command.contentEquals("/about.do/location") && method.equals("GET")) {
			// 지점찾기
			page_name="/user/about/location.jsp";
			title_name ="지점찾기";
			
			
			OfficeDAO dao = new OfficeDAO();
			
			Map<String, Object> map = new HashMap<String, Object>();

					
			List<OfficeDTO> offlice_list = dao.officeSelect(map); //리스트
			dao.close(); //자원해제

			req.setAttribute("offlice_list", offlice_list);
			
		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		
		if(page_name!="") {
			req.setAttribute("title_name", title_name);
			
			dispatcher = req.getRequestDispatcher(page_name);
			dispatcher.forward(req, resp);
		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		

	}

}
