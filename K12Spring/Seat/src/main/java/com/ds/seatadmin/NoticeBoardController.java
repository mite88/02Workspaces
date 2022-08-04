package com.ds.seatadmin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ds.seat.dao.Notice_BoardDAO;
import com.ds.seat.vo.Notice_Board;

@Controller
public class NoticeBoardController {

	@Autowired
	private Notice_BoardDAO nbDAO;

	//공지사항목록
	@RequestMapping(value = "notice_list.do", method = RequestMethod.GET)
	public String noticeListGET(Model model) {
		try {

			List<Notice_Board> list=nbDAO.selectNoticeBoardList();
			model.addAttribute("noticelist", list);

		} catch (Exception e) {
			System.out.println("공지사항게시판 에러 : "+e.getMessage());
		}

		return "admin/notice/notice_list";
	}



	//공지사항쓰기
	@RequestMapping(value = "notice_write.do", method = RequestMethod.GET)
	public String noticeWriteGET(Model model) {
		return "admin/notice/notice_write";
	}

	//공지사항쓴내용 넘기기
	@RequestMapping(value = "notice_writesave.do", method = RequestMethod.POST)
	public String noticeWritePOST(Model model,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam("nb_title")String nb_title,
			@RequestParam("nb_category")String nb_category,
			@RequestParam("nb_content")String nb_content ) {

		System.out.println("nb_category:"+nb_category);

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			Notice_Board nbVO=new Notice_Board();  
			System.out.println(nb_category.toString());
			nbVO.setNb_title(nb_title);
			nbVO.setNb_category(nb_category);
			nbVO.setNb_content(nb_content);

			nbDAO.insertNoticeBoardOne(nbVO);

			model.addAttribute("msg", "글쓰기 성공");
			model.addAttribute("url", "notice_list.do");

			return "alert";

		} catch (Exception e) {
			System.out.println("공지사항게시판쓰기 에러 : "+e.getMessage());
			return "redirect:notice_write.do";
		}
	}


	//공지사항보기
	@RequestMapping(value = "notice_view.do", method = RequestMethod.GET)
	public String noticeViewGET(Model model, @RequestParam("nb_no")int nb_no) {
		try {

			Notice_Board nbVO=nbDAO.selectNoticeBoardView(nb_no);

			model.addAttribute("nbVO", nbVO);
			return "admin/notice/notice_view";


		} catch (Exception e) {
			System.out.println("공지사항 게시판 글보기 에러 : "+e.getMessage());
			return "redirect:notice_list.do";
		}

	}



	//공지사항 수정하기로 들어가기
	@RequestMapping(value = "notice_update.do", method = RequestMethod.GET)
	public String noticeUpdateGET(Model model, @RequestParam("nb_no")int nb_no) {

		try {

			Notice_Board nbVO=nbDAO.selectNoticeBoardView(nb_no);

			model.addAttribute("nbVO", nbVO);
			return "admin/notice/notice_update";


		} catch (Exception e) {
			System.out.println("공지사항 게시판 글보기 에러 : "+e.getMessage());
			return "redirect:notice_list.do";
		}

	}


	//공지사항 글수정시
	@RequestMapping(value = "notice_update.do", method = RequestMethod.POST)
	public String noticeUpdatePOST(Model model,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam("nb_no")int nb_no,
			@RequestParam("nb_title")String nb_title,
			@RequestParam("nb_category")String nb_category,
			@RequestParam("nb_content")String nb_content ) {

		System.out.println("nb_category:"+nb_category);

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			Notice_Board nbVO=new Notice_Board();  
			System.out.println(nb_category.toString());
			nbVO.setNb_no(nb_no);
			nbVO.setNb_title(nb_title);
			nbVO.setNb_category(nb_category);
			nbVO.setNb_content(nb_content);

			nbDAO.updateNoticeBoardOne(nbVO);

			model.addAttribute("msg", "글수정 성공");
			model.addAttribute("url", "notice_view.do?nb_no="+nb_no);

			return "alert";

		} catch (Exception e) {
			System.out.println("공지사항게시판수정 에러 : "+e.getMessage());
			return "redirect:notice_view.do?nb_no="+nb_no;
		}
	}


	//공지사항 삭제하기
	@RequestMapping(value = "notice_delete.do", method = RequestMethod.GET)
	public String noticeDeleteGET(Model model, @RequestParam("nb_no")int nb_no) {

		try {
			nbDAO.deleteNoticeBoardOne(nb_no);
			model.addAttribute("msg", "글삭제 성공");
			model.addAttribute("url", "notice_list.do");

			return "alert";


		} catch (Exception e) {
			System.out.println("공지사항 게시판 글삭제 에러 : "+e.getMessage());
			return "redirect:notice_view.do?nb_no="+nb_no;
		}

	}

}
