package springboard.command;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.command.*;
import springboard.model.*;

@Service
public class EditCommand implements BbsCommandImpl {
	

	@Autowired
	private JDBCTemplateDAO dao;

	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");

		SpringBbsDTO dto = dao.view(idx);
		model.addAttribute("viewRow", dto);

		dao.close();
	}
}