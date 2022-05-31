<%--
/**
 * <pre>
 * 1. 프로젝트명 : ObjectParams.jsp
 * 2. 작성일 : 2022. 5. 31. 오후 1:15:13
 * 3. 작성자 : mite88
 * 4. 설명 : 표현 언어(EL) - 객체 매개 변수
 * </pre>
 */
--%>
<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 객체 매개 변수 </title>
</head>
<body>
	<%
	//3객체를 request영역에 저장 
	request.setAttribute("personObj", new Person("홍길동",33));
	request.setAttribute("stringObj", "나는문자열");
	request.setAttribute("integerObj", new Integer(99));
	%>
	
	<!-- 액션태그를 통한 포워드 -->
	<jsp:forward page="ObjectResult.jsp">
		<jsp:param value="10" name="firstNum"/>
		<jsp:param value="20" name="secondNum"/>
	</jsp:forward>
</body>
</html>