package springboard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

@Service
public class WriteActionCommand implements BbsCommandImpl{
	
	@Autowired
	private JDBCTemplateDAO dao;


	@Override
	public void execute(Model model) {
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		SpringBbsDTO springBbsDTO =(SpringBbsDTO)paramMap.get("springBbsDTO");
		
		System.out.println("springBbsDTO.title"+springBbsDTO.getTitle());

		
		dao.write(springBbsDTO);
		dao.close();
		
	}
}
