<%--
/**
 * 1. 프로젝트명 : Catch.jsp
 * 2. 작성일 : 2022. 6. 3. 오전 10:15:15
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- Catch.jsp -->
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - Catch</title>
</head>
<body>
	<!-- 
		Catch태그
		EL, JSP에서 발생한 예외 처리시 사용
		에러 내용을 원하는 위치에 출력가능
		(JSTL문법 오류는 안됨 ㅇㅊㅇ)
	 -->
	<h4>자바 코드에서의 예외</h4>
	<%
	int num1= 100;
	%>
	<c:catch var="eMessage">
		<%
		//0으로 나눌수 없음
		int result = num1 / 0;
		%>
	</c:catch>
	
	예외내용 : ${eMessage}
	
	<h4>EL에서의 예외</h4>
	<c:set var="num2" value="200"/>
	<!-- EL에선 + 기호가 뎃셈연산에만 사용되므로 해당 식은 예외 -->
	<c:catch var="eMessage">
		${"일"+num2}
	</c:catch>
	예외내용 : ${eMessage}
</body>
</html>