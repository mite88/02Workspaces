<%--
/**
 * 1. 프로젝트명 : core/Set1.jsp
 * 2. 작성일 : 2022. 6. 2. 오전 10:35:48
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- core/Set1.jsp -->
<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 1</title>
</head>
<body>
	<!-- 
	set태그
	변수 선언시 사용
	JSP의 setAttribute()와 같은기능이고 , 4가지 영역에 새로운 속성 추가
	 -->
	<!-- 변수선언 (page영역에 저장)-->
	<c:set var="directVar" value="100"/> <!-- 일반적 -->
	<c:set var="elVar" value="${directVar mod 5}"/><!-- EL -->
	<c:set var="expVar" value="<%= new Date()%>"/><!-- JSP 표현식 -->
	<c:set var="betweenVar">변수값  요렇게 설정"</c:set><!-- 태그사이에 값넣기 -->
	
	<h4>EL을 이용하여 변수 출력</h4>
	<ul>
		<li>directVar : ${directVar}</li>
		<li>elVar : ${elVar}</li>
		<li>expVar : ${expVar}</li>
		<li>betweenVar : ${betweenVar}</li>
	</ul>
	
	<!-- 클래스 생성자를 통해 객체 생성후 request 영역에 저장 -->
	<h4>자바빈즈 생성 1 - 생성자 사용</h4>
	<ul>
		<c:set var="personVar1" value='<%= new Person("박문수", 50) %>' 
			scope="request"/>
		<!-- 자바빈즈의 getter()를 통해 멤버변수 값 출력 -->
		<li>이름 : ${requestScope.personVar1.name}</li>
		<li>나이 : ${personVar1.age}</li>
	</ul> 
	
	<!-- 빈객체 생성후  target, property를 통해 멤버변수 값 지정-->
	<h4>자바빈즈 생성 2- target, property 사용</h4>
	<ul>
		<c:set var="personVar2" value="<%= new Person()%>" scope="request"/>
		<c:set target="${personVar2}" property="name" value="정약용"/>
		<c:set target="${personVar2}" property="age" value="60"/>
		<li>이름 : ${personVar2.name}</li>
		<li>나이 : ${requestScope.personVar2.age}</li>
	</ul>
</body>
</html>