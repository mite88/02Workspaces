<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//속성저장

/*
	page영역 : 하나의 페이지 내에서만 공유됨
*/
pageContext.setAttribute("pageInteger", 1000);
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
pageContext.setAttribute("pagePerson", new Person("한석봉", 99));

/*
	page영역을 포함한 4가지 영역엔 모든 데이터 저장가능 
	(object기반으로저장되서 읽을때는 형변환해야함)
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%
	//형변환
	int pInteger = (Integer) pageContext.getAttribute("pageInteger");
	String pString = pageContext.getAttribute("pageString").toString();
	Person pPerson = (Person) pageContext.getAttribute("pagePerson");
	%>

	<ul>
		<li>Integer객체 : <%=pInteger%></li>
		<li>String객체 : <%=pString%></li>
		<!-- Person 클래스는 getter()를 통해출력함 -->
		<li>Person객체 : <%=pPerson.getName()%>, <%=pPerson.getAge()%></li>
	</ul>

	<h2>include된 파일에서 page영역 읽어오기</h2>
	<!-- 
	지시어 include로 페이지 원본소스를 그대로 현재 문서 포함 뒤 컴파일 
	되므로 동일한 페이지로 취급함 -> page영역이 공유됨
	-->
	<%@ include file="PageInclude.jsp"%>

	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<!-- 페이지 이동시 새로운 페이지를 웹서버에 요청하는것 ->  page영역이 공유 안됨-->
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>