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

import com.office.OfficeDAO;
import com.office.OfficeDTO;
import com.oreilly.servlet.MultipartRequest;

import common.MailSend;
import fileupload.FileUtil;
import utils.BoardPage;
import utils.JSFunction;

@WebServlet("/admin.do/office/*")
public class OfficeController extends HttpServlet {
	
	 OfficeDTO dto = new OfficeDTO();
	 OfficeDAO dao = new OfficeDAO();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI(); // URI값
		String path = req.getContextPath(); // 컨텍스트 경로

		String command = uri.substring(path.length()); // 요청 분기
		String page_name="";//페이지 이동위치
		String title_name="";//페이지 제목
		
		int num=0; //사무실번호
		
		int result=0;
		
		//포워딩에 사용하기 위한 변수
		RequestDispatcher dispatcher = null;
		String method = req.getMethod();

		System.out.println(command);

		if (command.contains("/admin.do/office/list") && method.equals("GET")) {
	
			page_name="/admin/office/list.jsp";
			title_name ="사무실리스트";

			Office_List(req, resp, num, path);
		}else if (command.contains("/admin.do/office/view/") && method.equals("GET")) {

			page_name="/admin/Office/view.jsp";
			title_name ="사무실보기";
			
			Office_View(req, resp, num);
		}else if (command.contains("/admin.do/office/write") && method.equals("GET")) {

			page_name="/admin/office/write.jsp";
			title_name ="사무실쓰기";
			
			
		}else if (command.contains("/admin.do/office/write") && method.equals("POST")) {
		
			//서버의 물리적 경로 얻어오기. req.getServletContext()을 통해 application
	    	//내장객체를 얻어온다. 
	        String saveDirectory = req.getServletContext().getRealPath("/Uploads/office");
	        
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
	                                     "../admin.do/office/write");  
	            return;
	        }
	        //여기까지의 코드로 파일업로드는 완료된다. 
	        
	        //int code = req.getParameter("code");
			String o_name= mr.getParameter("o_name");
			String o_bnumber= mr.getParameter("o_bnumber");
			String o_addr= mr.getParameter("o_addr");
			String o_phone= mr.getParameter("o_phone");
			String o_fax= mr.getParameter("o_fax");
			String o_manage_name= mr.getParameter("o_manage_name");
			String o_manage_phone= mr.getParameter("o_manage_phone");
			String o_email= mr.getParameter("o_email");
			String o_banknumber= mr.getParameter("o_banknumber");
			String o_bankname= mr.getParameter("o_bankname");

			String o_content= mr.getParameter("o_content");
			String o_pay= mr.getParameter("o_pay");
			String o_service= mr.getParameter("o_service");
			String o_type= mr.getParameter("o_type");
	        
	        //파일을 제외한 나머지 폼값을 받는다. request객체가 아닌 mr을 통해 받는다. 
	        //DTO에 폼값을 저장한다. 
	        dto = new OfficeDTO(); 
	       
	        dto.setO_name(o_name);
			dto.setO_bnumber(o_bnumber);
			dto.setO_addr(o_addr);
			dto.setO_phone(o_phone);
			dto.setO_fax(o_fax);
			dto.setO_manage_name(o_manage_name);
			dto.setO_manage_phone(o_manage_phone);
			dto.setO_email(o_email);
			dto.setO_bankname(o_bankname);
			dto.setO_banknumber(o_banknumber);
			dto.setO_content(o_content);
			dto.setO_pay(o_pay);
			dto.setO_service(o_service);
			dto.setO_type(o_type);


	        String fileName1 = mr.getFilesystemName("o_img1");
	        String fileName2 = mr.getFilesystemName("o_img2");
	   
	        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	          
            String ext = fileName1.substring(fileName1.lastIndexOf("."));
            
            //파일2개임
            String newFileName1 = now+"_1" + ext;
            String newFileName2 = now+"_2" + ext;
            
          
        	if (fileName1 != null) {

	            File oldFile1 = new File(saveDirectory + File.separator + fileName1);
	            File newFile1 = new File(saveDirectory + File.separator + newFileName1);
	          
	            oldFile1.renameTo(newFile1);
	            
	            dto.setO_img1(newFileName1);  

	        }
        	
        	if (fileName2 != null) {
	        	
	            File oldFile2 = new File(saveDirectory + File.separator + fileName2);
	            File newFile2 = new File(saveDirectory + File.separator + newFileName2);
	            
	            oldFile2.renameTo(newFile2);

	            dto.setO_img2(newFileName2);  
	        }
	        
	        //새로운 게시물을 테이블에 저장한다. 
	        dao = new OfficeDAO();
	        result = dao.officeInsert(dto);
	        //커넥션풀 자원 반납
	        dao.close();
	       
			
		}else if (command.contains("/admin.do/office/modify")) {
			
			//서버의 물리적 경로 얻어오기. req.getServletContext()을 통해 application
	    	//내장객체를 얻어온다. 
	        String saveDirectory = req.getServletContext().getRealPath("/Uploads/office");
	        
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
	                                     "../admin.do/office/write");  
	            return;
	        }
	        //여기까지의 코드로 파일업로드는 완료된다. 
	        
	        String code = mr.getParameter("code2");
			String o_name= mr.getParameter("o_name");
			String o_bnumber= mr.getParameter("o_bnumber");
			String o_addr= mr.getParameter("o_addr");
			String o_phone= mr.getParameter("o_phone");
			String o_fax= mr.getParameter("o_fax");
			String o_manage_name= mr.getParameter("o_manage_name");
			String o_manage_phone= mr.getParameter("o_manage_phone");
			String o_email = mr.getParameter("o_email1")+"@"+mr.getParameter("o_email2");
			String o_banknumber= mr.getParameter("o_banknumber");
			String o_bankname= mr.getParameter("o_bankname");
			
			String o_content= mr.getParameter("o_content");
			String o_pay= mr.getParameter("o_pay");
			String o_service= mr.getParameter("o_service");
			String o_type= mr.getParameter("o_type");
			
			String prevfile1 = mr.getParameter("prevfile1");
		    String prevfile2 = mr.getParameter("prevfile2");
		        
			
			String deleteFile1 = mr.getParameter("deleteFile1"); //체크박스처리시..
			String deleteFile2 = mr.getParameter("deleteFile2"); //체크박스처리시..
			
	        
	        
	        //파일을 제외한 나머지 폼값을 받는다. request객체가 아닌 mr을 통해 받는다. 
	        //DTO에 폼값을 저장한다. 
	        dto = new OfficeDTO(); 
	        
	        System.out.println(code);
	       
	        dto.setCode(Integer.parseInt(code));
	        dto.setO_name(o_name);
			dto.setO_bnumber(o_bnumber);
			dto.setO_addr(o_addr);
			dto.setO_phone(o_phone);
			dto.setO_fax(o_fax);
			dto.setO_manage_name(o_manage_name);
			dto.setO_manage_phone(o_manage_phone);
			dto.setO_email(o_email);
			dto.setO_bankname(o_bankname);
			dto.setO_banknumber(o_banknumber);
			dto.setO_content(o_content);
			dto.setO_pay(o_pay);
			dto.setO_service(o_service);
			dto.setO_type(o_type);


	        String fileName1 = mr.getFilesystemName("o_img1");
	        String fileName2 = mr.getFilesystemName("o_img2");
	   
	         
	        //파일삭제 처리 : 체크박스 체크시
	        if(deleteFile1 != null && deleteFile2 != null) {
	        	System.out.println("!!!");
	        	dto.setO_img1(fileName1);  
	            dto.setO_img2(fileName2);  
	            FileUtil.deleteFile(req, "/Uploads/Office", prevfile1);
	            FileUtil.deleteFile(req, "/Uploads/Office", prevfile2);
	        }else {
	        	
	        	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
           
	        	if (fileName1 != null) {
	        	     
		            String ext1 = fileName1.substring(fileName1.lastIndexOf("."));

		            //파일2개임
		            String newFileName1 = now+"_1" + ext1;
		            

		            File oldFile1 = new File(saveDirectory + File.separator + fileName1);
		            File newFile1 = new File(saveDirectory + File.separator + newFileName1);
		          
		            oldFile1.renameTo(newFile1);
		            
		            dto.setO_img1(newFileName1);  
 
		        }else {
	            	dto.setO_img1(prevfile1);  
	            }
	        	
	        	if (fileName2 != null) {
		        	
	        		String ext2 = fileName2.substring(fileName2.lastIndexOf("."));
	        		String newFileName2 = now+"_2" + ext2;
	        		 
		            File oldFile2 = new File(saveDirectory + File.separator + fileName2);
		            File newFile2 = new File(saveDirectory + File.separator + newFileName2);
		            
		            oldFile2.renameTo(newFile2);
 
		            dto.setO_img2(newFileName2);  
		        }else {
		        	dto.setO_img2(prevfile2);  
	            }

	            
	        }
	        
	        System.out.println("file"+dto.getO_img1());
	     
	        dao = new OfficeDAO();
	        result = dao.officeUpdate(dto);
	        dao.close();
	     
		
		}else if (command.contains("/admin.do/office/delete")) {
			String code = req.getParameter("code");
            dao = new OfficeDAO();

            
            dto = dao.selectView(Integer.decode(code));
 
            result = dao.officeDelete(dto);
           
            dao.close();
           
            if (result == 1) {
            	//앞에서 얻어온 DTO에서 파일명을 확인한다. 
                String saveFileName1 = dto.getO_img1();
                String saveFileName2 = dto.getO_img2();
                //첨부된 파일을 삭제한다. 
                FileUtil.deleteFile(req, "/Uploads/Office", saveFileName1);
                FileUtil.deleteFile(req, "/Uploads/Office", saveFileName2);
            }

		}else {
			JSFunction.alertBack(resp, "페이지 오류");
		}
		
		if(page_name!="") {
			
			req.setAttribute("title_name", title_name);
			
			dispatcher = req.getRequestDispatcher(page_name);
			dispatcher.forward(req, resp);
		}else if( result > 0) {
			resp.sendRedirect("../office/list/");
		}else {
			JSFunction.alertLocation(resp, "완료",
					"../office/list/");
			//JSFunction.alertBack(resp, "페이지 오류");
		}
		

	}


	//사무실 리스트
	private void Office_List(HttpServletRequest req, HttpServletResponse resp, int num, String path) {
		dao = new OfficeDAO();
			
		//파라미터 및 View로 전달할 데이터를 저장하기 위해 Map컬렉션을 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검섹어 관련 파라미터 처리
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
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
		List<OfficeDTO> officeLists = dao.selectListPage(map);
		
		System.out.println(officeLists);
		//커넥션풀에 자원 반납
		dao.close();
		
		//페이지 번호 생성을 위한 유틸리티 클래스 호출
		String pagingImg = BoardPage.pageingStr(totalCount, pageSize, blockPage, pageNum,  
				path+"/admin.do/office/list/", searchField, searchWord);
		
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
		req.setAttribute("officeLists", officeLists);
		req.setAttribute("map", map);
		
	}
	
	
	//사무실보기(사용자용)
	private void Office_View(HttpServletRequest req, HttpServletResponse resp, int num) {
		//커넥션풀을 통해 DB연결
		dao = new OfficeDAO();
		//일련번호를 파라미터로 받음
		int code = Integer.parseInt(req.getParameter("code"));

		//게시물 조회
		dto = dao.selectView(code);
		dao.close();
		
		//내용에 대해 줄바꿈 처리를 위해 <br>태그로 변환한다.
		//<textarea>에서 엔터키를 통한 줄바꿈은 \r\n으로 저장된다.
		dto.setO_content(dto.getO_content().replaceAll("\r\n", "<br>"));
		dto.setO_pay(dto.getO_pay().replaceAll("\r\n", "<br>"));
		dto.setO_service(dto.getO_service().replaceAll("\r\n", "<br>"));
		
		//request영역에 DTO를 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
	}

	

}
