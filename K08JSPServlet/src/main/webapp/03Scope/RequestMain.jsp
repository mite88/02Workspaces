<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*
request영역
클라이언트 요청시 새로운 request객체가 생성되고
같은 요청을 처리하는데 사용되는 모든 JSP페이지 영역을 공유
->forward된 페이지까지 공유됨
*/
request.setAttribute("requestString", "request 영역의 문자열");
request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역</title>
</head>
<body>

	<h2>request 영역의 속성값 삭제하기</h2>
	<%
	
	//request영역에 저장되어 정상적으로삭제됨
	request.removeAttribute("requestString");
	//없는속성이라도 에러는 생기지 않음
	request.removeAttribute("requestInteger");
	%>

	<h2>request 영역의 속성값 읽기</h2>
	<%
	//동일 페이지에 저장된 정보라 정상적으로 출력
	Person rPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	
	<ul>
		<li>String 객체 : <%= request.getAttribute("requestString") %></li>
		<li>Person 객체 : <%= rPerson.getName()%>, <%= rPerson.getAge()%></li>
	</ul>

	<h2>포워드된 페이지에서 request영역 속성값 읽기</h2>
	<%
	/*
	포워드
	현페이지로 들어온 요청을 다음 페이지로 보내는 기능(페이지 공유)
	해당 명령전까지의 모든내용은 버퍼에서 삭제되고 포워드된 페이지 내용만 화면에 출력됨
	*/
	
	//이거작성하면 페이지 이동됩니다. 현재페이지로 테스트시 주석하고 해보세요
	request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English")
	.forward(request, response);
	%>
</body>
</html>