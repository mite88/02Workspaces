package com.ds.seatuse;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.SeatShowReservationDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Seat_Show_List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@RestController
@MapperScan({"com.ds.seat.dao"})
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class AjaxUserController {

	@Autowired
	private SeatShowReservationDAO ssrDAO;


	@Autowired
	private SeatMemberDAO smDAO;

	@Autowired
	private Show_SeatDAO sseatDAO;

	@Autowired
	private SeatShowDAO ssDAO;

	//회원중복확인
	@RequestMapping(value = "idcheck.do", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String m_id) {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = smDAO.seatSelectMemberidNum(m_id);
		map.put("cnt", count);

		return map;
	}



	//결제하기 
	@RequestMapping(value = "homeshowseatok.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String stepok(Model model,  @RequestParam("ssr_no") int ssr_no,
			@RequestParam("ssr_payset") String ssr_payset) {


		System.out.println("ssr_payset : "+ssr_payset);
		ssrDAO.updteSeatShowReservationOne(ssr_no);

		return null;
	}

	//예약정보삭제
	@RequestMapping(value = "homeshowseatdel.do", method = RequestMethod.GET)
	public void stepdel(Model model, @RequestParam("ssr_no") int ssr_no,
			@RequestParam("show_no") Long show_no) {

		System.out.println("ssr_no : "+ssr_no);

		String ssr_seat=null; //목록받기

		String[] ssr_seat_split=null; //구분자 구분용

		ssr_seat=ssrDAO.selectSeatshowReservationSeatList1(show_no);


		StringTokenizer values = new StringTokenizer(ssr_seat, "," );
		//System.out.println("values : "+values.toString());

		//System.out.println("count : "+values.countTokens()); //자른개수

		ssr_seat_split=ssr_seat.split(",");

		//자른것중 첫글자를 구분해서 좌석수 변화시키기
		for (int i = 0; i < ssr_seat_split.length; i++) {

			String seat=ssr_seat_split[i].replaceAll("[^a-zA-Z]", "");

			Long no=show_no;
			//좌석수 검색해서 좌석수 늘리기
			int seatcount=sseatDAO.SelectShowSeatCount("\'"+seat+"\'", no);
			sseatDAO.updateMinusPlusSeat(seatcount+1, "\'"+seat+"\'", show_no);

		}		

		ssrDAO.deleteSeatshowReservation(ssr_no);
	}

	@RequestMapping(value = "homelist.do", method = RequestMethod.POST)
	@ResponseBody
	public Object homelist( Model model, HttpServletRequest request,
			@RequestParam(value = "show_startdate",  defaultValue="fa") String show_startdate, 
			@RequestParam(value = "show_enddate",   defaultValue="fa") String show_enddate) {
		//공연정보 출력
		//List<Seat_Show_List> ssplList=ssDAO.selectSeatshowListNext();
		//model.addAttribute("ssplList", ssplList);
		
		System.out.println("start_date : "+show_startdate);
		Map<String, Object> mp = new HashMap<String, Object>();
		
		if(show_startdate.equals("fa")) {
			mp.put("data", ssDAO.selectSeatshowListNext());
		
		}else {
			mp.put("data", ssDAO.selectSeatshowListNextDate("\'"+show_startdate+"\'", "\'"+show_enddate+"\'"));
		}

		Object result = mp;
		System.out.println("mp:"+mp.toString());


		return result;

	}

}
