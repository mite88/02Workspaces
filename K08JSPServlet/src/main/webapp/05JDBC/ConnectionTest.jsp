<%--
/**
 * 1. 프로젝트명 : 
 * 2. 작성일 : 2022. 5. 26. 오후 2:33:13
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 26.    mite88   
 */
--%>
<%@page import="common.DBConnPool"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>JDBC 테스트1</h2>
	<%
		JDBConnect jdbc1 = new JDBConnect();
		jdbc1.close();
	%>
	
	<h2>JDBC 테스트2</h2>
	<%
		//application내장객체의 메서드를 통해 컨테스트 초기화 파라미터 가져옴
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd");
		JDBConnect jdbc2 = new JDBConnect(driver, url, id , pwd);
		jdbc2.close();
	%>
	
	<h2>JDBC 테스트3</h2>
	<%
		JDBConnect jdbc3 = new JDBConnect(application);
		jdbc3.close();
	%>
	
	<h2>JDBC 테스트 - 커넥션풀</h2>
	<%
		DBConnPool pool = new DBConnPool();
		pool.close();
	%>
</body>
</html>