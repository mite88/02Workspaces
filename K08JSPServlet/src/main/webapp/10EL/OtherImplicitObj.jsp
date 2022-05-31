<%--
/**
 * <pre>
 * 1. 프로젝트명 : OtherImplicitObj.jsp
 * 2. 작성일 : 2022. 5. 31. 오후 3:00:02
 * 3. 작성자 : mite88
 * 4. 설명 : 표현 언어(EL) - 그 외 외장객체
 * </pre>
 */
--%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//쿠키유틸리티 클래스로 유효시간 10초인 쿠키 생성
CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 그 외 외장객체</title>
</head>
<body>
	<h3>쿠키값 읽기</h3>
	<!-- 
	EL로 읽을때 cookie.쿠키명.value
	 -->
	<li>ELCookie값 : ${cookie.ELCookie.value }</li>
	
	<h3>HTTP 헤더읽기</h3>
	<ul>
		<li>host : ${header.host }</li>
		<!-- 
		user-agent와 같은 속성명-(하이픈)이 포함된 경우
		.으로 출력이 안되고 [(대괄호)를 사용해야함
		 -->
		<li>user-agent : ${header['user-agent'] }</li>
		<li>cookie : ${header.cookie }</li>
	</ul> 
	
	<!-- web.xml에 기술된 내용 읽기 -->
	<h3>컨텍스트 초기화 매개변수 읽기</h3>
	<li>OracleDriver : ${initParam.OracleDriver } </li>
	
	<!-- 이클립스 환경에선 '프로젝트명/'와 같이 출력됨 -->
	<h3>컨텍스트 루트 경로 읽기</h3>
	<li>${pageContext.request.contextPath }</li>
</body>
</html>