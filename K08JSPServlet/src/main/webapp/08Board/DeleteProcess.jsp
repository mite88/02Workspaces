<%--
/**
 * 1. 프로젝트명 : DeleteProcess.jsp
 * 2. 작성일 : 2022. 5. 30. 오후 3:50:47
 * 3. 작성자 : mite88
 * 4. 설명 : 게시판삭제 프로세서
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
<%@ include file="./IsLoggedIn.jsp"%>      
<%
//폼값받기
String num = request.getParameter("num");

//DTO객체와 DB연결 및 기존 게시물 가져오기
BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);

//4가지 영역에 저장된데이터는 object타입이라 String로 형변환
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;
if(sessionId.equals(dto.getId())){
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	dao.close();
	if(delResult == 1){
		JSFunction.alertLocation("삭제완료", "List.jsp", out);
	}else{
		JSFunction.alertBack("삭제실패", out);
	}
}else{
	
}

%>