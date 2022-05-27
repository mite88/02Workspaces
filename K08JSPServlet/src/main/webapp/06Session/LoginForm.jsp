<%--
/**
 * 1. 프로젝트명 :  LoginForm.jsp
 * 2. 작성일 : 2022. 5. 27 오전 09:31
 * 3. 작성자 : mite88
 * 4. 설명 :  로그인페이지
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 26.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
    <h2>로그인 페이지</h2>
    <!-- 삼항연산자로 request영역에 저장된 
    속성값이 존재할때 에러메세지 출력하도록 함 -->
    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    if (session.getAttribute("UserId") == null) {
    	//session영역에 속성값이 없으면 로그아웃상태임
    	//그래서 로그인폼에 화면이 출력되야함
    %>
    <script>
    //로그인 폼 입력값 검증을 위한 함수
    function validateForm(form) {
        if (!form.user_id.value) {
            alert("아이디를 입력하세요.");
            form.user_id.focus();
            return false;
        }
        if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            form.user_pw.focus();
            return false;
        }
    }
    </script>
    
    <!-- 
    폼값 체크를 위한 validateForm()함수 호출시 from태그의 DOM객체를
    this을 통해 전달함
     -->
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pw" /><br />
        <input type="submit" value="로그인하기" />
    </form>
    <%
    } else { 
    	//session영역에 값 존재시 로그인 생태
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
        <a href="Logout.jsp">[로그아웃]</a>
    <%
    }
    %>
</body>
</html>