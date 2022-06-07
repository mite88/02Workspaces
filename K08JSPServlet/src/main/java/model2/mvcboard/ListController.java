package model2.mvcboard;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import utils.BoardPage;

public class ListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MVCBoardDAO dao = new MVCBoardDAO();

		//검색관련처리

		//검색어가 존재하는 경우 파라미터 저장을 위해 Map계열의 컬랙션 생성
		Map<String, Object> map = new HashMap<String, Object>();
		//파라미터 받기
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");

		//여기선 select는 기본값이 존재하기때문에 searchWord로 null체크를함
		if(searchWord != null){
			//검색테이블의 컬럼명 
			map.put("searchField", searchField);
			//검색어
			map.put("searchWord", searchWord);
		}

		int totalCount = dao.selectCount(map); //게시물수

		/*페이징 start**********************************************************/
		ServletContext application = getServletContext();
		
		//파라미터를 얻은후 사칙연산을 위해 정수로 변환
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		//전체 페이지 계산
		int totalPage = (int)Math.ceil((double)totalCount / pageSize);

		/*
		목록에 첫 진입시 페이지 관련 파라미터가 없기에
		1페이지로 지정하고
		pageNum이 존재하는경우 파라미터를 읽어 페이지 번호를 지정함

		List.jsp : 파라미터 없음
		List.jsp?pageNum= : 파라미터는 있지만 값이 없음
		*/
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")){
			pageNum = Integer.parseInt(pageTemp);
		}

		//게시물의 구간 계산
		int start = (pageNum - 1) * pageSize + 1; //시작번호
		int end = pageNum * pageSize; //종료번호
		//계산된 값을 DAO로 전달하기위해 Map컬렉션에 저장
		map.put("start", start);
		map.put("end", end);

		/*페이징 end************************************************************/
		List<MVCBoardDTO> boardLists = dao.selectListstPage(map); //리스트
		dao.close(); //자원해제
		
		//페이지 번호 생성을 위한 유틸리티 클래스 호출
		String pagingImg = BoardPage.pageingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do", searchField, searchWord);
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	}
}
