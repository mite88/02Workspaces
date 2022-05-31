<%--
/**
 * <pre>
 * 1. 프로젝트명 : ImplicitObjMain.jsp
 * 2. 작성일 : 2022. 5. 31. 오후 12:36:29
 * 3. 작성자 : home
 * 4. 설명 : EL내장객체
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 //4가지 영역에 동일한 속성명으로 각 다른값 저장함
 pageContext.setAttribute("scopeValue", "페이지영역");
 request.setAttribute("scopeValue", "리퀘스트영역");
 session.setAttribute("scopeValue", "세션영역");
 application.setAttribute("scopeValue", "애플리케이션영역");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) -  내장객체</title>
</head>
<body>
	<h2>ImplicitObjMain 페이지</h2>
	<h3>각 영역에 저장된 속성 읽기(JSP내장객체 사용)</h3>
	<ul>
		<li>페이지 영역 :  <%=pageContext.getAttribute("scopeValue") %></li>
		<li>리퀘스트 영역 :  <%=request.getAttribute("scopeValue") %></li>
		<li>세션 영역 :  <%=session.getAttribute("scopeValue") %></li>
		<li>애플리케이션 영역 : <%=application.getAttribute("scopeValue") %></li>
	</ul>
	
	<!-- 
	4가지 영역 접근시 EL내장객체를 통해 출력
	 -->
	<h3>각 영역에 저장된 속성 읽기(EL 사용)</h3>
	<ul>
		<li>페이지 영역 :  ${pageScope.scopeValue }</li>
		<li>리퀘스트 영역 :  ${requestScope.scopeValue }</li>
		<li>세션 영역 :  ${sessionScope.scopeValue }</li>
		<li>애플리케이션 영역 : ${applicationScope.scopeValue }</li>
	</ul>
	
	<!-- 
	영역명 지정없이 속성명을 읽어올 시 가장좁은 영역을 우선으로 출력함 
	(여기선 page영역, 실무에선 대부분 이와같이 사용함)
	 -->
	<h3>영역 지정 없이 속성 읽기</h3>
	<ul>
		<li>${scopeValue }</li>
	</ul>
	
	<jsp:forward page="ImplicitForwardResult.jsp"></jsp:forward>
</body>
</html>