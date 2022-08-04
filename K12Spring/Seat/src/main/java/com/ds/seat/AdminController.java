package com.ds.seat;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.SeatShowReservationDAO;
import com.ds.seat.vo.ReservationChart;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {

	@Autowired
	private SeatMemberDAO smDAO;

	@Autowired
	private SeatShowDAO ssDAO;
	
	@Autowired
	private SeatShowReservationDAO ssrDAO;


	//관리자 로그인 페이지
	@RequestMapping(value = "adminlogin.do", method = RequestMethod.GET)
	public String adminlogin(Locale locale, Model model) {

		return "admin/adminlogin";
	}


	//로그인후 관리자 메인페이지
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String adminindex(Model model) {
		int member_num=smDAO.seatSelectMemberNum();
		int show_num=ssDAO.selectSeatshowOne();
		model.addAttribute("member_num", member_num);
		model.addAttribute("show_num", show_num);
		
		List<ReservationChart> list=new ArrayList<ReservationChart>();
		List<ReservationChart> list2=new ArrayList<ReservationChart>();
		list=ssrDAO.selectSeatshowReservationSeatCount();
		list2=ssrDAO.selectShowHellList();
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		return "admin/admin";
	}


	//공연예약페이지
	@RequestMapping(value = "adminshowseat.do", method = RequestMethod.GET)
	public String adminshowseat(Model model) {
		return "admin/showseat/adminshowseat";
	}


	//로그아웃 들어가기
	@RequestMapping(value = "adminlogout.do", method = RequestMethod.GET)
	public String adminLogout(Model model,HttpSession session, HttpServletRequest req) {

		session.invalidate(); //세션값 지우기
		req.setAttribute("msg", "로그아웃성공");
		req.setAttribute("url", "adminlogin.do");


		return "alert";
	}

}

