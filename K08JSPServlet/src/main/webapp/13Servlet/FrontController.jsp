<%--
/**
 * 1. 프로젝트명 : FrontController.jsp
 * 2. 작성일 : 2022. 6. 7. 오전 10:00:34
 * 3. 작성자 : mite88
 * 4. 설명 : 한번의 매핑으로 여러 가지 요청 처리하기
 * ========================================================
 * 수정일         작성자             내용      
 * ========================================================
 *  
 * ========================================================
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController.jsp</title>
</head>
<body>
	<h3>한번의 매핑으로 여러 가지 요청 처리하기</h3>
	${resultValue}
	<ol>
		<li>URI : ${uri}</li>
		<li>요청명 : ${commandStr}</li>
	</ol>
	
	<!-- 요청명을 일괄적으로 .one로 끝나는 형태로 생성 후 링크 -->
	<ul>
		<li> <a href="../13Servlet/regist.one">회원가입</a> </li>
		<li> <a href="../13Servlet/login.one">로그인</a> </li>
		<li> <a href="../13Servlet/freeboard.one">자유게시판</a> </li>
	</ul>
</body>
</html>