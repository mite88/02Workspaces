<%--
/**
 * 1. 프로젝트명 : MemberAuth.jsp
 * 2. 작성일 : 2022. 6. 7. 오후 12:28:03
 * 3. 작성자 : mite88
 * 4. 설명 : 
 * ========================================================
 * 수정일         작성자             내용      
 * ========================================================
 *  
 * ========================================================
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberAuth.jsp</title>
</head>
<body>
	<h2>MVC패턴으로 회원인증하기</h2>
	<p>
		<!-- 서블릿(컨트롤러) request영역에 저장된 속성값 출력 -->
		<strong>${authMessage}</strong>
		<br />
		<a href="./MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a>
		<a href="./MemberAuth.mvc?id=musthave&pass=1234">회원인증(회원)</a>
		<a href="./MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a>
	</p>
</body>
</html>