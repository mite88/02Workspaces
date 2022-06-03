<%--
/**
 * 1. 프로젝트명 : SimpieProcess.jsp
 * 2. 작성일 : 2022. 6. 3. 오후 12:50:08
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- SimpieProcess.jsp -->
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="fileupload.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Uploads");
int maxPostSize = 1024 * 1000;
String encoding ="UTF-8";

FileRenamePolicy policy = new DefaultFileRenamePolicy();

try{
	MultipartRequest mr = 
			new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

}catch(Exception e){
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>
