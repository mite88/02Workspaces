package com.contoller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.contact.ContactDAO;
import com.contact.ContactDTO;
import com.member.MemberDAO;
import com.member.MemberDTO;

@WebServlet("/admin.do")
public class HomeController extends HttpServlet {

	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);
		
		Map<String, Object> mmap = new HashMap<String, Object>();
		Map<String, Object> cmap_1 = new HashMap<String, Object>();
		Map<String, Object> cmap_2 = new HashMap<String, Object>();
		
		MemberDAO mdao = new MemberDAO();
		ContactDAO cdao = new ContactDAO();
		
		//회원수
		int member_count = mdao.selectCount(mmap);
		System.out.println(member_count);

		//전체리스트 수(공지)
		cdao = new ContactDAO();
		
		cmap_1.put("start", "0");
		cmap_1.put("end", "5");
		cmap_1.put("type",  "1");
		int contact_count1  = cdao.selectCount(cmap_1);
		List<ContactDTO> boardLists1 = cdao.selectListPage(cmap_1);
		
		//전체리스트 수(홍보)
		cdao = new ContactDAO();
		
		cmap_2.put("start", "0");
		cmap_2.put("end", "5");
		cmap_2.put("type",  "2");
		int contact_count2  = cdao.selectCount(cmap_2);
		List<ContactDTO> boardLists2 = cdao.selectListPage(cmap_2);
		
		
		req.setAttribute("member_count", member_count);
		req.setAttribute("contact_count1", contact_count1);
		req.setAttribute("contact_count2", contact_count2);
		
		req.setAttribute("boardLists1", boardLists1);
		req.setAttribute("boardLists2", boardLists2);
		
		req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);
	}
}
