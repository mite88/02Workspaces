<%--
/**
 * 1. 프로젝트명 : Logout.jsp
 * 2. 작성일 : 2022. 5. 27. 오전 10:56:10
 * 3. 작성자 : mite88
 * 4. 설명 : 로그아웃 시 세션 삭제
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 27.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//방법1. 회원정보관련 session 지우기
session.removeAttribute("UserId");
session.removeAttribute("UserName");

//방법2. session의 모든 속성지우기
session.invalidate();

response.sendRedirect("LoginForm.jsp");
%>