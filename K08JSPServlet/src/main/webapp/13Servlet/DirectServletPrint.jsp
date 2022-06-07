<%--
/**
 * 1. 프로젝트명 : DirectServletPrint.jsp
 * 2. 작성일 : 2022. 6. 7. 오전 9:33:25
 * 3. 작성자 : mite88
 * 4. 설명 : 
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
<title>DirectServletPrint.jsp</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 Servlet에서 직접 출력하기</h2>
	<!-- 컨텍스트 루트 경로를 제외한 상대 경로로 링크 생성 -->
	<form action="../13Servlet/DirectServletPrint.do" method="post">
		<input type="submit" value="바로가기" />
	</form>
</body>
</html>