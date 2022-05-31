<%--
/**
 * 1. 프로젝트명 :  WriteProcess.jsp
 * 2. 작성일 : 2022. 5. 30. 오전 11:46:16
 * 3. 작성자 : mite88
 * 4. 설명 : 글쓰기 프로세서
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 30.    mite88   
 */
--%>
<%@page import="utils.JSFunction"%>
<%@page import="model1.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지 진입 전 로그인 확인용 -->
<%@ include file="./IsLoggedIn.jsp"%>      
<%

//폼값받기
String title = request.getParameter("title");
String content = request.getParameter("content");

//사용자가 입력한 폼값 저장용
BoardDTO dto = new BoardDTO();
//데이터 저장
dto.setTitle(title);
dto.setContent(content);

//session에 저장된 데이터 이용함
dto.setId(session.getAttribute("UserId").toString());

//DAO객체 생성을 통해 DB연결 및 회원정보 입력
BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

//실패 성공여부
if(iResult == 1){
	response.sendRedirect("List.jsp");
}else{
	JSFunction.alertBack("글쓰기 실패", out);
	
}

%>