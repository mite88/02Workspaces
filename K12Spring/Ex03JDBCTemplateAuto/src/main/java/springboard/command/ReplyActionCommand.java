package springboard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

@Service
public class ReplyActionCommand implements BbsCommandImpl{
	
	@Autowired
	private JDBCTemplateDAO dao;


	@Override
	public void execute(Model model) {
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		SpringBbsDTO dto =(SpringBbsDTO)paramMap.get("springBbsDTO");
		
		System.out.println("springBbsDTO.title"+dto.getTitle());

		dao.reply(dto);
		
	}
}
