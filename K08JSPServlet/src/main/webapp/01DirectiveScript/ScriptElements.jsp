<%@page import="common.Myclass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	선언부(Declaration)
	스크립트릿이나 표현식에서 사용할 메서드 선언시 사용
	선언부에 선언된 메서드는 해당 jsp가 서블릿으로 변환시 멤버메서드 형태로
	선언됨
 --%>
<%!
	public int add(int num1, int num2){
		return num1+num2;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%-- 
 스크립트랫(Scriptlet)
 주로 JSP코드를 작성 및 실행시 사용
 body, head, 태그내부에도 사용가능
 여기서 기술된 코드는 _jspService()메서드 내에 포함됨
 그래서 메서드 선언불가함
--%>
<%
	int result = add(10, 20);
%>
<%--
표현식(Expression)
변수를웹브라우저상에 출력시 사용
주의 : 문장끝에 세미콜론 붙이면 안됨
 --%>
덧셈결과1 : <%= result %> <br />
덧셈결과2 : <%= add(30,40) %>

<h2>내가만든 java클래스의 메서드 출력</h2>
<%
	//해당메서드는 static라서 객체 생성없이 호출가능
	int sum = Myclass.myFunc(30, 40);
	System.out.println(sum);
%>
</body>
</html>