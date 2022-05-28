<%--
/**
 * <pre>
 * 1. 프로젝트명 : logoutProcess.jsp
 * 2. 작성일 : 2022. 5. 28. 오후 2:52:27
 * 3. 작성자 : home
 * 4. 설명 : 로그아웃 프로세서
 * </pre>
 */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.invalidate();

response.sendRedirect("memberLogin.jsp");
%>