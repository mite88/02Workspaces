package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

//수정처리를 위한 매핑
@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {
	
	//수정페이지 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//idx받아서 게시물 조회
		String idx = req.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../14MVCBoard/Edit.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파일이 저장될 디렉토리의 물리적경로 얻음
		// req.getServletContext()로 application 내장객체 얻음
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");

		// application내장 객체를 통해 web.xml에 등록된 초기화 파라미터 얻기
		ServletContext application = getServletContext();
		// 업로드 할 최대용량
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));

		/*
		 * 파일업로드 진행
		 */
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);

		// 업로드 실패시 경고창 띄우고 쓰기페이지로 이동
		// 작성시 파일이 없더라도 객체는 생성
		if (mr == null) {
			JSFunction.alertBack(resp, "첨부파일 용량 초과 및 경로 확인");
			return;
		}

		// 파일업로드 완료
		
		//폼값 받기 - hidden속성
		String idx = mr.getParameter("idx");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		//폼값 받기 - 입력한것
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		//session영역의 pass값 가져오기 
		HttpSession session =req.getSession();
		String pass = (String)session.getAttribute("pass");

		// 파일 빼고 나머지폼값 받기
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		
		// mr 객체를 통해 서버에 저장된 파일명가져옴
		String fileName = mr.getFilesystemName("ofile");

		// 파일존재시 파일명 변경 처리
		if (fileName != null) {
			//파일수정시...
			
			// 현재날짜와 시간 및 밀리세컨즈초까지해서 파일명으로 사용할 문자열만듬
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			// 확장자찾기
			String ext = fileName.substring(fileName.lastIndexOf("."));

			String newFileName = now + ext; // 파일명 + 확장자

			// 파일객체 생성 후 파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);

			// DTO객체 원본 및 저장된 파일명 저장
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			//기존 파일 삭제
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}else {
			//파일수정 하지 않을 시...
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}

		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.updateEdit(dto);
		dao.close();

		if (result == 1) {
			//수정 완료시 session에 저장된 pass지우고 상세보기 화면이동
			session.removeAttribute("pass");
			resp.sendRedirect("../mvcboard/view.do?idx="+idx);
		} else {
			JSFunction.alertLocation(resp, "비번검증 다시진행해주세요", "../mvcboard/view.do?idx="+idx);
		}
	}
}
