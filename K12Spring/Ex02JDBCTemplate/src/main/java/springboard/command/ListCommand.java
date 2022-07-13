package springboard.command;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.ui.Model;

import springboard.command.*;
import springboard.model.*;

public class ListCommand implements BbsCommandImpl {
	
	@Override
	public void execute(Model model) {
		System.out.println("ListCommand > execute() 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		JDBCTemplateDAO dao = new JDBCTemplateDAO();
		
		String addQueryString = "";
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");

		if (searchWord != null) {
			addQueryString = String.format("searchColumn=%s" 
					+ "&searchWord=%s&", searchColumn, searchWord);
			
			paramMap.put("Column", searchColumn);
			paramMap.put("Word", searchWord);
		}
		
		//전체 레코드 수 카운트하기 
		int totalRecordCount = dao.getTotalCount(paramMap);
		//출력할 리스트 가져오기 
		ArrayList<SpringBbsDTO> listRows = dao.list(paramMap);
		
		System.out.println("totalRecordCount:"+totalRecordCount);
		System.out.println("listRows:"+listRows);

		// 가상번호 계산하여 부여하기 
		int virtualNum = 0;
		int countNum = 0;

		for (SpringBbsDTO row : listRows) {
			virtualNum = totalRecordCount--;
			row.setVirtualNum(virtualNum);
		}

		model.addAttribute("listRows", listRows);

		dao.close();
	}
}