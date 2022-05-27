<%--
/**
 * 1. 프로젝트명 : inc/OuterPage2.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 12:04:49
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
<title>OuterPage</title>
</head>
<body>
	<h2>외부파일2</h2>
	<%
		String newVar2 = "백제 온조왕";
	%>
	<ul>
		<li>page 영역 속성 : <%=pageContext.getAttribute("pAttr") %></li>
		<li>request 영역 속성 : <%=request.getAttribute("rAttr") %></li>
	</ul>
</body>
</html>