<%--
/**
 * <pre>
 * 1. 프로젝트명 : cookie - 로그인확인
 * 2. 작성일 : 2022. 5. 25. 오후 5:50:43
 * 3. 작성자 : mite88
 * </pre>
 */
--%>
<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
//체크박스가 하나인 경우는 getParameter()사용해도됨
String save_check = request.getParameter("save_check");

//아이디 비번 일치여부확인
if("must".equals(user_id) && "1234".equals(user_pw)){
	//'아이디저장하기' 체크한 경우
	if(save_check !=  null && save_check.equals("Y")){
		//쿠키생성
		CookieManager.makeCookie(response, "loginId", user_id, 86400);
	}else{
		//체크해제시 쿠키삭제
		CookieManager.deleteCookie(response, "loginId");
	}	
	
	JSFunction.alertLocation("로그인에 성공했습니다", "IdSaveMain.jsp", out);
}else{
	//로그인실패
	JSFunction.alertBack("로그인에 실패했습니다",  out);
}

%>