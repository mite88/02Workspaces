package springboard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

@Service
public class EditActionCommand implements BbsCommandImpl {
 
	@Autowired
	JDBCTemplateDAO dao;
	
	@Override
	public void execute(Model model) {
		
		//Model에 저장된 객체 추출
		Map<String, Object> map = model.asMap();		
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		SpringBbsDTO springBbsDTO = (SpringBbsDTO)map.get("springBbsDTO");

		//DAO객체 생성
		//JDBCTemplateDAO dao = new JDBCTemplateDAO();	
		/*
		//폼값을 개별적으로 받음
		String idx = req.getParameter("idx");				
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String pass = req.getParameter("pass");*/
		//dao.edit(idx, name, title, contents, pass);
		
		//커맨드객체인 DTO를 DAO로 전달한다. 
		dao.edit(springBbsDTO);
	}
}



