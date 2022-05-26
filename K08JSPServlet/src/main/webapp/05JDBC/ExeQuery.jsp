<%--
/**
 * 1. 프로젝트명 : ExeQuery.jsp
 * 2. 작성일 : 2022. 5. 26. 오후 4:35:41
 * 3. 작성자 : mite88
 * 4. 설명 : 회원 목록 조회 테스트(executeQuery() 사용)
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 26.    mite88   
 */
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<%
		JDBConnect jdbc = new JDBConnect();
		
		String sql ="select id, pass, name, regidate from member";
		Statement stmt = jdbc.con.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			java.sql.Date regidate = rs.getDate("regidate");
			
			out.println(String.format("%s %s %s %s",
					id, pw, name, regidate) +"<br>");
		}
		
		jdbc.close();
	%>
</body>
</html>