%--
/**
 * <pre>
 * 1. 프로젝트명 : Operator2.jsp
 * 2. 작성일 : 2022. 5. 31. 오후 5:07:22
 * 3. 작성자 : mite88
 * 4. 설명 : 표현 언어(EL) - 연산자2
 * </pre>
 */
--%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num2", "10");

pageContext.setAttribute("nullStr", null);
pageContext.setAttribute("emptyStr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList());
%>    
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 연산자</title></head>
<body>
	<!-- null,빈문자, 길이가 0인 컬렉션이나, 크기가 0인 경우(빈값) empty연산자는 true를 반환함 -->
    <h3>empty 연산자</h3>   
    empty nullStr : ${ empty nullStr } <br />
    empty emptyStr : ${ empty emptyStr } <br />
    empty lengthZero : ${ empty lengthZero } <br />
    empty sizeZero : ${ empty sizeZero }
    
    <h3>삼항 연산자</h3>
    num1 gt num2 ? "참" : "거짓" => ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }
    
	<!-- EL에선 null이 0으로 판단함 -->
    <h3>null 연산</h3>
    null + 10 : ${ null + 10 } <br />
    nullStr + 10 : ${ nullStr + 10 } <br />
    param.noVar > 10 : ${ param.noVar > 10 }
</body>
</html>