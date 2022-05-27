<%--
/**
 * 1. 프로젝트명 : ForwardSub.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 1:02:15
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 27.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - forward</title>
</head>
<body>
	<h2>포워드 결과</h2>
	<ul>
		<li>page 영역 : <%= pageContext.getAttribute("pAttr") %></li>
		<li>request 영역 : <%= request.getAttribute("rAttr") %></li>
	</ul>
</body>
</html>