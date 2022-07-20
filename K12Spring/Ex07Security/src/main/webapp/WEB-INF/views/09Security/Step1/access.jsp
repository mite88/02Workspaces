<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h2>스프링 시큐리티 Step1</h2>
		<h3>기본설정으로 구현하기</h3>
		<h4>USER권한 획득 후 사용가능한 페이지</h4>
		<form:form method="post" action="../logout">
			<input type="submit" value="로그아웃" />
		</form:form>
		
	</div>
	
</body>
</html>