package com.contoller.admin;

import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.contact.ContactDAO;
import com.contact.ContactDTO;
import com.member.MemberDAO;
import com.member.MemberDTO;

import utils.BoardPage;
import utils.BookBoardPage;
import utils.JSFunction;

@WebServlet("/admin.do/member/*")
public class MemberController extends HttpServlet {

	//여기서  doGet, doPost를 만들겁니다
	//포멧지정
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");

		// 여기서 doGet, doPost를 만들겁니다
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			MemberDTO dto = new MemberDTO();
			MemberDAO dao = new MemberDAO();
			
			String uri = req.getRequestURI(); // URI값
			String path = req.getContextPath(); // 컨텍스트 경로

			String command = uri.substring(path.length()); // 요청 분기
			String page_name="";//페이지 이동위치
			String title_name="";//페이지 제목
			
			int result = 0;

			
			//포워딩에 사용하기 위한 변수
			RequestDispatcher dispatcher = null;
			String method = req.getMethod();

			System.out.println(command);

			if (command.contains("/admin.do/member/list") && method.equals("GET")) {
				// 가입리스트
				page_name="/admin/member/list.jsp";
				title_name ="가입자 리스트";
				
				System.out.println("!!");
					
				//파라미터 및 View로 전달할 데이터를 저장하기 위해 Map컬렉션을 생성
				Map<String, Object> map = new HashMap<String, Object>();
				
				//검섹어 관련 파라미터 처리
				String searchField = req.getParameter("searchField");
				String searchWord = req.getParameter("searchWord");
				
				if(searchWord != null) {
					//검색어를 입력한 경우에만 Model(데이터베이스)로 전달하기 위해 저장함
					map.put("searchField", searchField);
					map.put("searchWord", searchWord);
				}
				//게시물의 갯수를 카운트 함. 검색어가 있는 경우 Map컬렉션을 통해 전달됨.
				int totalCount = dao.selectCount(map);
				
				/* 페이지 처리 start*/
				//서블릿에서 web.xml에 접근하기 위해 application내장객체를 얻어옴
				ServletContext application = getServletContext();
				//컨텍스트 초기화 파라미터를 얻어옴.
				//한페이지당 출력할 게시물의 갯수
				int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
				//한 블럭당 출력할 페이지 번호 갯수
				int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
				
				/*
				목록에 첫 진입시에는 무조건 1페이지로 가정한 후 게시물을 얻어옴.
				특정 페이지로 진입한 경우에는 파라미터를 받아서 구간을 계산하여 얻어옴.
				 */
				int pageNum = 1;
				//파라미터로 넘어오는 pageNum이 있다면 값을 얻어와서..
				String pageTemp = req.getParameter("pageNum");

				//정수로 변환한 후 현재 페이지번호로 지정한다.
				if(pageTemp != null && !pageTemp.equals("")) {
					pageNum = Integer.parseInt(pageTemp);
				}
				
				//게시물의 구간을 계산함.
				/*
				MySQL의 경우 페이징을 위해 Limit를 사용한다.
				사용법 : limit 게시물의 시작인덱스, 출력할 게시물의 갯수
					따라서 start(시작위치)만 계산하면 된다.
					start => 
						1페이지일때 : (1-1) * 2 = 0
						2페이지일때 : (2-1) * 2 = 2
						3페이지일때 : (3-1) * 2 = 4 
				 */
				int start = (pageNum - 1) * pageSize;
				int end = pageSize;
				//계산된 값은 Model로 전달하기 위해 Map컬렉션에 저장함.
				map.put("start", start);
				map.put("end", end);
				/* 페이지 처리 end */

				//현재 페이지에 출력할 게시물을 얻어옴.
				List<MemberDTO> memberLists = dao.selectListPage(map);
				//커넥션풀에 자원 반납
				dao.close();
				
				//페이지 번호 생성을 위한 유틸리티 클래스 호출
				String pagingImg = BoardPage.pageingStr(totalCount, pageSize, blockPage, pageNum,  path+"/admin.do/member/list", searchField, searchWord);
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("pageSize", pageSize);
				map.put("pageNum", pageNum);
						
				System.out.println("pagingImg:"+pagingImg);
				System.out.println("totalCount:"+totalCount);
				System.out.println("pageSize:"+pageSize);
				System.out.println("pageNum"+pageNum);
				System.out.println("pageTemp:"+pageTemp+"/searchField:"+searchField+"/searchWord:"+searchWord);
				//View로 전달할 객체들을 request영역에 저장한다.
				req.setAttribute("memberLists", memberLists);
				req.setAttribute("map", map);

			}else if (command.contains("/admin.do/member/modify") ) {
				//회원수정
				
				req.setCharacterEncoding("UTF-8"); //인코딩 지정 xml에서 작업했다면 안해도되지만...
				
				String user_id = req.getParameter("user_id");
				String user_pw = req.getParameter("user_pw1");
				String user_name = req.getParameter("user_name");
				String user_email = req.getParameter("user_email1")+"@"+req.getParameter("user_email2");
				String user_phone = req.getParameter("user_phone1")+"-"+req.getParameter("user_phone2")+"-"+req.getParameter("user_phone3");
				//checkBox의 여러 내용을 저장하기위해 getParameterValues 사용
				String[] user_hoddy = req.getParameterValues("user_hoddy");
				String user_job = req.getParameter("user_job");
				String user_info = req.getParameter("user_info");
				String memberLevel = req.getParameter("memberLevel");
				
				//megister_date은 기본으로 sysdate를 지정하였으므로 할필요없습니다
				
				MemberDAO mDao = new MemberDAO();
				MemberDTO mDto = new MemberDTO();
				
				mDto.setUser_id(user_id);
				mDto.setUser_pw(user_pw);
				mDto.setUser_name(user_name);
				mDto.setUser_email(user_email);
				mDto.setUser_phone(user_phone);
				String hoddy_formatted = String.join(", ", user_hoddy);
				mDto.setUser_hoddy(hoddy_formatted);
				mDto.setUser_job(user_job);
				mDto.setUser_info(user_info);
				mDto.setMemberLevel(memberLevel);
				
				result = mDao.memberUpdate(mDto);
				
				mDao.close(); //반납
				
				
			
			
			}else if (command.contains("/admin.do/member/delete") ) {
				//회원탈퇴
				String user_id = req.getParameter("del_id");
				String user_pw = req.getParameter("del_pw"); //prompt에서 

				System.out.println("prompt:"+user_pw);
				
				//DB 연결
				dao = new MemberDAO();
				dto = new MemberDTO();
				
				dto.setUser_id(user_id);
				dto.setUser_pw(user_pw);

				//삭제
				result = dao.memberDelete(dto);
				
				dao.close(); //반납
				
			
			}
			
			if(page_name!="" && !command.contains("/admin.do/member/delete") && !command.contains("/admin.do/member/modify")) {
				req.setAttribute("title_name", title_name);
				req.setAttribute("result", 1);
				
				dispatcher = req.getRequestDispatcher(page_name);
				dispatcher.forward(req, resp);
			}else if(command.contains("/admin.do/member/delete") || command.contains("/admin.do/member/modify")){

				//삭제완료시...
				if(result == 1) {
					JSFunction.alertLocation(resp, "완료", "../../admin.do");
				}else {
					JSFunction.alertBack(resp, "실패");
				}
				
			}else {
				JSFunction.alertBack(resp, "페이지 오류");
			}
			

		}
}
