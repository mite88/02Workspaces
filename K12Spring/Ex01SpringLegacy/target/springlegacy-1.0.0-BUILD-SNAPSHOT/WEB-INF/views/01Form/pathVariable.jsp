<%--
/**
 * <pre>
 * 1. 프로젝트명 : views/01Form/pathVariable.jsp
 * 2. 작성일 : 2022. 7. 11. 오후 12:58:31
 * 3. 작성자 : mite88
 * 4. 설명 : 폼값전송하기4
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼값전송하기4</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/css/bootstrap.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/jquery/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/js/bootstrap.bundle.js"></script>
</head>
<body>
	<div class="container">
		<h2>form 데이터 받기</h2>
		
		<h3>@pathVariable 어노테이션을 폼값 받기</h3>
		<ul>
			<li>회원아이디 : ${memberId }</li>
			<li>회원이름 : ${memberName }</li>
		</ul>

		<div class="row mt-5">
			<h3></h3>
			<img src="<%=request.getContextPath()%>/resources/images/4.png" alt="졸귀강아지" />
		</div>

	</div>
</body>
</html>