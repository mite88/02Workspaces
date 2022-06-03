<%--
/**
 * 1. 프로젝트명 : core/ForEachNormal.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 2:57:43
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- core/ForEachNormal.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 1</title>
</head>
<body>

	<!-- 
	foEach태그의 일반 for문 형태
	begin : 시작값
	end : 마지막값 
	step : 증가값 (제외시 1)
    var : 변수명
	 -->
	<h4>일반 for문 형태의 forEach 태그</h4>
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${i}입니다.</p>
	</c:forEach>

	<!-- 
	varStatus속성
	반복과 관련된 정보를 추상화한 클래스를 통해 정보반환
	
	count : 실제 반복횟수(1~마지막)
	index : 변수i의 변화하는 값
	first : loop의 처음일때 true 반환. 나머지는 false 반환
	last : loop의 마지막일때 true 반환. 나머지는 fasle 반환
	current : 현재 loop의 변수값(var속성에 지정된 변수)
	 -->
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
		<c:forEach begin="3" end="5" var="i" varStatus="loop">
			<tr>
				<td>count : ${loop.count}</td>
				<td>index : ${loop.index}</td>
				<td>current : ${loop.current}</td>
				<td>first : ${loop.first}</td>
				<td>last : ${loop.last}</td>
			</tr>
		</c:forEach>
	</table>

	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<c:forEach begin="1" end="100" var="j">
		<c:if test="${j mod 2 ne 0}">
			<c:set var="sum" value="${sum + j}" />
		</c:if>
	</c:forEach>
	1~100 사이의 정수 중 홀수의 합은? ${sum}


	<h4>연습문제01</h4>
	<!-- 
	연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach문과 if문을 
	활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
	-->

	<c:forEach begin="1" end="5" var="i">
		<c:forEach begin="1" end="5" var="j">
				<c:if test="${i eq j}" var="result">1&nbsp;</c:if>
				<c:if test="${not result}" >0&nbsp;</c:if>

			<!-- c:choose>
				<c:when test="${i eq j}">1&nbsp;</c:when>
				<c:otherwise>0&nbsp;</c:otherwise>
			</c:choose-->
			
		</c:forEach>
		<br/>
	</c:forEach>

</body>
</html>