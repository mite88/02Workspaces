package com.ds.seat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ds.seat.dao.Question_BoardDAO;
import com.ds.seat.dao.SeatMemberDAO;
import com.ds.seat.vo.Question_Board;
import com.ds.seat.vo.Seat_Member;



/**
 * Handles requests for the application home page.
 */
@Controller
public class QuestionController {

	@Autowired
	private Question_BoardDAO qbDAO;

	@Autowired
	private SeatMemberDAO smDAO;

	//문의게시판 들어가기
	@RequestMapping(value = "home_questionlist.do", method = RequestMethod.GET)
	public String homeQuestionList(Model model, HttpSession session) {

		try {

			List<Question_Board> list=qbDAO.selectQuestioQBoardList();
			model.addAttribute("list", list);

			String id = (String)session.getAttribute("SID");
			int vo1=smDAO.seatSelectMemberLoginChk(id);
			System.out.println("SID:"+id+"vo1:"+vo1);

			//페이지 나누기
			if(vo1==0) {
				return "use/question/question_list";
			}else{
				return "admin/question/question_list";
			}

		} catch (Exception e) {
			System.out.println("공지사항게시판 에러 : "+e.getMessage());
			return null;
		}


	}

	//문의게시판 글작성들어가기
	@RequestMapping(value = "home_questionwrite.do", method = RequestMethod.GET)
	public String homeQuestionWriteGet(Model model,HttpSession session,
			@RequestParam(value="qb_no", defaultValue="0")int qb_no) {
		//문의 답글 관련 변수 선언

		if(qb_no==0){  
			qb_no=0; 
		}

		Question_Board qbVO=qbDAO.selectQuestioQBoardView(qb_no);

		if(qbVO!=null){
			model.addAttribute("qbVO", qbVO);
		}	

		String id = (String)session.getAttribute("SID");
		int vo1=smDAO.seatSelectMemberLoginChk(id);
		System.out.println("SID:"+id+"vo1:"+vo1);

		//페이지 나누기
		if(vo1==0) {
			return "use/question/question_write";
		}else{
			return "admin/question/question_write";
		}

	}


	//문의게시판 글작성하기
	@RequestMapping(value = "question_writesave.do", method = RequestMethod.POST)
	public String homeQuestionWritePOST(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("qb_no")int qb_no, @RequestParam("qb_writer")String qb_writer,
			@RequestParam("qb_title")String qb_title, @RequestParam("qb_content")String qb_content,
			@RequestParam("qb_ref")int qb_ref, @RequestParam("qb_restep")int qb_restep,
			@RequestParam("qb_level")int qb_level,HttpSession session) {

		int num;
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");

			System.out.println("qb_writer:"+ qb_writer);
			Question_Board qbVO=new Question_Board();
			//글 마지막번호 조회및 지정작업
			int maxnum=qbDAO.selectQuestioQBoardMax();	


			if(maxnum!=0){
				num=maxnum+1; //최신글이면 번호+1
			}else {
				num=1; //처음글번호
			}
			System.out.println("num:"+num);
			//답글
			if(qb_no!=0) {
				System.err.println("답글");
				qbDAO.updateQuestioQBoardStepOne(qbVO);
				// 답글의 ref는 원부모글의 ref를 그대로 가져다 사용 
				qb_restep=qb_restep+1;       //글 순서를 부모 글보다 1 증가. 
				qb_level=qb_level+1;     //글 레벨 역시 부모 글보다 1 증가 
			}else {
				//답글이 아니면
				System.err.println("답글아님");
				qb_ref=num;
				qb_restep=0;       
				qb_level=0; 
			}

			qbVO.setQb_no(num);
			qbVO.setQb_writer(qb_writer);
			qbVO.setQb_title(qb_title);
			qbVO.setQb_content(qb_content);
			qbVO.setQb_ref(qb_ref);
			qbVO.setQb_restep(qb_restep);
			qbVO.setQb_level(qb_level);

			qbDAO.insertQuestioQBoardOne(qbVO);

			return "redirect:home_questionlist.do";

		} catch (Exception e) {
			System.out.println("문의 게시판 글쓰기 에러 : "+e.getMessage());
			return "redirect:home_questionwrite.do";
		}

	}


	//문의게시판 보기
	@RequestMapping(value = "home_questionview.do", method = RequestMethod.GET)
	public String homeQuestionViewGET(Model model, @RequestParam("qb_no")int qb_no
			,HttpSession session) {
		try {

			//해당글 찾기
			Question_Board qbVO=qbDAO.selectQuestioQBoardView(qb_no);
			model.addAttribute("qbVO", qbVO);

			//관리자만 문의 답변할수 있도록 하기위해서


			String id = (String)session.getAttribute("SID");
			int vo1=smDAO.seatSelectMemberLoginChk(id);
			System.out.println("SID:"+id+"vo1:"+vo1);

			//페이지 나누기
			if(vo1==0) {
				return "use/question/question_view";
			}else{
				return "admin/question/question_view";
			}


		} catch (Exception e) {
			System.out.println("공지사항 게시판 글보기 에러 : "+e.getMessage());
			return null;
		}

	}


	//문의게시판 수정하기로 들어가기
	@RequestMapping(value = "home_questionupdate.do", method = RequestMethod.GET)
	public String homeQuestionUpdateGET(Model model, @RequestParam("qb_no")int qb_no
			,HttpSession session) {

		try {

			Question_Board qbVO=qbDAO.selectQuestioQBoardView(qb_no);

			model.addAttribute("qbVO", qbVO);

			String id = (String)session.getAttribute("SID");
			int vo1=smDAO.seatSelectMemberLoginChk(id);
			System.out.println("SID:"+id+"vo1:"+vo1);

			//페이지 나누기
			if(vo1==0) {
				return "use/question/question_update";
			}else{
				return "admin/question/question_update";
			}


		} catch (Exception e) {
			System.out.println("공지사항 게시판 글수정 에러 : "+e.getMessage());
			return null;
		}

	}


	//문의게시판 글수정시
	@RequestMapping(value = "home_questionupdate.do", method = RequestMethod.POST)
	public String homeQuestionUpdatePOST(Model model,HttpServletRequest request, HttpServletResponse response,
			@RequestParam("qb_no")int qb_no, @RequestParam("qb_writer")String qb_writer,
			@RequestParam("qb_title")String qb_title, @RequestParam("qb_content")String qb_content,
			HttpSession session) {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			Question_Board qbVOs=new Question_Board(qb_no, qb_writer, qb_title, qb_content);
			qbDAO.updateNoticeBoardOne(qbVOs);

			String id = (String)session.getAttribute("SID");
			int vo1=smDAO.seatSelectMemberLoginChk(id);
			System.out.println("SID:"+id+"vo1:"+vo1);


			model.addAttribute("msg", "글수정 성공");
			model.addAttribute("url", "home_questionview.do?qb_no="+qb_no);

			return "alert";


		} catch (Exception e) {
			System.out.println("공지사항게시판수정 에러 : "+e.getMessage());
			return "redirect:home_questionview.do?qb_no="+qb_no;
		}
	}


	//문의게시판글 삭제하기
	@RequestMapping(value = "question_delete.do", method = RequestMethod.GET)
	public String homeQuestionDeleteGET(Model model, @RequestParam("qb_no")int qb_no,HttpSession session) {

		try {

			String id = (String)session.getAttribute("SID");
			int vo1=smDAO.seatSelectMemberLoginChk(id);
			System.out.println("SID:"+id+"vo1:"+vo1);

			//페이지 나누기
			if(vo1==0) {
				qbDAO.NotdeleteUpdateQuestioQBoardOne(qb_no);

			}else{
				qbDAO.deleteQuestioQBoardOne(qb_no);
			}
			model.addAttribute("msg", "글삭제 성공");
			model.addAttribute("url", "home_questionlist.do");
			return "alert";


		} catch (Exception e) {
			System.out.println("공지사항 게시판 글삭제 에러 : "+e.getMessage());
			return "redirect:home_questionlist.do?qb_no="+qb_no;
		}

	}


}

