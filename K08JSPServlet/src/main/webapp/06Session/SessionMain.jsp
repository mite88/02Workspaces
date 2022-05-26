<%--
/**
 * 1. 프로젝트명 : SessionMain.jsp
 * 2. 작성일 : 2022. 5. 26. 오후 5:14:16
 * 3. 작성자 : mite88
 * 4. 설명 : session 설정 확인
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 26.    mite88   
 */
--%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SimpleDateFormat dataFormat = new SimpleDateFormat("HH:mm:ss");

long creationTime = session.getCreationTime();
String creationTimeStr = dataFormat.format(new Date(creationTime));

long lastTime = session.getLastAccessedTime();
String lastTimeStr = dataFormat.format(new Date(lastTime));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<h2>session 설정 확인</h2>
	<!-- 
		세션 유지 시간은 기본 30분(1800초)
	 -->
	
	<ul>
		<li>세션 유지 시간 : <%= session.getMaxInactiveInterval()%></li>
		<li>세션 아이디 : <%= session.getId()%></li>
		<li>최초 요청 시각 : <%= creationTimeStr%></li>
		<li>마지막 요청 시각 : <%= lastTimeStr%></li>
	</ul>
	
</body>
</html>