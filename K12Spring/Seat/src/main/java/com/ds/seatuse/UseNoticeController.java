package com.ds.seatuse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ds.seat.dao.Notice_BoardDAO;
import com.ds.seat.vo.Notice_Board;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UseNoticeController {

	@Autowired
	private Notice_BoardDAO nbDAO;


	//공지사항 들어가기(사용자용)
	@RequestMapping(value = "home_noticelist.do", method = RequestMethod.GET)
	public String homeNoticeList(Model model) {
		try {

			List<Notice_Board> list=nbDAO.selectNoticeBoardList();
			model.addAttribute("noticelist", list);

		} catch (Exception e) {
			System.out.println("공지사항게시판 에러 : "+e.getMessage());
		}

		return "use/notice/notice_list";
	}

	//공지사항보기(사용자용)
	@RequestMapping(value = "home_noticeview.do", method = RequestMethod.GET)
	public String noticeViewGET(Model model, @RequestParam("nb_no")int nb_no) {
		try {

			Notice_Board nbVO=nbDAO.selectNoticeBoardView(nb_no);

			model.addAttribute("nbVO", nbVO);
			return "use/notice/notice_view";


		} catch (Exception e) {
			System.out.println("공지사항 게시판 글보기 에러 : "+e.getMessage());
			return "redirect:home_noticelist.do";
		}

	}


}

