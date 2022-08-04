<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Spring Security 사용1 - Default 페이지 사용</h2>
	<li><a href="/security1-1/index.do" target="_blank"> Step1 페이지
			바로가기(인증필요) </a></li>

	<li><a href="./security1-2/access.do" target="_blank"> Step1
			페이지 바로가기(인증불필요) </a></li>


	<h2>Spring Security - Step2(커스텀 페이지 사용하기)</h2>
	<li><a href="./security2/index.do" target="_blank"> Step2
			INDEX 페이지 바로가기</a></li>

	<li><a href="/security2/login.do" target="_blank"> Step2 로그인
			페이지 바로가기 </a></li>

	<li><a href="./security2/admin/main.do" target="_blank"> Step2
			관리자영역 바로가기</a></li>

	<li><a href="./security2/accessDenied.do" target="_blank">
			Step2 접근불가페이지 바로가기 </a></li>
</body>
</html>