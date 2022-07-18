package springboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
 
/*
기본패키지로 설정한 곳에 컨트롤러를 선언하면 요청이 들어왔을때 
Auto scan된다. 이를 통해 요청을 전달할 메서드를 찾는다. 해당 설정은
servlet-context.xml에서 추가한다.  
 */
@Controller
public class BbsController {
	  	
	//모든 Command객체의 부모타입의 참조변수 생성
	BbsCommandImpl command = null;	
	
	@Autowired
	JDBCTemplateDAO dao;
	/*
	기존 버전에서는 서비스객체 생성시 new를 사용했으나, 
	Auto버전에서는 모든 new를 제거하고 Autowired로 자동주입 받아 사용한다.
	 */
	@Autowired
	ListCommand listCommand;
	@Autowired
	WriteActionCommand writeActionCommand;
	@Autowired
	ViewCommand viewCommand;
	@Autowired
	EditCommand editCommand;
	@Autowired
	DeleteActionCommand deleteActionCommand;
	@Autowired
	EditActionCommand editActionCommand;
	@Autowired
	ReplyCommand replyCommand;
	@Autowired
	ReplyActionCommand replyActionCommand;
	 
	@RequestMapping("/board/list.do")
	public String list(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = listCommand;
		command.execute(model);
		return "bootSkin/listT";
	}

	//글쓰기 페이지로 진입하기 위한 매핑처리	
	@RequestMapping("/board/write.do")
	public String write(Model model) {
		return "bootSkin/writeT";
	}
	//전송방식이 post  이므로 value, method까지 같이 기술해서 매핑한다.
	@RequestMapping(value="/board/writeAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, 
			SpringBbsDTO springBbsDTO) {
		model.addAttribute("req", req);
		model.addAttribute("springBbsDTO", springBbsDTO);
		command = writeActionCommand;
		command.execute(model);
		return "redirect:list.do?nowPage=1";
	}
	//글 내용보기
	@RequestMapping("/board/view.do")
	public String view(Model model, HttpServletRequest req)
	{
		//사용자의 요청을 저장한 request객체를 Model객체에 저장한 후 전달한다. 
		model.addAttribute("req", req);
		command = viewCommand;
		command.execute(model);

		return "bootSkin/viewT";
	}
	//패스워드 검증 페이지 매핑	
	@RequestMapping("/board/password.do")
	public String password(Model model,	HttpServletRequest req)
	{
		//일련번호는 request를 통해 전달받은후 Model에 저장
		model.addAttribute("idx", req.getParameter("idx"));		
		return "bootSkin/passwordT";
	}
	//패스워드 검증 후 수정 혹은 삭제 처리
	@RequestMapping("/board/passwordAction.do")
	public String passwordAction(Model model, HttpServletRequest req)
	{
		//파라미터가 많은 경우 별도의 VO(DTO)를 생성하여 한번에 받는게 좋음.
		String modePage = null;
		String mode = req.getParameter("mode");
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		String pass = req.getParameter("pass");
		
		//DAO에서 일련번호와 패스워드를 통해 검증
		//JDBCTemplateDAO dao = new JDBCTemplateDAO();		
		int rowExist = dao.password(idx, pass);
		
		if(rowExist<=0) {
			//패스워드 검증에 실패한 경우 이전페이지인 패스워드검증 페이지로 돌아간다. 
			//Model객체에 에러메세지를 저장한 후 view로 전달한다. 
			model.addAttribute("isCorrMsg", "패스워드가 일치하지 않습니다");
			//idx는 컨트롤러에서 받아 model에 저장한 후 View에서 EL로 출력한다. 
			//따라서 검증에 실패한 경우 idx는 별도로 model에 저장한후 View를 호출해야한다.
			model.addAttribute("idx", idx);
			modePage = "bootSkin/passwordT";
		}
		else {
			//검증에 성공한 경우 수정 혹은 삭제 처리를 한다. 
			System.out.println("검증완료");	
			
			if(mode.equals("edit")){
				//수정을 선택한 경우라면 수정페이지로 진입해야한다. 
				//모든 요청을 model에 저장한 후 View를 반환한다. 
				model.addAttribute("req", req);
				command = editCommand;
				command.execute(model);
				modePage = "bootSkin/editT";
			}
			else if(mode.equals("delete")){
				//삭제를 선택한 경우라면 별도의 이동없이 즉시 삭제하면 된다. 
				model.addAttribute("req", req);
				command = deleteActionCommand;
				command.execute(model);
				//삭제를 완료하면 리스트로 이동한다. 
				model.addAttribute("nowPage", req.getParameter("nowPage"));
				modePage = "redirect:list.do";			
			}			
		} 

		return modePage;
	}	
	
	//수정 처리
	@RequestMapping("/board/editAction.do")
	public String editAction(HttpServletRequest req, Model model, 
			SpringBbsDTO springBbsDTO){
		/*
		request내장객체와 전송된 폼값을 한꺼번에 받을수 있는 커맨드객체인 DTO클래스를
		매개변수로 선언하고, 전달을 위해 model객체에 저장한다. 
		 */
		model.addAttribute("req", req);
		model.addAttribute("springBbsDTO", springBbsDTO);
		command = editActionCommand;
		command.execute(model);
		
		/*
		수정이 완료되면 상세보기 화면으로 이동한다. 이때 게시물의 일련번호가 
		파라미터로 필요한데, model객체에 저장한 후 redirect 하면
		"view.do?idx=xxx&nowPage=xxx"와 같이 URL이 생성된다. 
		 */
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:view.do";
	}
	
	//답변글 작성폼
	@RequestMapping("/board/reply.do")
	public String reply(HttpServletRequest req, Model model){

		model.addAttribute("req", req);
		command = replyCommand;
		command.execute(model);

		model.addAttribute("idx", req.getParameter("idx"));
		return "bootSkin/replyT";
	}
	
	//답변글 쓰기 처리
	@RequestMapping("/board/replyAction.do")
	public String replyAction(HttpServletRequest req, Model model, 
			SpringBbsDTO springBbsDTO){
		
		model.addAttribute("springBbsDTO", springBbsDTO);
		model.addAttribute("req", req);
		command = replyActionCommand;
		command.execute(model);

		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:list.do";
	} 
	
}
