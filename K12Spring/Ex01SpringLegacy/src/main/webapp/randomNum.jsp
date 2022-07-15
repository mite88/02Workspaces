<%--
/**
 * <pre>
 * 1. 프로젝트명 : 
 * 2. 작성일 : 2022. 7. 15. 오전 10:42:12
 * 3. 작성자 : mite88
 * 4. 설명 : 
 * </pre>
 */
--%>
<%@page import="java.util.Random"%>
<%@page import="common.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>RandomNum</h2>
	<%
		Random random = new Random();
		out.println("난수:"+random.nextInt(100));
	%>
	<h2>Lotto6/45</h2>
	
	<%
	LottoCreater lottoCreater = new LottoCreater();
	int[] lottoNum = lottoCreater.lotto();
	for(int lo : lottoNum){
		out.println(lo);
	}
	
	%>
</body>
</html>