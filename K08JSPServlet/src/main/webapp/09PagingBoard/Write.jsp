<%--
/**
 * 1. 프로젝트명 : Write.jsp
 * 2. 작성일 : 2022. 5. 30. 오전 11:04:20
 * 3. 작성자 : mite88
 * 4. 설명 : 글쓰기폼
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 30.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!-- 글쓰기 페이지 진입 전 로그인 확인용 -->
<%@ include file="./IsLoggedIn.jsp"%>  
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
<h2>회원제 게시판 - 글쓰기(Write)</h2>

<!-- 처리시 반드시 post방식 사용할것 (get방식의 경우 전송의 제한이있음) -->
<form name="writeFrm" method="post" action="WriteProcess.jsp"
      onsubmit="return validateForm(this);">
    <!-- 작성자 아이디의 경우 session영역에 저장된 정보로 사용할것임 -->
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
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

