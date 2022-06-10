package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

//어노테이션을 통한 요청명매핑
@WebServlet("/BoardSkin/pass.do")
public class PassController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		/BoardSkin/pass.do?mode=delete&idx=323
		
		요청명을 이와 같아 파라미터를 받아오는 작업을 해야하는데
		방법1. request내장객체이용: req.getParameter(파라미터명)
		방법2. View에서 EL 및 param내장객체 이용 : ${param.파라미터명}
		*/
		req.setAttribute("mode", req.getParameter("mode"));
		
		//파라미터를 request영역에 저장후 포워드
		req.getRequestDispatcher("/BoardSkin/Pass.jsp").forward(req, resp);
	}
	
	//폼값을 받아 수정 및 삭제 페이지 이동에 따른 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//폼값 받기
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//커넥션풀을 통해 DB연결 및 패스워드 검증
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed= dao.confirmPassword(pass, idx);
		dao.close(); //반납
		
		//검증성공시...
		if(confirmed) {
			
			if(mode.equals("edit")) {
				//수정
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("../BoardSkin/edit.do?idx="+idx);
			}else if(mode.equals("delete")){
				//삭제
				
				//DB 연결
				dao= new MVCBoardDAO();
				//기존게시판 얻기
				MVCBoardDTO dto = dao.selectView(idx);
				//게시판삭제
				int result = dao.deletePost(idx);
				dao.close(); //반납
				
				//삭제완료시...
				if(result == 1) {
					//첨부파일 삭제
					String saveFileName = dto.getSfile();
					FileUtil.deleteFile(req, "/Uploads", saveFileName);
				}
				JSFunction.alertLocation(resp, "삭제완료", "../BoardSkin/list.do");
			}
			
		}else {
			//검증실패시...
			JSFunction.alertBack(resp, "비밀번호검증 실패");
			
		}
	}
}
