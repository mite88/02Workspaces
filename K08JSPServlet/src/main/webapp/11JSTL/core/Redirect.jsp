<%--
/**
 * 1. 프로젝트명 : core/Redirect.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 5:58:59
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- core/Redirect.jsp -->
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - redirect</title>
</head>
<body>
	<!-- 
		redirect태그
		
		태그실행 즉시 페이지 이동
		새로운 페이지에 대한 요청이라  request영역에 공유되지않음
		절대경로 사용시 컨텍스트 루트 경로 제외
	 -->
	<c:set var="requestVar" value="MustHave" scope="request"/>
	<c:redirect url="/11JSTL/inc/OtherPage.jsp">
		<c:param name="user_param1" value="출판사"/>
		<c:param name="user_param2" value="골든래빗"/>
	</c:redirect>
	
	
	<!-- 
	response내장객체를 통한 이동에선 컨텍스트루트 경로가 반드시 기술되어야함
	파라미터가 한글인 경우 깨짐 현상으로 인해 아래와 같이 인코딩 처리해야함
	 -->
	<h4>JSP 내장객체를 통한 페이지 이동</h4>
	<%--
	String p1 = URLEncoder.encode("출판사");
	String p2 = URLEncoder.encode("골든래빗");
	
	response.sendRedirect(request.getContextPath()
			+"/11JSTL/inc/OtherPage.jsp?user_param1="+p1+"&user_param2="+p2);
	--%>
	
</body>
</html>