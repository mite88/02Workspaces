<%--
/**
 * 1. 프로젝트명 : AnnoMapping.jsp
 * 2. 작성일 : 2022. 6. 3. 오후 5:06:50
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- AnnoMapping.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AnnoMapping.jsp</title>
</head>
<body>
	<h2>애너테이션으로 매핑하기</h2>
	<p>
		<strong>${message}</strong>
		<br />
		<!-- 요청명을 컨텍스트 루트 경로까지 포함하여 링크 생성 -->
		<a href="<%= request.getContextPath()%>/13Servlet/AnnoMapping.do">바로가기</a>
	</p>
</body>
</html>