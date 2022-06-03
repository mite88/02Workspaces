<%--
/**
 * 1. 프로젝트명 : core/ForEachExtend1.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 2:57:43
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- core/ForEachExtend1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 1</title>
</head>
<body>
	<!-- 
	forEach 태그의 향상된 for문 형태
	주로 배열이나 컬렉션에서 순차적으로 값에 접근시사용
	
	items : 사용할 배열 or 컬렉션변수
	var : 해당 loop에서 반환한 객체 저장 변수
	 -->
	<h4>향상된 for문 형태의 forEach 태그</h4>
	<%
	String[] rgba = {"Red", "Green","Blue","Black"};
	%>
	<c:forEach items="<%= rgba %>" var="c" >
		<span style="color:${c};">${c}</span>
	</c:forEach>
	
	<!-- 
	varStatust속성
	
	count : 실제 반복횟수(1~마지막)
	index : 변수i의 변화하는 값(0부터 시작)
	first : loop의 처음일때 true 반환. 나머지는 false 반환
	last : loop의 마지막일때 true 반환. 나머지는 fasle 반환
	current : 현재 loop의 변수값(var속성에 지정된 변수)
	 -->
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<c:forEach items="<%= rgba %>"  var="c" varStatus="loop">
		<tr>
			<td>count : ${loop.count}</td>
			<td>index : ${loop.index}</td>
			<td>current : ${loop.current}</td>
			<td>first : ${loop.first}</td>
			<td>last : ${loop.last}</td>
		</tr>
	</c:forEach>
	</table>
	
</body>
</html>