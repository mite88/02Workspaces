package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;


@WebServlet("/deleteFile.do")
public class DelFileController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//첨부파일 삭제
		FileUtil.deleteFile(req, "/Uploads", req.getParameter("delfile"));
		
		System.out.println("파일삭제");
		req.setAttribute("result", 1);
		
	}

}
