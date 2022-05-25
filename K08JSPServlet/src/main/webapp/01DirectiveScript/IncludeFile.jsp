<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	포함되는 페이지를 만들때 반드시 page지시어가 있어야함 
 --%>
<%
 	LocalDate today = LocalDate.now(); //오늘날짜
	LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); //내일날짜
%>