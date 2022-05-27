<%--
/**
 * 1. 프로젝트명 : LoginProcess.jsp
 * 2. 작성일 : 2022. 5. 27. 오전 9:51:15
 * 3. 작성자 : mite88
 * 4. 설명 : db연결및 로그인정보확인
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 27.    mite88   
 */
--%>
<%@page import="membership.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 페이지에서 사용자가 입력한 회원정보 받기
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
//System.out.print(userId);

//application 내장객체를 통해 web.xml에 입력된 DB정보 읽기
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

//JDBC를 통한 오라클접속
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//받은 아이디, pw 매개변수로 메서드호출
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close(); //DB작업끝나면닫기

if(memberDTO.getId() != null){
	/*
	회원인증 성공시 세션영역에 저장 
	*/
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	//로그인페이지 이동
	response.sendRedirect("LoginForm.jsp");
}else{
	
	/*
	회원인증실패시
	리퀘스트영역에 실패메세지 저장함
	*/
	request.setAttribute("LoginErrMsg", "로그인 오류");
	//포워드로 요청전달가능함
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>