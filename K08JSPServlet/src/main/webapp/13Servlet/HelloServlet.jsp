<%--
/**
 * 1. 프로젝트명 : HelloServlet.jsp
 * 2. 작성일 : 2022. 6. 3. 오후 5:06:50
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- HelloServlet.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet.jsp</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 JSP에서 출력</h2>
	<p>
		<strong><%= request.getAttribute("message") %></strong>
		<br />
		<a href="./HelloServlet.do">바로가기</a>
	</p>
</body>
</html>