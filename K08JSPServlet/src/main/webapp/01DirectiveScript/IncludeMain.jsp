<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--
 	include지시어를 통해 파일을 포함하면 컴파일되지 않은 원본상태
 	의 코드가 그대로 포함 된 후 컴파일이 진행됨 
  --%>
<%@ include file="IncludeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어</title>
</head>
<body>

<%
	out.println("오늘날짜"+ today);
	out.println("<br>");
	out.println("내일날짜"+ tomorrow );
%>
</body>
</html>