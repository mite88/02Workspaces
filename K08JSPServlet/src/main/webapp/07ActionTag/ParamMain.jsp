<%--
/**
 * 1. 프로젝트명 : ParamMain.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 2:47:16
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
<%
request.setCharacterEncoding("UTF-8");
String pValue =	"방랑시인";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - param</title>
</head>
<body>
	<!-- 자바빈 생성 : request영역에 저장 -->
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<!-- 값설정 -->
	<jsp:setProperty property="name" name="person" value="김삿갓"/>
	<jsp:setProperty property="age" name="person" value="56"/>
	
	<!-- 포워드. 포워드시 파리미터전달 -->
	<!-- 쿼드 스트링으로 param1 전달, 액션태그로 2개 전달 -->
	<!-- 
	시작태그와 종료태그로 나눠서 사용하는경우 태그사이에 
	html주석을 기술하면 에러남
	 -->
	<jsp:forward page="ParamForward.jsp?param1=김병연">
		<jsp:param value="경기도 양주" name="param2"/>
		<jsp:param value="<%= pValue %>" name="param3"/>
	</jsp:forward>
</body>
</html>