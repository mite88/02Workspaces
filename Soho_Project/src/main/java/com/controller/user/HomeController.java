package com.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.office.OfficeDAO;
import com.office.OfficeDTO;

@WebServlet("/index.do")
public class HomeController extends HttpServlet {

	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OfficeDAO dao = new OfficeDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();

				
		List<OfficeDTO> offlice_list = dao.officeSelect(map); //리스트
		dao.close(); //자원해제

		req.setAttribute("offlice_list", offlice_list);
		
		System.out.println("offlice_list"+offlice_list);
		req.getRequestDispatcher("/user/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/user/index.jsp").forward(req, resp);
	}
}
