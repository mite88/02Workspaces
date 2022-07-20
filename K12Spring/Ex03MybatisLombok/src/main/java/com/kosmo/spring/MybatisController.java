package com.kosmo.spring;

import java.lang.reflect.Parameter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common;
import mybatis.MemberVO;
import mybatis.MyBoardDTO;
import mybatis.MybatisDAOImpl;
import mybatis.MybatisMemberImpl;
import mybatis.ParameterDTO;
import oracle.net.aso.s;
import util.PagingUtil;

@Controller
public class MybatisController {

	// Mybatis를 사용하기 위해 자동으로 빈을 주입받는다.
	// servlet-context.xml에서 생성된다.
	@Autowired
	private SqlSession sqlSession;
//	public void setSqlSession(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//		System.out.println("Mybatis 사용준비 끝");
//	}

	// 방명록 리스트 Ver01 : 페이징 기능만 있고, 검색기능은 없음.
	@RequestMapping("/mybatis/list.do")
	public String list(Model model, HttpServletRequest req) {
		// 방명록 테이블의 게시물의 갯수 카운트
		/*
		 * 컨트롤러에서 Service객체인 interface에 정의된 추상메서드를 호출한다. 그러면 Mapper에 정의된 쿼리문이 실행되는 형식으로
		 * 동작한다. 동작방식] 컨트롤러에서 메서드 호출 => interface의 추상메서드 호출 => namespace에 해당 interface를
		 * namespace로 지정된 매퍼 선택 => 추상메서드와 동일한 이름의 id속성을 가진 엘리먼트 선택 => 쿼리문 실행 및 결과 반환
		 */
		int totalRecordCount = sqlSession.getMapper(MybatisDAOImpl.class).getTotalCount();

		// 게시판 페이지 처리를 위한 설정값(하드코딩으로 간단히 설정)
		// 한 페이지당 출력할 게시물의 갯수
		int pageSize = 4;
		// 한 블럭당 출력할 페이지번호의 갯수
		int blockPage = 2;
		// 전체 페이지 수 계산
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		/*
		 * 현재 페이지 번호 설정 방명록 URL?nowPage= : 이경우 페이지번호는 빈값(공백)으로 설정됨 방명록 URL?nowPage=99 :
		 * 값이 있으므로 99로 설정됨 방명록 URL : null로 설정됨
		 * 
		 */
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) ? 1
				: Integer.parseInt(req.getParameter("nowPage"));
		// 해당 페이지에 출력할 게시물의 구간을 계산한다.
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;

		/*
		 * 현재 페이지에 출력할 게시물을 가져온다. 이때 앞에서 계산한 start, end를 인수로 전달한다. 해당 인수는 Mapper에서
		 * #{param1}과 같이 사용한다.
		 */
		ArrayList<MyBoardDTO> lists = sqlSession.getMapper(MybatisDAOImpl.class).listPage(start, end);

		// 페이지번호(기존의 클래스를 그대로 사용한다)
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/mybatis/list.do?");
		model.addAttribute("pagingImg", pagingImg);

		// 내용에 대한 줄바꿈 처리(방명록은 내용보기가 별도로 없고, 목록에 내용이 출력된다.)
		for (MyBoardDTO dto : lists) {
			String temp = dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		// 출력할 내용을 model 객체에 저장후 view를 호출한다.
		model.addAttribute("lists", lists);
		return "07Mybatis/list";
	}
	
	// 방명록 리스트 Ver02 : 페이징 기능과 검색기능을 동시에 지원한다.(기존 Ver01을 업그레이드)
	@RequestMapping("/mybatis/listSearch.do")
	public String listSearch(Model model, HttpServletRequest req) {
		
		//Mapper로 전달할 파라미터 저장을 위해 DTO객체를 생성한다.
		ParameterDTO parmeterDTO = new ParameterDTO();
		//검색어가 있는 경우 파라미터를 받아온 후 DTO객체에 저장한다.
		parmeterDTO.setSearchField(req.getParameter("searchField"));
		parmeterDTO.setSearchTxt(req.getParameter("searchTxt"));
		
		//게시물 카운트(DTO 객체를 인수로 전달)
		int totalRecordCount = sqlSession.getMapper(MybatisDAOImpl.class).getTotalCountSearch(parmeterDTO);

		// 게시판 페이지 처리를 위한 설정값(하드코딩으로 간단히 설정)
		// 한 페이지당 출력할 게시물의 갯수
		int pageSize = 4;
		// 한 블럭당 출력할 페이지번호의 갯수
		int blockPage = 2;
		// 전체 페이지 수 계산
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		/*
		 * 현재 페이지 번호 설정 방명록 URL?nowPage= : 이경우 페이지번호는 빈값(공백)으로 설정됨 방명록 URL?nowPage=99 :
		 * 값이 있으므로 99로 설정됨 방명록 URL : null로 설정됨
		 * 
		 */
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) ? 1
				: Integer.parseInt(req.getParameter("nowPage"));
		// 해당 페이지에 출력할 게시물의 구간을 계산한다.
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		//게시물의 구간을 DTO에 저장
		parmeterDTO.setStart(start);
		parmeterDTO.setEnd(end);

	
		ArrayList<MyBoardDTO> lists = sqlSession.getMapper(MybatisDAOImpl.class).listPageSearch(parmeterDTO);

		// 페이지번호(기존의 클래스를 그대로 사용한다)
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/mybatis/list.do?");
		model.addAttribute("pagingImg", pagingImg);

		// 내용에 대한 줄바꿈 처리(방명록은 내용보기가 별도로 없고, 목록에 내용이 출력된다.)
		for (MyBoardDTO dto : lists) {
			String temp = dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		// 출력할 내용을 model 객체에 저장후 view를 호출한다.
		model.addAttribute("lists", lists);
		return "07Mybatis/list_search";
	}

	// 글쓰기 페이지 매핑
	@RequestMapping("/mybatis/write.do")
	public String wirte(Model model, HttpSession session, HttpServletRequest req) {
		/*
		 * 해당 메서드에서는 session내장객체를 사용하기 위해 매개변수로 선언한다. session 영역에 회원인증정보를 저장할 것이다.
		 */
		// 만약 세션영역에 siteUserInfo속성값이 없다면 로그아웃 상태이므로..
		if (session.getAttribute("siteUserInfo") == null) {
			/*
			 * 현재상태는 글쓰기를 위해 버튼을 클릭했으므로, 만약 로그인이 된다면 글쓰기 페이지로 이동하는 것이 좋다. 따라서 backUrl이라는
			 * 속성값에 쓰기페이지에 대한 View경로를 저장하여 리다이렉트 시킨다.
			 */
			model.addAttribute("backUrl", "07Mybatis/write");
			// 로그인 페이지로 이동한다.
			return "redirect:login.do";
			/*
			 * 위와 같이 Model객체에 속성을 저장한 후 redirect하면 객체에 저장된 값이 쿼리스트링 형태로 URL뒤에 추가된다. 즉,
			 * login.do?backUrl=속성값 과 같이 리다이렉트 된다.
			 */
		}
		// 로그인이 완료된 상태라면 쓰기페이지로 진입한다.
		return "07Mybatis/write";
	}


	// 로그인 페이지 매핑
	@RequestMapping("/mybatis/login.do")
	public String login(Model model) {
		return "07Mybatis/login";
	}

	// 로그인 처리 : session 객체 사용
	@RequestMapping("/mybatis/loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req, HttpSession session) {
		// 폼값으로 전송된 id, pass를 login()메서드로 전달하여 Mapper를 호출한다.
		MemberVO vo = sqlSession.getMapper(MybatisMemberImpl.class).login(req.getParameter("id"),
				req.getParameter("pass"));

		// Model객체에 저장과 View반환을 동시에 처리할 수 있는 객체 생성
		ModelAndView mv = new ModelAndView();
		if (vo == null) {
			// 회원정보가 불일치 하는 경우 로그인에 실패이므로 에러메세지를 저장한 후
			// 로그인 페이지를 다시 출력한다.
			mv.addObject("LoginNG", "아이디/패스워드가 틀렸습니다.");
			mv.setViewName("07Mybatis/login");
			return mv;
		} else {
			// 로그인에 성공한 경우 세션영역에 MemberVO객체를 저장한다.
			session.setAttribute("siteUserInfo", vo);
		}
		// 로그인 처리 후 backUrl이 있는 경우라면 해당 페이지로 이동시킨다.
		// 만약 값이 없다면 로그인 페이지로 이동시킨다.
		// backUrl은 글쓰기 페이지로 진입시 로그인 정보가 없는 경우 파라미터로 전달된 쓰기페이지의
		// View경로이다.
		String backUrl = req.getParameter("backUrl");
		if (backUrl == null || backUrl.equals("")) {
			mv.setViewName("07Mybatis/login");
		} else {
			mv.setViewName(backUrl);
		}
		return mv;
	}

	@RequestMapping(value="/mybatis/writeAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, HttpSession session)
	{
		/*
		글쓰기 페이지에 오랫동안 머물러 세션이 끊어지는 경우가 있으므로 글쓰기 처리에서도
		반드시 세션을 확인한 후 처리해야 한다.
		 */
		if(session.getAttribute("siteUserInfo")==null) {
			//만약 세션이 없다면 로그인 페이지로 리다이렉트한다.
			return "redirect:login.do";
		}
		
		//Mybatis 사용
		//전송된 파라미터를 이용해서 쓰기 처리를 위해 write()메서드를 호출한다.
		//이떄 아이디의 경우 세션영역에 저장되어 있으므로 형변환 후 getter를 통해 아이디를 가져온다.
		//정수형 반환값을 통해 입력 성공/실패 여부를 확인할 수 있다.
		int result = sqlSession.getMapper(MybatisDAOImpl.class).write(
				req.getParameter("name"),
				req.getParameter("contents"),
				((MemberVO)session.getAttribute("siteUserInfo")).getId()
				);
		System.out.println("입력결과"+result);
		return "redirect:list.do";
	}
	
	//수정페이지 진입하기(내용보기 + 수정폼)
	@RequestMapping("/mybatis/modify.do")
	public String modify(Model model, HttpServletRequest req, HttpSession session)
	{
		/*
		작성자 본인에게만 수정, 삭제 버튼이 노출되므로 수정 페이지 진입시에도 로그인을
		확인해야 한다. 여기서는 단순히 로그인 여부만 확인했지만, 필요하다면 작성자 본인이
		맞는지까지 확인하면 더욱 좋다.
		 */
		if(session.getAttribute("siteUserInfo")==null) {
			//로그인이 안된 상태라면 로그인페이지로 리다이렉트한다.
			return "redirect:login.do";
		}
		
		/*
		파라미터를 전달하는 4번째 방법으로 DTO(혹은 VO)객체에 파라미터를 저장한 후 
		Mapper로 전달한다. 폼값을 한번에 받을 수 있는 커맨드 객체와 비슷한 기능이다.
		 */
		//DTO객체 생성
		ParameterDTO prameterDTO = new ParameterDTO();
		//게시물의 일련번호 저장
		prameterDTO.setBoard_idx(req.getParameter("idx"));
		//사용자 아이디 저장
		prameterDTO.setUser_id(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		
		//Mapper의 view메서드를 호출한다. 이때 DTO 객체를 인수로 전달한다.
		MyBoardDTO dto = 
				sqlSession.getMapper(MybatisDAOImpl.class).view(prameterDTO);
		
		model.addAttribute("dto",dto);
		return "07Mybatis/modify";
	}
	
	@RequestMapping("/mybatis/modifyAction.do")
	public String modifyAction(HttpSession session, MyBoardDTO myBoardDTO)
	//수정 페이지에서 전송된 폼값은 커맨드 객체인 MyBoardDTO를 통해 한꺼번에 받는다.
	{
		//수정처리 전 로그인 체크
		if(session.getAttribute("siteUserInfo")==null)
		{
			//model.addAttribute("backUrl","07Mybatis/modify");
			return "redirect:login.do";
		}
		
		//수정처리를 위한 메서드 호출
		int applyRow = sqlSession.getMapper(MybatisDAOImpl.class).modify(myBoardDTO);
		System.out.println("수정처리된 레코드수 :" + applyRow);
		
		//방명록 게시판은 상세보기 페이지가 없으므로 수정 완료시 리스트로 이동한다.
		return "redirect:list.do";
	}
	
	@RequestMapping("/mybatis/delete.do")
	public String delete(HttpServletRequest req, HttpSession session)
	{
		//로그인확인
		if(session.getAttribute("siteUserInfo")==null)
		{
			return "redirect:login.do";
		}
		
		//Mybatis 사용
		//Mapper 호출
		int applyRow =sqlSession.getMapper(MybatisDAOImpl.class).delete(
				req.getParameter("idx"),
				((MemberVO)session.getAttribute("siteUserInfo")).getId());
		System.out.println("삭제된행의갯수:"+applyRow);
		
		return "redirect:list.do";
		
	}
}
