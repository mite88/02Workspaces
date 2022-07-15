package springboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import springboard.command.BbsCommandImpl;
import springboard.command.DeleteActionCommand;
import springboard.command.EditActionCommand;
import springboard.command.EditCommand;
import springboard.command.ListCommand;
import springboard.command.ReplyActionCommand;
import springboard.command.ReplyCommand;
import springboard.command.ViewCommand;
import springboard.command.WriteActionCommand;
import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

@Controller
public class BbsController {
	
	@Autowired
	JdbcTemplate template;
	
	@Autowired
	BbsCommandImpl command=null;
	
	@Autowired
	ListCommand listCommand;
	
	@Autowired
	WriteActionCommand writeActionCommand;
	
	@Autowired
	ViewCommand viewCommand;
	
	@Autowired
	EditCommand editCommand;
	
	@Autowired
	EditActionCommand editActionCommand;
	
	@Autowired
	DeleteActionCommand deleteActionCommand;
	
	@Autowired
	ReplyCommand replyCommand;
	
	@Autowired
	ReplyActionCommand replyActionCommand;
	 
	
	@Autowired
	JDBCTemplateDAO dao ;


	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired -> JDBCTemplate 연결성공");
	}

	@RequestMapping("/board/list.do")
	private String list(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = listCommand;
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

		command = writeActionCommand;
		command.execute(model);
		return "redirect:list.do?nowPage=1";
	}

	@RequestMapping("/board/view.do")
	private String view(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);

		command = viewCommand;
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

		
		int rowExist = dao.password(idx, pass);

		if (rowExist <= 0) {
			model.addAttribute("isCorrMsg", "패스워드 일치하지 않음");
			model.addAttribute("idx", idx);

			modePage = "07Board/password";
		} else {
			System.out.println("검증완료");
			
			if(mode.equals("edit")) {
				model.addAttribute("req", req);

				command = editCommand;
				command.execute(model);
				modePage= "07Board/edit";
			}else if(mode.equals("delete")) {
				model.addAttribute("req", req);

				command = deleteActionCommand;
				command.execute(model);
				
				model.addAttribute("nowPage", req.getParameter("nowPage"));
				modePage= "redirect:list.do";
			}
			
			return modePage;
		}

		return "07Board/password";
	}
	
	
	@RequestMapping(value = "/board/editAction.do")
	private String editAction(Model model, HttpServletRequest req, SpringBbsDTO springBbsDTO) {

		model.addAttribute("req", req);
		model.addAttribute("springBbsDTO", springBbsDTO);
		command = editActionCommand;
		command.execute(model);
		
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:view.do";
	}
	
	@RequestMapping(value = "/board/reply.do")
	private String reply(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);

		command = replyCommand;
		command.execute(model);
		
		model.addAttribute("idx", req.getParameter("idx"));

		return "07Board/reply";
	}
	
	@RequestMapping(value = "/board/replyAction.do")
	private String replyAction(Model model, HttpServletRequest req, SpringBbsDTO springBbsDTO) {

		model.addAttribute("req", req);
		model.addAttribute("springBbsDTO", springBbsDTO);
		
		command = replyActionCommand;
		command.execute(model);
		
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:list.do";
	}
	
}
