<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<h2>3. 요청 헤더정보 출력하기</h2>
	<%
		/*
		getHeaderNames()
		사용자의 요청 헤더를 얻어올때 사용하는 메서드(반환값 Enumeration)
		hasMoreElements() : 출력할 정보가 있는지 확인
		nextElement() : 헤더명 반환
		
		getHeader() : 헤더명을 통해 헤더값 반환
		*/
		
		Enumeration headers = request.getHeaderNames();
		
		while(headers.hasMoreElements()){
			String headerName = (String)headers.nextElement();
			String headerValue = request.getHeader(headerName);
			out.println("해더명 : "+headerName+", 헤더값 : "+headerValue+"<br>");
		}
		
		/*
		요청헤더를 통해 확인 할 수 있는 값
		user-agent : 접속한 웹 브라우져
		referer : 웹서핑하면서 다른 사이트 방문시 남는 흔적(유입 경로)
		cookie : 웹서버가 브라우저를 통해 클라이언트의 컴퓨터에 남기는 흔적(파일형태)
		*/
	%>
	<p>이 파일은 직접 실행하면 referer정보는 출력되지 않습니다.</p>
</body>
</html>