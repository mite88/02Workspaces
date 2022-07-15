package springboard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

@Service
public class ReplyCommand implements BbsCommandImpl {
	
	@Autowired
	private JDBCTemplateDAO dao;

	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest) paramMap.get("req");
		String idx = req.getParameter("idx");

		SpringBbsDTO dto = dao.view(idx);
		
		dto.setTitle("[RE]"+dto.getTitle());
		dto.setContents("\n\r\n\r---[원본글]---\n\r\n\r"+dto.getContents());

		model.addAttribute("replyRow", dto);
	}
}
