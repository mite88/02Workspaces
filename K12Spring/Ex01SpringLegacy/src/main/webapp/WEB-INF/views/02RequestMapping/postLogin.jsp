<%--
/**
 * <pre>
 * 1. 프로젝트명 : views/02RequestMapping/postLogin.jsp
 * 2. 작성일 : 2022. 7. 11. 오후 3:03:38
 * 3. 작성자 : mite88
 * 4. 설명 : POST 방식으로 전송된 로그인 파라미터
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap-5.1.3/css/bootstrap.css" />
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/jquery/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap-5.1.3/js/bootstrap.bundle.js"></script>

</head>
<body>
	<div class="container">
		<h2>@RequestMapping 어노테이션</h2>
		<h3>POST 방식으로 전송된 로그인 파라미터</h3>
		
		<ul>
			<li>아이디 : ${id }</li>
			<li>패스워드 : ${pw }</li>
		</ul>
	</div>

</body>
</html>