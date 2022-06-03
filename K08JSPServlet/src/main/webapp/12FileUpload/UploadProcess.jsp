<%--
/**
 * 1. 프로젝트명 :  UploadProcess.jsp
 * 2. 작성일 : 2022. 6. 3. 오후 12:05:24
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!--  UploadProcess.jsp -->
<%@page import="fileupload.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일이 저장될 디렉토리의 물리적경로 얻음
String saveDirectory = application.getRealPath("/Uploads");
int maxPostSize = 1024 * 1000; //업로드 할 최대용량(파일이 2개일 경우 합친용량으로 설정해야함)
String encoding ="UTF-8"; //문자 인코딩

try{
	/*
	앞에서 준비한 인수를 매개변수로 전달하여 MultipartRequest객체를 생성
	객체가 정상적으로 생성되며 파일업로드가 됨
	예외시 보통 최대용량 혹은 물리적경로명이 잘못지정된 경우임
	*/
	MultipartRequest mr = 
			new MultipartRequest(request, saveDirectory, maxPostSize, encoding);

	//mr 객체를 통해 서버에 저장된 파일명가져옴
	String fileName = mr.getFilesystemName("attachedFile");
	//확장자찾기
	String ext = fileName.substring(fileName.lastIndexOf("."));
	//현재날짜와 시간 및 밀리세컨즈초까지해서 파일명으로 사용할 문자열만듬
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String newFileName = now + ext; //파일명 + 확장자
	
	//서버마다 
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	
	/*
	String now1 = new SimpleDateFormat("yyyyMMddHmsS").format(new Date()); //현재시간    
	int i = -1;
	i = fileName.lastIndexOf("."); // 파일 확장자 위치         
	String realFileName = seq+"_"+time+"_"+ fileName;//게시글번호+시간+파일이름
	File oldFile = new File(savePath + fileName);
	File newFile = new File(savePath + realFileName); 
	oldFile.renameTo(newFile); // 파일명 변경 
	*/

	//폼값받기
	
	/*
	enctype을 "multipart/form-data"로 선언하고 submit한 데이터들은 
	request객체가 아닌 MultipartRequest객체로 불러옴
	*/
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	//checkbox의 경우는 같은 name이 여러개이기때문에 배열로 받아야함
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	
	if(cateArray == null){
		cateBuf.append("선택 없음");
	}else{
		for(String s : cateArray){
			cateBuf.append(s+", ");
		}	
	}
	
	//이부분은 DTO및 DAO파일 작성 후 주석을 풀어주세여
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	
	MyfileDAO dao = new MyfileDAO();
	dao.insertFile(dto);
	dao.close();
	
	
	//파일 업로도 성공시 파일목록으로 이동
	response.sendRedirect("FileList.jsp"); 
}catch(Exception e){
	e.printStackTrace();
	//업로드 실패시 request 영역에 메세지 저장 후 메인으로 포워드
	request.setAttribute("errorMessage", "파일업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>