<%--
/**
 * 1. 프로젝트명 : core/Set2.jsp
 * 2. 작성일 : 2022. 6. 2. 오전 10:36:34
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!--core/Set2.jsp-->
<%@page import="common.Person"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 2</title>
</head>
<body>
	<h4>List 컬렉션 이용하기</h4>
	<%
	//Person 객체를 저장할수 있는 List계열의 컬렉션 생성
	ArrayList<Person> pList = new ArrayList<Person>();
	//List컬렉션에 객체 추가
	pList.add(new Person("성삼문", 55));
	pList.add(new Person("박팽년", 60));
	%>
	
	<!-- request영역에 컬렉션저장 -->
	<c:set var="personList" value="<%= pList %>" scope="request"/>
	<ul>
		
		<li>이름 : ${requestScope.personList[0].name}</li>
		<li>나이 : ${personList[0].age}</li>
	</ul>
	
	<h4>Map 컬렉션 이용하기</h4>
	<%
	//Map계열의 컬렉션 생성
	Map<String, Person> pMap = new HashMap<String, Person>();
	//객체 추가
	pMap.put("personArgs1" ,new Person("하위지", 65));
	pMap.put("personArgs2" ,new Person("이개", 67));
	%>
	
	<!-- request영역에 컬렉션저장 -->
	<c:set var="personMap" value="<%= pMap %>" scope="request"/>
	<ul>
		<!-- key값으로 접근함 -->
		<li>이름 : ${requestScope.personMap.personArgs2.name}</li>
		<li>나이 : ${personMap.personArgs2.age}</li>
	</ul>
</body>
</html>