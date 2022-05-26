<%--
/**
 * 1. 프로젝트명 : ExeUpdate.jsp
 * 2. 작성일 : 2022. 5. 26. 오후 4:31:55
 * 3. 작성자 : mite88
 * 4. 설명 : 회원 추가 테스트(executeUpdate() 사용)
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 26.    mite88   
 */
--%>
<%@page import="java.sql.PreparedStatement"%>
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
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
		JDBConnect jdbc = new JDBConnect();
	
		String id ="test1";
		String pass ="1111";
		String name ="테스트1회원";
		
		String sql = "insert into member values(?, ?, ?, sysdate)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pass);
		psmt.setString(3, name);
		
		int inResult = psmt.executeUpdate();
		out.println(inResult+"행이 입력됨");
		
		jdbc.close();
	%>
</body>
</html>