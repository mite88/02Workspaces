<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>

	<!--
	쿠키
	클라이언트의 상태 정보를 유지하기위한 기술로
	클라이언트의 pc에 파일 형태로 저장
	크기가 4KB, 3000개까지 정보를 저장할 수 있다.
	  -->
	<h2>1. 쿠키(Cookie) 설정</h2>
	<%
	/*
	생성자를 통해서만 생성가능
	쿠키 생성후 이름 변경 불가
	*/
	Cookie cookie = new Cookie("myCookie", "쿠기맛나요");
	//쿠키경로설정(웹애플리케이션 전체에서 사용하기위한....)
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(3600); //초단위(1시간)
	response.addCookie(cookie); //응답헤더에 쿠키 추가 및 클라이언트로 전송
	%>

	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	/*
	쿠키는 생성직후 설정한 쿠키를 읽어올수 없음
	새로고침 or 페이지 이동으로 새로운 요청을 보내야 읽기 가능
	*/
	//request 내장객체의 getCookies()로 생성된 모든 쿠키를 배열 형태로 가져옴
	Cookie[] cookies = request.getCookies();
	//쿠키존재시.....
	if(cookies != null){
		for(Cookie c : cookies){
			String cookieName = c.getName(); //쿠키명
			String cookeValue = c.getValue(); //쿠키값
			out.println(String.format("%s : %s<br>", cookieName, cookeValue));
		}
	}
	%>

	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp" >다음페이지에서 쿠키값 확인</a>

</body>
</html>