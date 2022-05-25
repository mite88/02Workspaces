<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
	<h2>서비스 중 일시적인 오류가 발생하였습니다.</h2>
	<div>
		<img src="../images/Error.jpg" alt="" />
	</div>
	<p>
		오류명 : <%= exception.getClass().getName() %> <br>
		오류메시지 : <%= exception.getMessage()%>
	</p>
</body>
</html>