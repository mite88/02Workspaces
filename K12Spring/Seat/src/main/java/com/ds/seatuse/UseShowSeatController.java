package com.ds.seatuse;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ds.seat.HomeController;
import com.ds.seat.dao.*;
import com.ds.seat.vo.*;
@Controller
public class UseShowSeatController {
	@Autowired
	private SeatShowDAO ssDAO;

	@Autowired
	private Show_SeatDAO sseatDAO;


	@Autowired
	private SeatMemberDAO smDAO;


	@Autowired
	private SeatShowReservationDAO ssrDAO;

	//변수받기
	private static Long no=null;


	//공연 정보
	@RequestMapping(value = "homeshowseat1.do", method = RequestMethod.GET)
	public String step1(Model model,@RequestParam("show_no") Long show_no) {

		Seat_Show_List ssplVO1=ssDAO.selectSeatshowOneData(show_no);
		List<Show_Seat> scVO1=sseatDAO.SelectShowSeatList(show_no);

		model.addAttribute("ssplVO1",ssplVO1);
		model.addAttribute("scVO1",scVO1);	

		no=show_no;
		return "use/seat/step1";
	}

	//공연 좌석선택시
	@RequestMapping(value = "homeshowseat1.do", method = RequestMethod.POST)
	public ModelAndView step1post(Model model,
			@RequestParam("show_no") Long show_no) {

		System.out.println("step1 : "+show_no);

		//파라미터 숨기기
		RedirectView rv=new RedirectView("homeshowseat2.do");
		rv.setExposeModelAttributes(false);
		ModelAndView mav=new ModelAndView(rv);

		return new ModelAndView(rv);
	}


	//공연 좌석
	@RequestMapping(value = "homeshowseat2.do", method = RequestMethod.GET)
	public String step2get(Model model,HttpServletRequest request) {

		List<Show_Seat> scVO1=sseatDAO.SelectShowSeatList(no);

		//좌석번호
		List<String> AlphaArray=new ArrayList<String>();
		//좌석갯수
		List<Integer> SeatArrayRow=new ArrayList<Integer>();
		List<String> SeatArrayCol=new ArrayList<String>();

		List<Integer> Array=new ArrayList<Integer>();


		for (int i = 0; i < scVO1.size(); i++) {
			Array.add(scVO1.get(i).getSs_seatrow());
			for (int j = 0; j < Array.get(i); j++) {
				System.out.println("값:"+ j);
				AlphaArray.add(scVO1.get(i).getSs_seattype());
			}
		}
		//col
		for (int i = 0; i < scVO1.size(); i++) {

			for (int k = 0; k < scVO1.get(i).getSs_seatrow(); k++) {
				SeatArrayRow.add(k);	
				for (int j = 0; j < scVO1.get(i).getSs_seatcol(); j++) {
					SeatArrayCol.add(scVO1.get(i).getSs_seattype()+j);	
				}
			}
		}


		System.out.println("알파벳 : "+AlphaArray);
		System.out.println(SeatArrayRow);
		System.out.println(SeatArrayCol);
		model.addAttribute("AlphaArray",AlphaArray);
		model.addAttribute("scVOseatCol",SeatArrayCol);
		model.addAttribute("scVOseatRow",SeatArrayRow);
		model.addAttribute("scVO1",scVO1);

		List<String> seatArray1 = new ArrayList<String>();
		List<String> seatArrayno = new ArrayList<String>();
		//예약한좌석번호 찾기
		List<Seat_Show_Reservation> ssrlist = ssrDAO.selectSeatshowReservationSeatlList(no);
		
		//예약되었지만 결제 안된 좌석번호 찾기
		List<Seat_Show_Reservation> ssrlistno = ssrDAO.selectSeatshowReservationSeatlListPayno(no);

		if(ssrlist.size() != 0 || !(ssrlist.isEmpty())) {

			for (int i = 0; i < ssrlist.size(); i++) {
				String elememt= ssrlist.get(i).getSsr_seat().toString();

				StringTokenizer values = new StringTokenizer(elememt, "," );

				while(values.hasMoreElements()){

					seatArray1.add(values.nextToken() );

				}

			}
			model.addAttribute("seatArray",seatArray1);
		}
		
		if(ssrlistno.size() != 0 || !(ssrlistno.isEmpty())) {

			for (int i = 0; i < ssrlistno.size(); i++) {
				String elememtno= ssrlistno.get(i).getSsr_seat().toString();

				StringTokenizer valuesno = new StringTokenizer(elememtno, "," );

				while(valuesno.hasMoreElements()){

					seatArrayno.add(valuesno.nextToken() );

				}

			}
			model.addAttribute("seatArrayno",seatArrayno);
		}
		model.addAttribute("show_no",no);


		return "use/seat/step2";
	}


	//공연 예약시
	@RequestMapping(value = "homeshowseat2.do", method = RequestMethod.POST)
	public ModelAndView step2post(Model model,HttpServletRequest request,
			@RequestParam("show_no") Long show_no,
			@RequestParam("NumberDisplay") int count,
			@RequestParam("seatsDisplay") String ssr_seat,
			HttpSession session) {

		System.out.println("step2 : "+ show_no+"/"+count+"/"+ssr_seat);

		//세션값가지고오기
		String id=(String)session.getAttribute("USESID");
		System.out.println("id : "+id);

		//로그인테이블로 m_no찾기
		Seat_Member smvo=smDAO.seatSelectMemberOne(id);
		int m_no=smvo.getM_no();

		//좌석구분용
		String Seats=null;

		//좌석총가격
		int ssr_price=0;

		//예약한 좌석 나누기용
		String[] ssrarray = ssr_seat.split(",");	

		//출력				
		for(int i=0;i<ssrarray.length;i++) {
			//System.out.println(ssrarray[i]);
			System.out.println(ssrarray[i].replaceAll("[^a-zA-Z]", ""));

			String seat=ssrarray[i].replaceAll("[^a-zA-Z]", "");
			
			//좌석수 검색해서 좌석수 줄이기
			int seatcount=sseatDAO.SelectShowSeatCount("\'"+seat+"\'", no);
	
			sseatDAO.updateMinusPlusSeat(seatcount-1, "\'"+seat+"\'", show_no);

			int price=sseatDAO.SelectShowSeatType("\'"+seat+"\'", no);

			//좌석번호마다 좌석확인 및 계산을 위한....

			ssr_price+=price;



		}
		System.out.println("ssr_price : "+ssr_price);
		Seat_Show_Reservation ssrvo=new Seat_Show_Reservation();

		ssrvo.setSsr_price(ssr_price);
		ssrvo.setSsr_seat(ssr_seat);
		ssrvo.setM_no(m_no);
		ssrvo.setShow_no(show_no);

		ssrDAO.insertSeatShowReservationOne(ssrvo);

		RedirectView rv=new RedirectView("homeshowseat3.do");
		rv.setExposeModelAttributes(false);
		ModelAndView mav=new ModelAndView(rv);
		return new ModelAndView(rv);
	}


	//공연 좌석
	@RequestMapping(value = "homeshowseat3.do", method = RequestMethod.GET)
	public String step3get(Model model) {
		Seat_Show_List ssplVO=ssDAO.selectSeatshowOneData(no); //공연정보 

		Map<String, Object> map= new HashMap<String, Object>(); 
		map=ssrDAO.selectSeatshowReservationSeatOne(no); //예약정보출력

		String id=String.valueOf(map.get("M_ID"));
		Seat_Member smVO=smDAO.seatSelectMemberOne(id);

		//예약한 좌석 나누기용
		ArrayList<String>  mappay= new ArrayList<String>(); 

		String seats=String.valueOf(map.get("SSR_SEAT"));
		
		//예약한 좌석 나누기용
		String[] ssrarray= seats.split(",");
		System.out.println("ssrarray:"+ssrarray);
		
		//출력				
		for(int i=0;i<ssrarray.length;i++) {
			//System.out.println(ssrarray[i]);
			System.out.println(ssrarray[i].replaceAll("[^a-zA-Z]", ""));

			String seat=ssrarray[i].replaceAll("[^a-zA-Z]", "");

			int pay=sseatDAO.SelectShowSeatType("\'"+seat+"\'", no);
			mappay.add(String.valueOf(pay));
		}
	
		System.out.println("map : "+map.toString()); 
		System.out.println("mappay : "+mappay.toString()); 

		model.addAttribute("ssplVO",ssplVO);//가격정보
		model.addAttribute("smVO",smVO);//예약자정보

		model.addAttribute("show_no",no);//공연장번호
		model.addAttribute("seat3map",map); //예약정보

		model.addAttribute("mappay",mappay); //가격검색용
		return "use/seat/step3";

	}



	//예약완료
	@RequestMapping(value = "homeshowseat4.do", method = RequestMethod.GET)
	public String step4get(Model model) {
		return "use/seat/step4";

	}



	//공연 좌석(예약하지 않고 mypage에서 예약시)
	@RequestMapping(value = "homepayseat3.do", method = RequestMethod.GET)
	public String homePayStep3get(Model model,
			@RequestParam("show_no") Long show_no,@RequestParam("ssr_no") int ssr_no) {
		Seat_Show_List ssplVO=ssDAO.selectSeatshowOneData(show_no); //공연정보 

		Map<String, Object> map= new HashMap<String, Object>(); 
		map=ssrDAO.selectSeatshowReservationSeatOne(show_no); //예약정보출력

		String id=String.valueOf(map.get("M_ID"));
		Seat_Member smVO=smDAO.seatSelectMemberOne(id);

		//예약한 좌석 나누기용
		ArrayList<String>  mappay= new ArrayList<String>(); 

		String seats=String.valueOf(map.get("SSR_SEAT"));
		
		//예약한 좌석 나누기용
		String[] ssrarray= seats.split(",");
		System.out.println("ssrarray:"+ssrarray);
		
		//출력				
		for(int i=0;i<ssrarray.length;i++) {
			//System.out.println(ssrarray[i]);
			System.out.println(ssrarray[i].replaceAll("[^a-zA-Z]", ""));

			String seat=ssrarray[i].replaceAll("[^a-zA-Z]", "");

			int pay=sseatDAO.SelectShowSeatType("\'"+seat+"\'", show_no);
			mappay.add(String.valueOf(pay));
		}
	
		System.out.println("map : "+map.toString()); 
		System.out.println("mappay : "+mappay.toString()); 

		model.addAttribute("ssplVO",ssplVO);//가격정보
		model.addAttribute("smVO",smVO);//예약자정보

		model.addAttribute("show_no",show_no);//공연장번호
		model.addAttribute("seat3map",map); //예약정보

		model.addAttribute("mappay",mappay); //가격검색용
		return "use/seat/step3";

	}


}
