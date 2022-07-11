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
	<h2>Hello Spring Framework</h2>
	<h3>첫번째 컨트롤로 만들기</h3>
	<h4>컨트롤러에서 뷰로 전달한 값 : ${ firstMessage }</h4>

	<script>
	$(function(){
		alert("jquey 실행?");
	})
	</script>
</body>
</html>