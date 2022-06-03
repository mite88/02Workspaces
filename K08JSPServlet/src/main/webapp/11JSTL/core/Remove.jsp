<%--
/**
 * 1. 프로젝트명 : core/Remove.jsp
 * 2. 작성일 : 2022. 6. 2. 오전 11:59:01
 * 3. 작성자 : mite88
 * 4. 설명 : JSTL - remove
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- core/Remove.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 변수선언 -->
<c:set var="scopeVar" value="Page Value"/>
<c:set var="scopeVar" value="Request Value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - remove</title>
</head>
<body>
	<h4>출력하기</h4>
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>application.scopeVar : ${application.scopeVar}</li>
	</ul>
	
	<h4>session 영역에서 삭제하기</h4>
	<c:remove var="scopeVar" scope="session"/>
	<ul>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
	</ul>
	
	<h4>scope 지정없이 삭제</h4>
	<c:remove var="scopeVar" />
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>application.scopeVar : ${application.scopeVar}</li>
	</ul>
</body>
</html>