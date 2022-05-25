<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
<%
//한글깨져서 인코딩설정함
request.setCharacterEncoding("UTF-8");
%>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<li>데이터 전송 방식 : <%=request.getMethod() %></li> <!-- get/post -->
		<li>URL : <%=request.getRequestURL() %></li> <!-- 현재접속한사이트 전체 -->
		<li>URI : <%=request.getRequestURI() %></li> <!-- 현재접속한사이트(호스트 빼고) -->
		<li>프로토콜 : <%=request.getProtocol() %></li>
		<li>서버명 : <%=request.getServerName() %></li>
		<li>서버 포트 : <%=request.getServerPort() %></li>
		 <!-- localhost는 루프백 주소라서  0:0:0:0:0:0:0:1 이런식으로 출력됨-->
		<li>클라이언트 IP 주소 : <%=request.getRemoteAddr() %></li>
		<li>쿼리스트링 : <%=request.getQueryString() %></li>
		<li>전송된 값 1 : <%=request.getParameter("eng") %></li>
		<li>전송된 값 2 : <%=request.getParameter("han") %></li>
	</ul>
</body>
</html>