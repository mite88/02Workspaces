package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/addFile.do")
public class AddFileController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/x-json; charset=UTF-8");
	    PrintWriter out = resp.getWriter();
	
		System.out.println("!!");
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
			JSFunction.alertLocation(resp, "첨부파일 용량 초과", "../BoardSkin/write.do");
			return;
		}


		// mr 객체를 통해 서버에 저장된 파일명가져옴
		String idx = mr.getFilesystemName("idx");
		String fileName = mr.getFilesystemName("ofile");

		// 파일존재시 파일명 변경 처리
		if (fileName != null) {
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
			//dto.setOfile(fileName);
			//dto.setSfile(newFileName);
			
			
			 out.print(newFileName);
		}
		

	}

}
