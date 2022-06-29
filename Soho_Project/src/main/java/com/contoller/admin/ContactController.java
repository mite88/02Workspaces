package com.contoller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.contact.ContactDAO;
import com.contact.ContactDTO;
import com.oreilly.servlet.MultipartRequest;

import common.MailSend;
import fileupload.FileUtil;
import utils.BoardPage;
import utils.JSFunction;

@WebServlet("/admin.do/contact/*")
public class ContactController extends HttpServlet {
	
	 ContactDTO dto = new ContactDTO();
	 ContactDAO dao = new ContactDAO();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI(); // URI값
		String path = req.getContextPath(); // 컨텍스트 경로

		String command = uri.substring(path.length()); // 요청 분기
		String page_name="";//페이지 이동위치
		String title_name="";//페이지 제목
		
		int num=0; //게시판번호
		
		int result=0;
		
		//포워딩에 사용하기 위한 변수
		RequestDispatcher dispatcher = null;
		String method = req.getMethod();

		System.out.println(command);

		if (command.contains("/admin.do/contact/list") && method.equals("GET")) {
	
			page_name="/admin/contact/list.jsp";
			title_name ="게시판리스트";

			Contact_List(req, resp, num, path);
		}else if (command.contains("/admin.do/contact/view/") && method.equals("GET")) {

			page_name="/admin/contact/view.jsp";
			title_name ="게시판보기";
			
			Contact_View(req, resp, num);
		}else if (command.contains("/admin.do/contact/write") && method.equals("GET")) {

			page_name="/admin/contact/write.jsp";
			title_name ="게시판쓰기";
			
			
		}else if (command.contains("/admin.do/contact/write") && method.equals("POST")) {
		
			//서버의 물리적 경로 얻어오기. req.getServletContext()을 통해 application
	    	//내장객체를 얻어온다. 
	        String saveDirectory = req.getServletContext().getRealPath("/Uploads/contact");
	        
	        //application내장객체를 통해 web.xml에 등록된 초기화 파라미터를 얻어온다.
	        ServletContext application = getServletContext();
	        //업로드 제한용량을 얻어온다.
	        int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
	        //파일업로드 처리
	        MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
	        //업로드에 실패한 경우에는 경고창을 띄우고 쓰기 페이지로 이동한다.
	        //만약 글 작성시 파일을 첨부하지 않더라도, 객체는 생성된다. 만약 객체각
	        //생성되지 않는다면 나머지 폼값을 받을 수 없기 때문이다. 
	        if (mr == null) {
	            JSFunction.alertLocation(resp, "첨부 파일이 제한 용량을 초과합니다.",
	                                     "../admin.do/contact/write");  
	            return;
	        }
	        //여기까지의 코드로 파일업로드는 완료된다. 
	        
	        
	        //파일을 제외한 나머지 폼값을 받는다. request객체가 아닌 mr을 통해 받는다. 
	        //DTO에 폼값을 저장한다. 
	        dto = new ContactDTO(); 
	        dto.setName(mr.getParameter("name"));
	        dto.setTitle(mr.getParameter("title"));
	        dto.setVideo_url(mr.getParameter("video_url"));
	        dto.setContent(mr.getParameter("content"));
	        dto.setPass(mr.getParameter("pass"));
	        dto.setType(Integer.parseInt(mr.getParameter("type")));

	        //서버에 업로드 된 파일명을 얻어온다. 
	        String fileName = mr.getFilesystemName("ofile");
	        //서버에 저장된 파일이 있는 경우 파일명 변경 처리를 한다. 
	        //만약 파일을 첨부하지 않았다면 아래 처리는 하지 않아도 된다. 
	        if (fileName != null) {
	        	//날짜와 시간을 이용해서 파일명을 생성
	            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	            //파일명의 마지막에 있는 .(닷)의 인덱스를 찾은후 확장자를 잘라냄
	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            //파일명과 확장자를 연결해서 새로운 파일명 생성
	            String newFileName = now + ext;
	            //파일객체 생성후 파일명을 변경함
	            File oldFile = new File(saveDirectory + File.separator + fileName);
	            File newFile = new File(saveDirectory + File.separator + newFileName);
	            oldFile.renameTo(newFile);
	            
	            //DTO객체에 원본파일명과 저장된파일명을 저장한다. 
	            dto.setOfile(fileName);  
	            dto.setSfile(newFileName);  
	        }
	        
	        //새로운 게시물을 테이블에 저장한다. 
	        dao = new ContactDAO();
	        result = dao.insertWrite(dto);
	        //커넥션풀 자원 반납
	        dao.close();
	       
			
		}else if (command.contains("/admin.do/contact/edit") && method.equals("GET")) {

			page_name="/admin/contact/edit.jsp";
			title_name ="게시판수정";
			
			System.out.println("idx"+req.getParameter("idx"));
			String idx = req.getParameter("idx");
			dao = new ContactDAO();
			dto = dao.selectView(Integer.parseInt(idx));
		    req.setAttribute("dto", dto);
			
			
		}else if (command.contains("/admin.do/contact/edit") && method.equals("POST")) {
			
			//파일업로드 처리 : 물리적경로, 제한 용량, MR객체생성
	    	String saveDirectory = req.getServletContext().getRealPath("/Uploads/contact");
	        ServletContext application = this.getServletContext();
	        int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
	        MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
	   
	        //폼값전송
	        String idx = req.getParameter("idx");
	        String prevOfile = mr.getParameter("prevOfile");
	        String prevSfile = mr.getParameter("prevSfile");
	        String video_url = mr.getParameter("video_url");
	        
	        String name = mr.getParameter("name");
	        String deleteFile = mr.getParameter("deleteFile"); //체크박스처리시..
	        
	        String title = mr.getParameter("title");
	        String content = mr.getParameter("content");
	        
	        HttpSession session = req.getSession();
	        String pass = (String)session.getAttribute("pass");
	        
	        dto = new ContactDTO();
	        dto.setIdx(Integer.decode(idx));
	        dto.setName(name);
	        dto.setTitle(title);
	        dto.setContent(content);
	        dto.setVideo_url(video_url);
	        dto.setType(Integer.parseInt(mr.getParameter("type")));
	         
	        // System.out.println("deleteFile:"+(deleteFile.equals("1")));
	         
	        //파일삭제 처리 : 체크박스 체크시
	        if(deleteFile != null) {
	        	System.out.println("!!!");
	        	 dto.setOfile("");
	             dto.setSfile("");
	             FileUtil.deleteFile(req, "/Uploads/contact", prevSfile);
	        }else {
	        	//System.out.println("!````");
	        	   String fileName = mr.getFilesystemName("ofile");
	        	   
	        	if (fileName != null) {
	        		System.out.println("1`");
	                String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	                String ext = fileName.substring(fileName.lastIndexOf("."));
	                String newFileName = now + ext;
	                File oldFile = new File(saveDirectory + File.separator + fileName);
	                File newFile = new File(saveDirectory + File.separator + newFileName);
	                oldFile.renameTo(newFile);
	                dto.setOfile(fileName);  
	                dto.setSfile(newFileName); 
	                FileUtil.deleteFile(req, "/Uploads/contact", prevSfile);
	                
	                System.out.println(dto.getSfile());
	            }
	            else {
	            	System.out.println("2`");
	                dto.setOfile(prevOfile);
	                dto.setSfile(prevSfile);
	                System.out.println(dto.getSfile());
	            }
	        }
	        
	        System.out.println(dto.getSfile());

	        dao = new ContactDAO();
	        result = dao.updatePost(dto);
	        dao.close();
	     
		
		}else if (command.contains("/admin.do/contact/delete") && method.equals("GET")) {
			String idx = req.getParameter("idx");
            dao = new ContactDAO();

            dto = dao.selectView(Integer.decode(idx));
 
            result = dao.deletePost(Integer.decode(idx));
           
            dao.close();
           
            if (result == 1) {
            	//앞에서 얻어온 DTO에서 파일명을 확인한다. 
                String saveFileName = dto.getSfile();
                //첨부된 파일을 삭제한다. 
                FileUtil.deleteFile(req, "/Uploads/contact", saveFileName);
            }

		}else if(command.contentEquals("/admin.do/contact/download")){
			//다운로드
			//파라미터 받아오기
			//원본파일명
			String ofile = req.getParameter("ofile");
			//서버에 저장된 파일명
			String sfile = req.getParameter("sfile");
			//게시물의 일련번호
			String idx = req.getParameter("idx");
			
			//파일 다운로드 처리
			FileUtil.download(req, resp, "/Uploads/contact", sfile, ofile);
			
			//파일 다운로드 수 증가
			dao = new ContactDAO();
			dao.downCountPlus(idx);
			dao.close();
			
			
		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		
		if(page_name!="") {
			
			req.setAttribute("title_name", title_name);
			
			dispatcher = req.getRequestDispatcher(page_name);
			dispatcher.forward(req, resp);
		}else if( result > 0) {
			resp.sendRedirect("http://localhost:8082/Soho_Project/admin.do/contact/list/?type=all");
		}else {
			JSFunction.alertLocation(resp, "완료",
					"http://localhost:8082/Soho_Project/admin.do/contact/list/?type=all");
			//JSFunction.alertBack(resp, "페이지 오류");
		}
		

	}


	//게시판 리스트
	private void Contact_List(HttpServletRequest req, HttpServletResponse resp, int num, String path) {
		dao = new ContactDAO();
			
		//파라미터 및 View로 전달할 데이터를 저장하기 위해 Map컬렉션을 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검섹어 관련 파라미터 처리
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		//type넣기
		System.out.println("!!!"+req.getParameter("type") );
		if(!req.getParameter("type").equals("all")) {
			map.put("type",  req.getParameter("type"));
		}
		
		
		if(searchWord != null) {
			//검색어를 입력한 경우에만 Model(데이터베이스)로 전달하기 위해 저장함
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//게시물의 갯수를 카운트 함. 검색어가 있는 경우 Map컬렉션을 통해 전달됨.
		int totalCount = dao.selectCount(map);
		
		/* 페이지 처리 start*/
		//서블릿에서 web.xml에 접근하기 위해 application내장객체를 얻어옴
		ServletContext application = getServletContext();
		//컨텍스트 초기화 파라미터를 얻어옴.
		//한페이지당 출력할 게시물의 갯수
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		//한 블럭당 출력할 페이지 번호 갯수
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		/*
		목록에 첫 진입시에는 무조건 1페이지로 가정한 후 게시물을 얻어옴.
		특정 페이지로 진입한 경우에는 파라미터를 받아서 구간을 계산하여 얻어옴.
		 */
		int pageNum = 1;
		//파라미터로 넘어오는 pageNum이 있다면 값을 얻어와서..
		String pageTemp = req.getParameter("pageNum");

		//정수로 변환한 후 현재 페이지번호로 지정한다.
		if(pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		//게시물의 구간을 계산함.
		/*
		MySQL의 경우 페이징을 위해 Limit를 사용한다.
		사용법 : limit 게시물의 시작인덱스, 출력할 게시물의 갯수
			따라서 start(시작위치)만 계산하면 된다.
			start => 
				1페이지일때 : (1-1) * 2 = 0
				2페이지일때 : (2-1) * 2 = 2
				3페이지일때 : (3-1) * 2 = 4 
		 */
		int start = (pageNum - 1) * pageSize;
		int end = pageSize;
		//계산된 값은 Model로 전달하기 위해 Map컬렉션에 저장함.
		map.put("start", start);
		map.put("end", end);
		/* 페이지 처리 end */

		//현재 페이지에 출력할 게시물을 얻어옴.
		List<ContactDTO> boardLists = dao.selectListPage(map);
		//커넥션풀에 자원 반납
		dao.close();
		
		//페이지 번호 생성을 위한 유틸리티 클래스 호출
		String pagingImg = BoardPage.pageingStr(totalCount, pageSize, blockPage, pageNum,  
				path+"/admin.do/contact/list/", req.getParameter("type"), searchField, searchWord);
		
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
				
		System.out.println("pagingImg:"+pagingImg);
		System.out.println("totalCount:"+totalCount);
		System.out.println("pageSize:"+pageSize);
		System.out.println("pageNum"+pageNum);
		System.out.println("pageTemp:"+pageTemp+"/searchField:"+searchField+"/searchWord:"+searchWord);
		//View로 전달할 객체들을 request영역에 저장한다.
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		
	}
	
	
	//게시판보기(사용자용)
	private void Contact_View(HttpServletRequest req, HttpServletResponse resp, int num) {
		//커넥션풀을 통해 DB연결
		dao = new ContactDAO();
		//일련번호를 파라미터로 받음
		String idx =req.getParameter("idx");
		System.out.println(idx);
		//조회수 증가
		//dao.updateVisitCount(Integer.parseInt(idx));
		//게시물 조회
		dto = dao.selectView(Integer.parseInt(idx));
		dao.close();
		
		//내용에 대해 줄바꿈 처리를 위해 <br>태그로 변환한다.
		//<textarea>에서 엔터키를 통한 줄바꿈은 \r\n으로 저장된다.
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		//request영역에 DTO를 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
	}

	

}
