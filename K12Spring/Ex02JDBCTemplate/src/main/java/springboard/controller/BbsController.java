package springboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import springboard.command.BbsCommandImpl;
import springboard.command.EditCommand;
import springboard.command.ListCommand;
import springboard.command.ViewCommand;
import springboard.command.WriteActionCommand;
import springboard.model.JDBCTemplateDAO;
import springboard.model.JdbcTemplateConst;
import springboard.model.SpringBbsDTO;

@Controller
public class BbsController {
	private JdbcTemplate template;
	BbsCommandImpl command = null;

	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired -> JDBCTemplate 연결성공");

		JdbcTemplateConst.template = this.template;
	}

	@RequestMapping("/board/list.do")
	private String list(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = new ListCommand();
		command.execute(model);
		return "07Board/list";
	}

	@RequestMapping("/board/write.do")
	private String write(Model model) {

		return "07Board/write";
	}

	@RequestMapping(value = "/board/writeAction.do", method = RequestMethod.POST)
	private String writeAction(Model model, HttpServletRequest req, SpringBbsDTO springBbsDTO) {

		model.addAttribute("req", req);
		model.addAttribute("springBbsDTO", springBbsDTO);
		command = new WriteActionCommand();
		command.execute(model);
		return "redirect:list.do?nowPage=1";
	}

	@RequestMapping("/board/view.do")
	private String view(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = new ViewCommand();
		command.execute(model);
		return "07Board/view";
	}

	@RequestMapping("/board/password.do")
	private String password(Model model, HttpServletRequest req) {

		model.addAttribute("idx", req.getParameter("idx"));

		return "07Board/password";
	}

	@RequestMapping("/board/passwordAction.do")
	private String passwordAction(Model model, HttpServletRequest req) {

		String modePage = null;

		String mode = req.getParameter("mode");
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		String pass = req.getParameter("pass");

		JDBCTemplateDAO dao = new JDBCTemplateDAO();

		int rowExist = dao.password(idx, pass);

		if (rowExist <= 0) {
			model.addAttribute("isCorrMsg", "패스워드 일치하지 않음");
			model.addAttribute("idx", idx);

			modePage = "07Board/password";
		} else {
			System.out.println("검증완료");
			
			if(mode.equals("edit")) {
				model.addAttribute("req", req);
				command = new EditCommand();
				command.execute(model);
				modePage= "07Board/edit";
			}
			
			return modePage;
		}

		return "07Board/password";
	}
	
	
}
