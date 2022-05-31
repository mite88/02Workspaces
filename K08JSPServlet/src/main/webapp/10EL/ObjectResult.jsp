<%--
/**
 * <pre>
 * 1. 프로젝트명 : ObjectResult.jsp
 * 2. 작성일 : 2022. 5. 31. 오후 1:15:51
 * 3. 작성자 : mite88
 * 4. 설명 : 표현 언어(EL) - 객체 매개 변수결과
 * </pre>
 */
--%>
<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 객체 매개 변수</title>
</head>
<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<ul>
		<!-- 
		영역에 저장된 속성에 EL로 접근시 속성명이 다르다면  EL내장객체없이 접근가능 
		 -->
		 
		 <!-- 
		 "속성명.멤버변수" 형태로 기술시 객체에 선언한 getter()를 자동으로 호출하여 값 출력
		  -->
		<li>Person 객체 => 이름${personObj.name }, 나이${personObj.age }</li>
		<!-- 영역인 requestScope 생략가능 -->
		<li>String 객체 => ${requestScope.stringObj }</li>
		<li>Integer 객체 => ${integerObj }</li>
	</ul>
	
	<!--  <h2>JSP내장객체를 통한 영역 값 읽기</h2>
	<%
	//내장객체 영역은 Object형으로 저장
	Object obj = request.getAttribute("personObj");
	//영역에서 객체를 꺼낸 후 사용시 원래 타입으로 형변환함
	Person person = (Person)obj;
	
	//출력을 위해 getter() 함
	out.print("이름:"+person.getName()+"<br>");
	%>
	나이:<%= person.getAge()%>
	-->
	
	<h2>매개변수로 전달된 값 읽기</h2>
	<ul>
		<!-- 
		param.파라미터명
		param.['파라미터명']
		param.["파라미터명"]
		 -->
	 	<!-- EL에선 산술연산이 가능하여 아래처럼 하면 30이 출력됨 -->
		<li>${param.firstNum + param['secondNum']}</li>
		<!-- 단순 출력이라 10+20으로 출력됨 -->
		<li>${param.firstNum} + ${param["secondNum"]}</li>
	</ul>
</body>
</html>