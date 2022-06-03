<%--
/**
 * 1. 프로젝트명 : Out.jsp
 * 2. 작성일 : 2022. 6. 3. 오전 9:41:15
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- Out.jsp -->
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - out</title>
</head>
<body>
	<!-- 
		out태그
		영역에 저장된 변수 출력시 사용
		escapeXml 속성이 true이면 html태그가 그래도 출력됨
	 -->
	<c:set var="iTag">i 태그는 <i>기울임</i>을 표현 합니다</c:set>
	
	<h4>기본사용</h4>
	<c:out value="${iTag}"/>
	
	<h4>escapeXml 속성</h4>
	<c:out value="${iTag}" escapeXml="false"/>
	
	<!-- 최초실행시 파라미터가 없으므로 default값이 출력됨 -->
	<h4>default 속성</h4>
	<c:out value="${iTag}" default="이름 없음"/>
	<!-- value속성이 null일때만 default가 출력되고 빈값이면 출력안됨 -->
	<c:out value="" default="빈 문자열도 값입니다."/>
	
	<h4>default 속성으로 javascript함수실행</h4>
	
	<!-- 
	El은 javascript실행을 위해 제작한 클래스의 메서드를 호출하고있음
	<sctipt>를 포함한 문자열이 html문자에 출력되면 js함수가 실행되기에 escapeXml속성을 false로 줌
	 -->
	<c:out value="${param.js}" escapeXml="false" default="${JSFunction.alertMsg('테스트', out)}"/>

</body>
</html>