<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSP 파일 인클루드 하기</h2>
	<%@include file="/randomNum.jsp" %>
	
	<h2>JSP 파일 링크걸기</h2>
	<a href="<%=request.getContextPath()%>/randomNum.jsp">randomNum.jsp 바로가기</a>
</body>
</html>