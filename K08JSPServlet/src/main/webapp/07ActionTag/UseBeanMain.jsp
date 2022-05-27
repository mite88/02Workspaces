<%--
/**
 * 1. 프로젝트명 : UseBeanMain.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 2:35:01
 * 3. 작성자 : mite88
 * 4. 설명 : 액션태그 - useBean<
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 27.    mite88   
 */
--%>
<%-- <%@page import="common.Person"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - useBean</title>
</head>
<body>
    <h2>useBean 액션 태그</h2>
    <h3>자바빈즈 생성하기</h3>
    <!-- 
    id=참조변수명
    class=패키지를포함한 클래스명
    scope="저장영역
     -->
    <jsp:useBean id="person" class="common.Person" scope="request" />
	<%-- <%
		//Java DTO클래스로 하는법 
		Person person2 = new Person();
		person2.setName("홍길동");
		person2.setAge(20);
		request.setAttribute("person2", person2);
	%> --%>

    <h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
    <jsp:setProperty name="person" property="name" value="임꺽정" /> 
    <jsp:setProperty name="person" property="age" value="41" /> 

    <h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name" /></li> 
        <li>나이 : <jsp:getProperty name="person" property="age" /></li> 
    </ul>
</body>


</html>