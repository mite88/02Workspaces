<%--
/**
 * 1. 프로젝트명 : core/ForEachExtend2.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 2:57:43
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- core/ForEachExtend2.jsp -->
<%@page import="common.Person"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 2</title>
</head>
<body>
	<h4>List 컬랙션 사용하기</h4>
	<%
	LinkedList<Person> lists = new LinkedList<Person>();
	lists.add(new Person("맹사성", 34));
	lists.add(new Person("장영실", 44));
	lists.add(new Person("신숙주", 54));
	%>
	<c:set var="lists" value="<%= lists%>"/>
	<c:forEach items="${lists}" var="list" >
		<li>이름:${list.name}, 나이:${list.age}</li>
	</c:forEach>
	
	<h4>Map 컬랙션 사용하기</h4>
	<%
	Map<String, Person> maps = new HashMap<String, Person>();
	maps.put("1st", new Person("맹사성", 34));
	maps.put("2nd",new Person("장영실", 44));
	maps.put("3rd", new Person("신숙주", 54));
	%>
	<c:set var="maps" value="<%= maps%>"/>
	<c:forEach items="${maps}" var="map" >
		<li>
		keys => ${map.key}
		Value => ${map.value.name}, 나이:${map.value.age}
		</li>
	</c:forEach>
	
	<h4>Java코드를 통한 출력</h4>
	<%
	//Map컬렉션은 항상 key값을 얻어와야함
	Set<String> keys = maps.keySet();
	
	//앞에서 얻은 key의 갯수만큼 출력
	for(String k : keys){
		//key값을 통해 해당 객체 얻기
		Person p = maps.get(k);
		out.print("keys =>"+k+"<br>");
		out.print("Value =>"+p.getName()+", "+p.getAge()+"<br>");
	}
	
	/*
	JSTL의 확장for문 사용시 key값을 별도로 얻어오지 않아도됨
	*/
	%>
</body>
</html>