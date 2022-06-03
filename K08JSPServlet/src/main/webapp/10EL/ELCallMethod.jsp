<%--
/**
 * 1. 프로젝트명 : ELCallMethod.jsp
 * 2. 작성일 : 2022. 6. 2. 오전 9:50:31
 * 3. 작성자 : mite88
 * 4. 설명 : 표현 언어(EL) - 메서드 호출
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- ELCallMethod.jsp -->
<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//일반적인 메서드 사용을 위해 객체 생성후 영역에 저장함
MyELClass myClass = new MyELClass();
pageContext.setAttribute("myClass", myClass);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 메서드 호출</title>
</head>
<body>
	<h3>영역에 저장 후 메서드 호출하기</h3>
	001225-3000000 => ${myClass.getGender("001225-3000000")}<br/>
	001225-2000000 => ${myClass.getGender("001225-2000000")}
	
	<h3>클래스명을 통해 정적 메서드 호출하기</h3>
	<!-- 정적메서드의 경우는 별도의 처리 없이 클래스명으로 호출 -->
	${MyELClass.showGugudan(7)}
	
	<h3>JSP 코드를 통해 메서드 호출</h3>
	<%
	out.print(MyELClass.isNumber("백20") ? "숫자임" : "숫자아님");
	out.println("<br>");
	
	boolean isNumStr = MyELClass.isNumber("120");
	if(isNumStr == true){
		out.print("숫자임");
	}else{
		out.print("숫자아님");
	}
	%>
</body>
</html>