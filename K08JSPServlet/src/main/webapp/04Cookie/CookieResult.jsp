<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>

	<h2>쿠키값 확인하기(쿠키 생성 이후 페이지)</h2>
	<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookeValue = c.getValue();
			out.println(String.format("쿠키명 : %s - 쿠기값 : %s<br>", 
					cookieName, cookeValue));
		}
	}
	%>
</body>
</html>