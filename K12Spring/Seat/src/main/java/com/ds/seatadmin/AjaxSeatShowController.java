package com.ds.seatadmin;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Show_Seat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@RestController
@MapperScan({"com.ds.seat.dao"})
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class AjaxSeatShowController {

	@Autowired
	private SeatShowDAO ssDAO;
	
	@Autowired
	private Show_SeatDAO sseatDAO;


	//공연예약페이지
	@RequestMapping(value = "ajax_adminshowseatlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Seat_Show> adminshowseat(Model model, HttpServletRequest request ) {
		List<Seat_Show> list=ssDAO.selectSeatshowList1();
		System.out.println(list.toString());

		return list;
	}
	
	@RequestMapping(value = "ajax_adminshowseatdata.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Show_Seat> adminshowseatdata(Model model, HttpServletRequest request,
	@RequestParam("show_no") Long show_no ) {
		
		List<Show_Seat> list1=sseatDAO.SelectShowSeatList(show_no);
		System.out.println(list1.toString());

		return list1;
	}

}
