<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역</title>
</head>
<body>

	<h2>포워드로 전달된 페이지</h2>
	<h4>RequestMain 파일의 리퀘스트 영억 속성읽기</h4>
	<%
	/*
	이전 페이지에서 포워드한 페이지는 request영역이 공유되기에
	속성값 출력 가능함
	*/
	Person rPerson = (Person) request.getAttribute("requestPerson");
	%>
	<ul>
		<li>String 객체 : <%= request.getAttribute("requestString") %></li>
		<li>Person 객체 : <%= rPerson.getName()%>, <%= rPerson.getAge()%></li>
	</ul>

	<h2>매개변수로 전달된 값 출력하기</h2>
	<%
		//파라미터값 출력함
		request.setCharacterEncoding("UTF-8"); //한글깨짐방지용
		out.println(request.getParameter("paramHan"));
		out.println(request.getParameter("paramEng"));
	%>
</body>
</html>