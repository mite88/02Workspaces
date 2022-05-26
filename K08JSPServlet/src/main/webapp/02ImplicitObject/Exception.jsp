<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - exception</title>
</head>
<style>
body {
	box-sizing: border-box;
	margin: 0px;
	font-family: Consolas, monospace;
}

.jb-container {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.jb-item {
	padding: 20px;
	background-color: #ffffff;
}
</style>
<body>

	<div class="jb-container">
		<div class="jb-item">
		<%
		int status = response.getStatus();
	
		if(status == 404){
			out.print("<div>404 에러가 발생하였습니다.");
			out.println("<br>파일 경로를 확인해주세요</div>");
		}else if(status == 405){
			out.print("<div>405 에러가 발생하였습니다.");
			out.println("<br>요청방식(method)를 확인해주세요.</div>");
		}else if(status == 500){
			out.print("<div>500 에러가 발생하였습니다.");
			out.println("<br>소스 코드에 오류가 없는지 확인해주세요.</div>");
		}
		%>
		<img alt="img" src="../img/waiting.png">

		</div>
	</div>
</body>
</html>