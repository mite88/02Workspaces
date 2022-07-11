<%--
/**
 * <pre>
 * 1. 프로젝트명 : views/01Form/commandObjGet.jsp
 * 2. 작성일 : 2022. 7. 11. 오후 12:50:23
 * 3. 작성자 : mite88
 * 4. 설명 : 폼값전송하기3
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form값 받기</title>
</head>
<body>
	<h3>커멘드객체를 이용하여 폼값 한번에 받기</h3>
	<ul>
		<li>이름 : ${memberDTO.name }</li>
		<li>아이디 : ${memberDTO.id}</li>
		<li>패스워드 : ${memberDTO.pw }</li>
		<li>이메일 : ${memberDTO.email }</li>
	</ul>
</body>
</html>