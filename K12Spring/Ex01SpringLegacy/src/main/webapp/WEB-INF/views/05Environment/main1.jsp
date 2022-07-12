<%--
/**
 * <pre>
 * 1. 프로젝트명 : 05Environment/main1.jsp
 * 2. 작성일 : 2022. 7. 12. 오전 11:42:29
 * 3. 작성자 : mite88
 * 4. 설명 : 
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
</head>
<body>
	<div class="container">

		<h2>Environment 객체를 이용한 외부파일 사용하기</h2>
		<h3>EnvAdmin.properties 파일에서 읽어온 Oracle의 kosmo계정 정보</h3>
		<ul>
			<li>아이디 : ${adminID }</li>
			<li>패스워드 : ${adminPW }</li>
		</ul>
	</div>
</body>
</html>