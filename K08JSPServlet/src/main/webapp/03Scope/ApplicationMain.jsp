<%@page import="common.Person"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 영역</title>
</head>
<body>
	<h2>application 영역의 공유</h2>
	<%
	/*
	application영역
	웹 애플리케이션은 단 하나의 application객체만 생성하고 
	클라이언트가 요청하는 모든 페이지가 application객체를 공유함
	웹서버가 닫칠때 까지 유지됨
	*/
	Map<String, Person> maps = new HashMap();
	maps.put("actor1", new Person("이수일", 30));
	maps.put("actor2", new Person("심순애", 28));
	application.setAttribute("maps", maps);
	%>
	
	application 영역에 속성이 저장되었습니다.
</body>
</html>