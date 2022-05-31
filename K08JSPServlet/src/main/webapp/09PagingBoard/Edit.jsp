<%--
/**
 * 1. 프로젝트명 : Edit.jsp
 * 2. 작성일 : 2022. 5. 30. 오후 2:43:31
 * 3. 작성자 : mite88
 * 4. 설명 : 수정하기
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 30.    mite88   
 */
--%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!-- 수정 페이지 진입 전 로그인 확인용 -->
<%@ include file="./IsLoggedIn.jsp"%>  
<%
//게시물번호 파라미터 받기
String num = request.getParameter("num");
//DB 연결
BoardDAO dao = new BoardDAO(application);
//기존내용 읽어오기위해 view관련 함수 불려옴
BoardDTO dto = dao.selectView(num);

//url파라미터를 치고 들어가면 그냥 들어가지기에 확인하는작업을 해야함
String sessionId = session.getAttribute("UserId").toString();
//session영역에 저장된 아이디와 게시물 아이디가 같은지 확인
if(!sessionId.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
 
    </script>
    
</head>
<body>
<!-- 액션태그를 통해 공통 페이지 인클루드함 -->
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 수정(edit)</h2>

<!-- 처리시 반드시 post방식 사용할것 (get방식의 경우 전송의 제한이있음) -->
<form name="writeFrm" method="post" action="EditProcess.jsp"
      onsubmit="return validateForm(this);">
    
    <!-- 게시물 일련번호 서버 전송을 위한 hidde타입의 input태그 필요함 -->
    <input type="hidden" name="num" value="<%=dto.getNum() %>" />
    <!-- 작성자 아이디의 경우 session영역에 저장된 정보로 사용할것임 -->
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" value="<%= dto.getName()%>"/>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"><%= dto.getContent()%></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>

