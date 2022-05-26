<%--
/**
 * <pre>
 * 1. 프로젝트명 : cookie - 아이디 저장하기
 * 2. 작성일 : 2022. 5. 25. 오후 5:50:43
 * 3. 작성자 : mite88
 * </pre>
 */
--%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//해당 쿠키를 읽어옴 
	String loginId= CookieManager.readCookie(request,"loginId");

	//앞에서 읽어온 쿠키값이 있다면 checked속성값을 변수에 설정함
	String cookieCheck = "";
	if(cookieCheck.equals("")){
		cookieCheck="checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie - 아이디 저장하기</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
	<!-- tabindex속성 : tab키를 누를시 포커스(이동)되는 순서 지정 -->
		아이디 : <input type="text" name="user_id" value="<%= loginId%>"
		tabindex="1"/><br>
		
		<input type="checkbox" name="save_check"  value="Y" <%= cookieCheck %>
		tabindex="3"/>
		아이디저장하기 <br>
		
		패스워드 : <input type="text" name="user_pw" tabindex="2"/><br>
		
		<input type="submit" value="로그인하기">
	</form>
</body>
</html>