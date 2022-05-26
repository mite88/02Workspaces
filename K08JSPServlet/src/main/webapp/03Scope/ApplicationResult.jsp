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
	<h2>application 영역의 속성 읽기</h2>

	<%
	Map<String, Person> maps = (Map<String, Person>)application.getAttribute("maps");
	/*
	Map컬렉션은 key를 통해 value에 저장되기에 반복전에 key 값을 얻고
	keySet()을 통해 얻은 key를 목록을 통해 반복하여 getter()를 통해 value를 출력함
	*/
	Set<String> keys = maps.keySet();
	
	for(String key : keys){
		Person person = maps.get(key);
		out.print(String.format("이름 : %s, 나이 : %d<br>",
				person.getName(), person.getAge()));
	}
	%>
</body>
</html>