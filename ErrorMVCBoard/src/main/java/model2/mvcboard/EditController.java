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
	
	//수정페이지로 진입
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	/*
    	파라미터로 전달된 idx값을 받은후 기존 게시물을 조회한다. 
    	조회된 결과를 수정페이지의 각 <input>태그에 value속성으로 삽입한다. 
    	<textarea>는 value속성이 없으므로 태그사이에 값을 삽입한다. 
    	 */
        String idx = req.getParameter("idx");
        MVCBoardDAO dao = new MVCBoardDAO();
        MVCBoardDTO dto = dao.selectView(idx);
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/14MVCBoard/Edit.jsp").forward(req, resp);
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
    	String saveDirectory = req.getServletContext().getRealPath("/Uploads");
        ServletContext application = this.getServletContext();
        int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
        MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
   
        String idx = mr.getParameter("idx");
        String prevOfile = mr.getParameter("prevOfile");
        String prevSfile = mr.getParameter("prevSfile");
        
        String name = mr.getParameter("name");
        String title = mr.getParameter("title");
        String content = mr.getParameter("content");
        
        HttpSession session = req.getSession();
        String pass = (String)session.getAttribute("pass");
        
        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setIdx(idx);
        dto.setName(name);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setPass(pass);
        
        String fileName = mr.getFilesystemName("ofile");
        if (fileName != null) {
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
            String ext = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = now + ext;
            File oldFile = new File(saveDirectory + File.separator + fileName);
            File newFile = new File(saveDirectory + File.separator + newFileName);
            oldFile.renameTo(newFile);
            dto.setOfile(fileName);  
            dto.setSfile(newFileName); 
            FileUtil.deleteFile(req, "/Uploads", prevSfile);
        }
        else {
            dto.setOfile(prevOfile);
            dto.setSfile(prevSfile);
        }
        
        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.updatePost(dto);
        dao.close();

        if (result == 1) {
            session.removeAttribute("pass");
            resp.sendRedirect("../mvcboard/view.do?idx=" + idx);
        }
        else {
            JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.",
                "../mvcboard/view.do?idx=" + idx);
        }
    }
}





