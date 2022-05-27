<%--
/**
 * 1. 프로젝트명 : ParamForward.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 2:47:28
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
<title>액션태그 - param</title>
</head>
<body>
	<!-- request 영역에 저장된 person자바빈 가져옴 -->
    <jsp:useBean id="person" class="common.Person" scope="request" /> 
    <h2>포워드된 페이지에서 매개변수 확인</h2>
    <ul>
    	<!-- request영역을 통해 공유된 person객체와 파라미터로
    	전달된 값을 화면에 출력함 -->
        <li><jsp:getProperty name="person" property="name" /></li> 
        <li>나이 : <jsp:getProperty name="person" property="age" /></li>
        <li>본명 : <%= request.getParameter("param1") %></li> 
        <li>출생 : <%= request.getParameter("param2") %></li>
        <li>특징 : <%= request.getParameter("param3") %></li>
    </ul>
    <jsp:include page="inc/ParamInclude.jsp">
        <jsp:param name="loc1" value="강원도 영월" />
        <jsp:param name="loc2" value="김삿갓면" />
    </jsp:include>
</body>
</html>