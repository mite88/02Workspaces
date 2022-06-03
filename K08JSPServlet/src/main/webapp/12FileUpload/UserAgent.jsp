<%--
/**
 * 1. 프로젝트명 : UserAgent.jsp
 * 2. 작성일 : 2022. 6. 3. 오후 3:53:01
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- UserAgent.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-Agent 확인</title>
</head>
<body>
	<%
	String client = request.getHeader("User-Agent");
	out.print(client);
	%>
</body>
</html>