package com.kosmo.jsonrestapi;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import mybatis.BoardDTO;
import mybatis.IBoardDAO;
import mybatis.ParameterDTO;

@Controller
public class RestAPIController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/restapi/boardList.do")
	@ResponseBody
	public ArrayList<BoardDTO> boardList(HttpServletRequest req) {
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setSearchField(req.getParameter("searchField"));
		ArrayList<String> searchLists = null;

		if (req.getParameter("searchTxt") != null) {
			searchLists = new ArrayList<String>();
			String[] sTxtArray = req.getParameter("searchTxt").split(" ");

			for (String str : sTxtArray) {
				searchLists.add(str);
			}
		}

		parameterDTO.setSearchTxt(searchLists);
		System.out.println("검색어:" + searchLists);
		int totalRecordCount = sqlSession.getMapper(IBoardDAO.class).getTotalCount(parameterDTO);
		int pageSize = 10;
		// int blockPage = 2;

		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;

		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		ArrayList<BoardDTO> lists = sqlSession.getMapper(IBoardDAO.class).listPage(parameterDTO);

		for (BoardDTO dto : lists) {
			String temp = dto.getContent().replace("\r\n", "<br/>");
			dto.setContent(temp);
		}
		return lists;
	}

	@RequestMapping("/restapi/boardView.do")
	@ResponseBody
	public Map<String, String> modify(ParameterDTO parameterDTO) {
		ArrayList<BoardDTO> record = sqlSession.getMapper(IBoardDAO.class).view(parameterDTO);
		Map<String, String> map = new HashMap<String, String>();

		for (BoardDTO dto : record) {
			map.put("num", dto.getNum());
			map.put("title", dto.getTitle());
			map.put("content", dto.getContent());
			map.put("id", dto.getId());
			map.put("postdate", dto.getPostdate().toString());
			map.put("visitcount", dto.getVisitcount());
		}
		return map;
	}
}
