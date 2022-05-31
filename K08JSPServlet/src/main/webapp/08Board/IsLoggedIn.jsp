<%--
/**
 * 1. 프로젝트명 : IsLoggedIn.jsp
 * 2. 작성일 : 2022. 5. 30. 오전 11:03:03
 * 3. 작성자 : mite88
 * 4. 설명 : 로그인확인용
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 30.    mite88   
 */
--%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
session영역에 저장된 회원인증 관련 속성값 여부 확인후
없으면 로그인페이지로 이동. 이때 utils패키지에 생성한 클래스 활용
*/
if(session.getAttribute("UserId") == null){
	/*
	javascript를 사용하기 위한 유틸리티 클래스로 경고창 및
	location.href로 페이지 이동시킴
	*/
	JSFunction.alertLocation("로그인 후 이용해주십시오", 
			"../06Session/LoginForm.jsp", out);
	
	//response.sendRedirect("List.jsp"); //이걸 주석을푸면 이게 먼저 실행됨
	
	/*
	jsp, javascript 등이 같이 있다면 jsp가 우선순위이기 때문에
	retrun;을 해주어 종료되게 만듬
	*/
	return;
}
%>