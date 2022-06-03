<%--
/**
 * 1. 프로젝트명 : etc/Fmt2.jsp
 * 2. 작성일 : 2022. 6. 3. 오전 10:34:49
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- etc/Fmt2.jsp -->
<%@page import="java.util.TimeZone"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 2</title>
</head>
<body>
	<c:set var="today" value="<%= new java.util.Date() %>"/>

	<!-- 
	 type="date" :날짜
	 dateStyle 속성
	 full : 2022년 6월 3일 금요일
	 short : 22. 6. 3.
	 long : 2022년 6월 3일
	 default : 2022. 6. 3.
	 -->
	<h4>날짜 포멧</h4>
	full : <fmt:formatDate value="${today}" type="date" dateStyle="full"/>
	<br />
	short : <fmt:formatDate value="${today}" type="date" dateStyle="short"/>
	<br />
	long : <fmt:formatDate value="${today}" type="date" dateStyle="long"/>
	<br />
	default : <fmt:formatDate value="${today}" type="date" dateStyle="default"/>
	
	<!-- 
	 type="time" : 시간
	 dateStyle 속성
	 full : 오전 11시 14분 47초 대한민국 표준시
	 short : 오전 11:14
	 long : 오전 11시 14분 47초 KST
	 default : 오전 11:14:47
	 -->
	<h4>시간포멧</h4>
	full : <fmt:formatDate value="${today}" type="time" timeStyle="full"/>
	<br />
	short : <fmt:formatDate value="${today}" type="time" timeStyle="short"/>
	<br />
	long : <fmt:formatDate value="${today}" type="time" timeStyle="long"/>
	<br />
	default : <fmt:formatDate value="${today}" type="time" timeStyle="default"/>
	
	<!-- type="both" : 날짜와 시간 동시 표시 -->
	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	<br />
	
	<!-- 출력포맷지정 -->
	<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
	
	<h4>타임존 설정</h4>
	<!-- GMT : 세계 표준시로 영국 그리니치 천문대를 기준으로함 -->
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>
	<br />
	
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>
	
	<h4>timezone에서 사용할 수 있는 문자열</h4>
	<c:forEach var="ids" items="<%= TimeZone.getAvailableIDs() %>">
		${ids}<br>
	</c:forEach>
</body>
</html>