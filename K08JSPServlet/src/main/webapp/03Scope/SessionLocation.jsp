<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
</head>
<body>
	<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
	<!-- 
		모든 실행창(웹브라우저) 닫은 후 해당페이지 단독실행시 NullPointException 발생
	 -->
	<%
	ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists");
	
	for(String str : lists){
		out.print(str +"<br>");
	}
	%>
</body>
</html>