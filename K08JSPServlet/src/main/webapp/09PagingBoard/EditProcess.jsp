<%--
/**
 * 1. 프로젝트명 : EditProcess.jsp
 * 2. 작성일 : 2022. 5. 30. 오후 2:59:54
 * 3. 작성자 : mite88
 * 4. 설명 : 수정 프로세서
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 30.    mite88   
 */
--%>
<%@page import="model1.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정 페이지 진입 전 로그인 확인용 -->
<%@ include file="./IsLoggedIn.jsp"%>      
<%

//폼값받기
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//사용자가 입력한 폼값 저장용
BoardDTO dto = new BoardDTO();
//데이터 저장
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);


BoardDAO dao = new BoardDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

//실패 성공여부
if(affected == 1){
	response.sendRedirect("View.jsp?num="+dto.getNum());
}else{
	JSFunction.alertBack("수정 실패", out);
	
}

%>