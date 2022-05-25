<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	/*
	getParameter() - 하나의 값이 전송될 경우 사용 (받는값은 String타입)
	getParameterValues() - checkbox 등과 같이 2개 이상의 값이 전송될 경우 사용
						   (받는값은 String[]타입)
	*/
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	String[] favo= request.getParameterValues("favo");
	String favoStr ="";
	
	if(favo != null){
		for(int i =0; i< favo.length; i++){
			favoStr += favo[i]+" ";
		}
	}	
	
	/*
	textarea 태그는 두줄이상 입력이 되는데 엔터키가 "\r\n"로 저장이된다
	따라서 화면 출력시 <br>로 변경 해야함
	*/
	String intro = request.getParameter("intro").replace("\r\n", "<br>");
%>
	<ul>
		<li>아이디 : <%= id %></li>
		<li>성별 : <%= sex %></li>
		<li>관심사항 : <%= favoStr %></li>
		<li>자기소개 : <%= intro %></li>
	</ul>
</body>
</html>