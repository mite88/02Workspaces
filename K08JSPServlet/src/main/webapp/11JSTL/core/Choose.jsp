<%--
/**
 * 1. 프로젝트명 : Choose.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 12:16:42
 * 3. 작성자 : mite88
 * 4. 설명 : JSTL - if
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- Choose.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - Choose</title>
</head>
<body>
	<!-- 
	choose태그
	하위에 when, otherwise태그를 가지고 있음
	여러 조건이 있을경우 사용
	 -->
	<!-- 변수 선언 -->
	<c:set var="number" value="100"/>
	
	<h4>choose 태그로 홀짝 판단하기</h4>
	<c:choose>
		<c:when test="${number mod 2 eq 0}">
			${number}는 짝수입니다
		</c:when>
		<c:otherwise>
			${number}는 홀수입니다
		</c:otherwise>
	</c:choose>
	
	<h4>국,영,수 점수를 입력하면 평균을 내어 학점 출력</h4>
	
	<form action="">
		국어 : <input type="text" name="kor"/> <br />
		영어 : <input type="text" name="eng"/> <br />
		수학 : <input type="text" name="math"/> <br />
		
		<input type="submit" value="학점구하기" />
	</form>
	
	<!-- 실행초기에 폼값이 없는상태라 empty를 통해 파라미터존재여부 판단 -->
	<c:if test="${ not (empty param.kor and empty param.eng and empty param.math)}">
	<!-- 파라미터로 전달된 국,영,수 평균값을 avg로 전달 -->
	<c:set var="avg" value="${(param.kor+param.eng+param.math) / 3}" />
	
	
	평균 점수는 ${avg}으로 
	<c:choose>
		<c:when test="${avg >= 90}">A 학점</c:when>
		<c:when test="${avg >= 80}">B 학점</c:when>
		<c:when test="${avg ge 70}">C 학점</c:when>
		<c:when test="${avg ge 60}">D 학점</c:when>
		<c:otherwise>F 학점</c:otherwise>
	</c:choose>
	입니다.
	
	</c:if>
	
</body>
</html>