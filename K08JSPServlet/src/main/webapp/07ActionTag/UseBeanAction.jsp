<%--
/**
 * 1. 프로젝트명 : UseBeanAction.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 2:50:10
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - useBean</title>
</head>
<body>
    <h3>액션 태그로 폼값 한 번에 받기</h3>
    <!-- 
    폼값을 전송하는 페이지에서 input태그의 name속성과 DTO객체의
    맴버변수명이 일치
    값 설정을 위한 getter/setter메서드가 정의되어야함
     -->
    <jsp:useBean id="person" class="common.Person" />
    <jsp:setProperty property="*" name="person" />  
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name" /></li>  
        <li>나이 : <jsp:getProperty name="person" property="age" /></li> 
    </ul>

</html>