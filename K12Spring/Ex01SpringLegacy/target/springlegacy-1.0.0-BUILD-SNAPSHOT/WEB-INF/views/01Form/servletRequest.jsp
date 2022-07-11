<%--
/**
 * <pre>
 * 1. 프로젝트명 :  views/01Form/servletRequest.jsp
 * 2. 작성일 : 2022. 7. 11. 오전 11:39:29
 * 3. 작성자 : mite88
 * 4. 설명 : 폼값전송하기1
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼값전송하기1</title>
</head>
<body>
	<h2>servletRequest로 폼값받기(Get 방식)</h2>
	<ul>
		<li>아이디 : ${id} </li>
		<li>패스워드 : ${pw} </li>
		<li>메세지 : ${message }</li>
	</ul>
</body>
</html>