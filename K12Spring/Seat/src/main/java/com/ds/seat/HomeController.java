package com.ds.seat;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ds.seat.dao.Notice_BoardDAO;
import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.dao.SeatShowDAO;
import com.ds.seat.dao.SeatShowReservationDAO;
import com.ds.seat.dao.Show_SeatDAO;
import com.ds.seat.vo.Notice_Board;
import com.ds.seat.vo.Seat_Member;
import com.ds.seat.vo.Seat_Member_Reservation;
import com.ds.seat.vo.Seat_Show;
import com.ds.seat.vo.Seat_Show_List;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private SeatShowDAO ssDAO;

	@Autowired
	private Notice_BoardDAO nbDAO;

	@Autowired
	private SeatMemberDAO smDAO;

	@Autowired
	private SeatShowReservationDAO ssrDAO;

	@RequestMapping(value = {"home.do", "/"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		try {

			//공연정보 출력
			List<Seat_Show_List> ssplList=ssDAO.selectSeatshowListNext();
			model.addAttribute("ssplList", ssplList);

			//공지사항게시판 (상위5개표시예정)
			List<Notice_Board> list=nbDAO.selectNoticeBoardListTop5();
			model.addAttribute("noticelist", list);

		} catch (Exception e) {
			System.out.println("ShowList 컨트롤러 에러 : "+e.getMessage());
		}


		return "home";
	}

	//공연 자세히 들어가기
	@RequestMapping(value = "homeseatintro.do", method = RequestMethod.GET)
	public String homeseatintro(Model model,@RequestParam("show_no") Long show_no) {
		Seat_Show_List ssplVO=ssDAO.selectSeatshowOneData(show_no);
		try {
			model.addAttribute("ssplVO",ssplVO);

			return "use/seat/homeseatintro";

		} catch (Exception e) {
			System.out.println("homeseatintro 에러: "+e.getMessage());
			return "redirect:home.do";
		}

	}

	//공연찾기(날짜별)
	@RequestMapping(value = "homelistselect.do", method = RequestMethod.GET)
	public String homelistSelect(Locale locale, Model model, HttpServletRequest request,
			@RequestParam(value = "show_startdate",  defaultValue="fa") String show_startdate, 
			@RequestParam(value = "show_enddate",   defaultValue="fa") String show_enddate,
			RedirectAttributes redirectAttributes) {
		try {

			System.out.println("start_dateinput : "+show_startdate);

			if(show_startdate=="fa") {
				//공연정보 출력
				List<Seat_Show_List> ssplList=ssDAO.selectSeatshowListNext();
				//model.addAttribute("ssplList", ssplList);
				redirectAttributes.addFlashAttribute("ssplList", ssplList);
			}else {
				//공연정보 출력
				List<Seat_Show_List> ssplList=ssDAO.selectSeatshowListNextDate("\'"+show_startdate+"\'", "\'"+show_enddate+"\'");
				//model.addAttribute("show_startdate", show_startdate);
				//model.addAttribute("show_enddate", show_enddate);
				//model.addAttribute("ssplList", ssplList);
				redirectAttributes.addFlashAttribute("ssplList", ssplList);
				redirectAttributes.addFlashAttribute("show_startdate", show_startdate);
				redirectAttributes.addFlashAttribute("show_enddate", show_enddate);
			}
		} catch (Exception e) {
			System.out.println("ShowList 컨트롤러 에러 : "+e.getMessage());
		}
		return "redirect:homelist.do";
	}

	@RequestMapping(value = "homelist.do", method = RequestMethod.GET)
	public String homelist(Locale locale, Model model, HttpServletRequest request) {


		return "use/home/homelist";
	}




	//이미지관련
	@RequestMapping(value = "homeimgtitle.do", method = RequestMethod.GET)
	public void homeImgTitle
	(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("show_no") Long show_no, @RequestParam("idx") String idx)
	{
		HttpHeaders header=new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		try {
			Seat_Show ssVO=ssDAO.selectSeatshow(show_no);

			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			String filename=null;

			if(idx.equals("1")) {
				System.out.println("1번이미지"+ssVO.getShow_img1());
				filename = ssVO.getShow_img1();
			}else if(idx.equals("2")){
				System.out.println("2번이미지"+ssVO.getShow_img2());
				filename = ssVO.getShow_img2();
			}

			/*String root_path = request.getSession().getServletContext().getRealPath("/");  
			String attach_path = "resources/img/pic";*/
			String root_path ="/home/hosting_users/ijuju88/tomcat/webapps/seat/img/pic"; 


			File file = new File (root_path +"/"+filename);
			int size = (int) file.length();

			if ( file.exists()&& file.isFile() )
			{
				bos = new BufferedOutputStream(response.getOutputStream());
				byte b[] = new byte[2048];
				int read = 0;
				if (size > 0 && file.isFile()) {
					bis = new BufferedInputStream(new FileInputStream(file));
					while ((read = bis.read(b)) != -1) {
						bos.write(b, 0, read);
					}
				}
				bos.close();

			}

		} catch (Exception e) {

		}
	}

	//로그인하기
	//참고 
	@RequestMapping(value = "homelogin.do", method = RequestMethod.POST)
	public String homeLoginPOST(Model model,@RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam("backpage") String backpage, HttpServletRequest request, HttpSession httpsession) {

		Seat_Member vo=new Seat_Member();

		//로그인전 혹시모를 세션 지우기
		httpsession.invalidate();

		System.out.println("아이디값? : "+id);
		System.out.println("비번값? : "+pw);

		vo.setM_id(id);
		vo.setM_pw(pw);

		try {
			Seat_Member vo1=smDAO.seatSelectMemberLoginUse(vo);

			if(vo1!=null) {

				//세션객체 가져옴(로그인 정보 저장...)
				httpsession=request.getSession();
				httpsession.setAttribute("USESID", vo1.getM_id());
				httpsession.setAttribute("USENAME", vo1.getM_pw());

				request.setAttribute("msg", "로그인성공");
				request.setAttribute("url", backpage);


				return "alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:home.do";
		}
		return "redirect:home.do";
	}


	//Mypage 들어가기(예약현황)
	@RequestMapping(value = "homeMyPage1.do", method = RequestMethod.GET)
	public String homeMyPage1GET(Model model,HttpSession session, HttpServletRequest req) {
		List<Seat_Member_Reservation> list = new ArrayList<Seat_Member_Reservation>();

		//id 알아내기
		String m_id=(String)session.getAttribute("USESID");
		list=ssrDAO.selectUseSeatshowReservationSeat(m_id);

		model.addAttribute("list",list);
		return "use/mypage/mypage1";
	}



	//로그아웃 들어가기
	@RequestMapping(value = "homelogout.do", method = RequestMethod.GET)
	public String homeLogoutGET(Model model,HttpSession session, HttpServletRequest req) {

		session.invalidate(); //세션값 지우기
		req.setAttribute("msg", "로그아웃성공");
		req.setAttribute("url", "home.do");


		return "alert";
	}


	//회사소개페이지
	@RequestMapping(value = "about.do", method = RequestMethod.GET)
	public String adbout(Model model) {

		return "about";
	}

}