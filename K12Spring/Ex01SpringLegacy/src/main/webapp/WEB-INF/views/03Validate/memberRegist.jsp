<%--
/**
 * <pre>
 * 1. 프로젝트명 : views\03Validate\memberRegist.jsp
 * 2. 작성일 : 2022. 7. 11. 오후 4:02:29
 * 3. 작성자 : mite88
 * 4. 설명 : Validator 인터페이스를 구현한 폼값 검증
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validator 인터페이스를 구현한 폼값 검증</title>
</head>
<body>
	<div class="container">
		<h2>Validator 인터페이스를 구현한 폼값 검증</h2>

		<span style="color: red; font-size: 1.5em;">${formError }</span>

		<script type="text/javascript">
			function registCheck() {

			}
		</script>
		<form action="./registProc.do" method="post" name="registFrm"
			onsubmit="return registCheck();">
			<table class="table table-bordered" style="width: 500px;">
				<tr>
					<td>아이디 <form:errors path="mInfo.id" /></td>
					<td><input type="text" name="id" value="${mInfo.id }" /></td>
				</tr>
				<tr>
					<td>패스워드 <form:errors path="mInfo.pw"/></td>
					<td><input type="password" name="pw" value="${mInfo.pw }" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${mInfo.name }" /></td>
				</tr>
				<tr>
					<td class="text-center" colspan="2">
						<button type="submit">회원가입하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>