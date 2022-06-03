<%--
/**
 * 1. 프로젝트명 : core/ForTokens.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 4:38:35
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- core/ForTokens.jsp -->
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forTokens</title>
</head>
<body>
	<%
	String rgba = "Red,Breen,Blue,Black";
	%>
	
	<!-- 
	forTokens태그 속성
	items :  구분자를 포함한 문자열(컬렉션, 배열은 x)
	var : 구분자를 통해 잘린 토큰 저장
	 -->
	<c:forTokens items="<%= rgba %>" delims="," var="color">
		<span style="color:${color};">${color}</span>
	</c:forTokens>
	
	<h4>StringTokenizer 클래스 사용</h4>
	<%
	//문자열과 구분자를 인자로 생성자를 통한 객체 생성
	StringTokenizer tokens = new StringTokenizer(rgba,",");
	out.print("토큰수"+tokens.countTokens()+"<br>");
	
	//인출할 토큰이 있는지 확인
	while(tokens.hasMoreTokens()){
		String token = tokens.nextToken();
		out.println(token+"<br>");
	}
	%>
	
	<h4>String 클래스의 split() 메서드 이용</h4>
	<%
	//구분자를 통해 나눈결과를 배열로 반환
	String[] colorArr = rgba.split(",");
	for(String s: colorArr){
		out.println(s+"<br>");
	}
	%>
</body>
</html>