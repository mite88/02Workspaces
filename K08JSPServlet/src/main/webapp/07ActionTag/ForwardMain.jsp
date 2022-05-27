<%--
/**
 * 1. 프로젝트명 : ForwardMain.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 1:02:05
 * 3. 작성자 : mite88
 * 4. 설명 : 액션태그 - forward
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 27.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//각영역에 속성값 저장함
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - forward</title>
</head>
<body>
	<h2>sendRedirect를 이용한 포워딩</h2>
	<%-- <%
	//페이지 이동의 경우 새로운 요청을 하는 것이라 완전 다른페이지로 이동
	response.sendRedirect("/07ActionTag/ForwardSub.jsp");
	%> --%>

	<h2>액션 태그를 이용한 포워딩</h2>
	<!-- 
	포워드시 request영역에 공유되며, 
	최초요청된 페이지 경로가 보이나, 사용자는 포워드된 페이지 내용을 봄 
	-->
	<%-- <jsp:forward page="/07ActionTag/ForwardSub.jsp"></jsp:forward> --%>
	
	<%
		request.getRequestDispatcher("ForwardSub.jsp").
		forward(request, response);
	%>
</body>
</html>