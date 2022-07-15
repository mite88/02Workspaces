package springboard.command;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.command.*;
import springboard.model.*;
import springboard.util.EnvFileReader;
import springboard.util.PageingUtil;

@Service
public class ListCommand implements BbsCommandImpl {

	@Autowired
	private JDBCTemplateDAO dao;
	
	public ListCommand() {
		System.out.println("list빈생성");
	}

	
	@Override
	public void execute(Model model) {
		System.out.println("ListCommand > execute() 호출");

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest) paramMap.get("req");

		String addQueryString = "";
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");

		if (searchWord != null) {
			addQueryString = String.format("searchColumn=%s" + "&searchWord=%s&", searchColumn, searchWord);

			paramMap.put("Column", searchColumn);
			paramMap.put("Word", searchWord);
		}

		// 전체 레코드 수 카운트하기
		int totalRecordCount = dao.getTotalCount(paramMap);
		
		
		// 페이지처리
		int pageSize = Integer.parseInt(EnvFileReader.getValue("SpringBbsInit.properties", "springBoard.pageSize"));

		int blockPage = Integer.parseInt(EnvFileReader.getValue("SpringBbsInit.properties", "springBoard.blockPage"));

		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = req.getParameter("nowPage") == null ? 1 : 
			Integer.parseInt(req.getParameter("nowPage"));

		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;

		paramMap.put("start", start);
		paramMap.put("end", end);
		
		
		// 출력할 리스트 가져오기
		ArrayList<SpringBbsDTO> listRows = dao.listPage(paramMap);

		System.out.println("totalRecordCount:" + totalRecordCount);
		System.out.println("listRows:" + listRows);

		// 가상번호 계산하여 부여하기
		int virtualNum = 0;
		int countNum = 0;


		for (SpringBbsDTO row : listRows) {
			/*
			 * virtualNum = totalRecordCount--; row.setVirtualNum(virtualNum);
			 */
			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			row.setVirtualNum(virtualNum);
			String reSpace ="";
			if(row.getBindent() > 0) {
				for (int i = 0; i < row.getBindent(); i++) {
					reSpace += "&nbsp;&nbsp;";
				}
				row.setTitle(reSpace+""+"<img src='../resources/re3.gif' />"+row.getTitle());
			}
		}

		String pageingImg = PageingUtil.pageingImg(totalRecordCount,
				pageSize, blockPage, nowPage, req.getContextPath()
				+"/board/list.do?"+addQueryString);

		model.addAttribute("pageingImg", pageingImg); 
		model.addAttribute("totalPage", totalPage);//전체페이지수
		model.addAttribute("nowPage", nowPage); // 현재페이지수
		model.addAttribute("listRows", listRows);
		
		if (searchWord != null) {

			model.addAttribute("searchColumn", searchColumn);
			model.addAttribute("searchWord", searchWord);
		}


		dao.close();
	}
}