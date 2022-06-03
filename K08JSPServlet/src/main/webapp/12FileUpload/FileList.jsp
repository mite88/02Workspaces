<%--
/**
 * 1. 프로젝트명 : FileList.jsp
 * 2. 작성일 : 2022. 6. 3. 오후 12:37:36
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- FileList.jsp -->
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.*"%>
<%@page import="fileupload.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>
<body>

	
	<%
	//서버의 물리적 경로 얻기
	String saveDirectory = application.getRealPath("/Uploads");
	//파일객체 생성
	File file = new File(saveDirectory);
	//해당디렉토리 파일 목록 얻기
	File[] fileList = file.listFiles();
	%>
	<h2>업로드된 파일 리스트보기(디렉토리읽어오기)</h2>
	<%
	int fileCnt = 1;
	//반복
	for(File f : fileList){
	%>	
		<li>파일명 <%=fileCnt%> : <%= f.getName() %> </li>
		<li>파일크기 : <%= (int)Math.ceil(f.length() / 1024.0) %>kb </li>
	<% fileCnt++; } %>
	
	
	<h2>DB에 등록된 파일리스트 보기</h2>
	<a href="FileUploadMain.jsp">파일 등록</a>
	<%
	MyfileDAO dao = new MyfileDAO();
	List<MyfileDTO> fileLists = dao.myFileList();
	dao.close();
	%> 
	<table border="1">
		<tr>
			<th>No</th>
			<th>파일미리보기</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본 파일명</th>
			<th>저장된 파일명</th>
			<th>작성일</th>
			<th>다운로드</th>
		</tr>
		<%for(MyfileDTO f: fileLists){%>
		<tr>
			<td><%= f.getIdx() %></td>
			<td><img src="<%= request.getContextPath() %>/Uploads/<%= f.getSfile() %>" alt="" width="100px" /></td>
			<td><%= f.getName() %></td>
			<td><%= f.getTitle() %></td>
			<td><%= f.getCate() %></td>
			<td><%= f.getOfile() %></td>
			<td><%= f.getSfile() %></td>
			<td><%= f.getPostdate() %></td>
			<td>
				<a href="Download.jsp?oName=<%= URLEncoder.encode(f.getOfile(),"UTF-8") %>&sName=<%= URLEncoder.encode(f.getSfile(),"UTF-8") %>">
					[다운로드]
				</a>
			</td>
		</tr>
		<% } %>
	</table>

</body>
</html>