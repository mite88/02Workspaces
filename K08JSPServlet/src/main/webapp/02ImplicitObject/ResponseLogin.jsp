<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response</title>
</head>
<body>
<%
	//request내장객체를 통해 폼값 받기
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	//문자열을 통한 단순비교로 로그인정보 일치하면 페이지 이동함
	if(id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")){
		//페이지 이동
		response.sendRedirect("ResponseWelcome.jsp");
	}else{
		/*
		인증에 실패시 메인페이지로 포워드함
		페이지이동과는 다르게 제어 흐름전달 시 사용
		웹 브라우저 주소줄엔 ResponseLogin.jsp로 보이지만 
		실제로는 ResponseMain.jsp의 내용이 출력됨
		
		아래 명령을 만나기 전까지의 모든 내용을 버퍼에서 제거 후
		아래 페이지의 내용을 웹브라우저에 출력함
		*/
		request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
		.forward(request, response);
	}
%>

</body>
</html>