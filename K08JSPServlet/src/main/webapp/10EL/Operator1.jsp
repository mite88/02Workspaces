<%--
/**
 * <pre>
 * 1. 프로젝트명 : Operator1.jsp
 * 2. 작성일 : 2022. 5. 31. 오후 5:07:22
 * 3. 작성자 : mite88
 * 4. 설명 : 표현 언어(EL) - 연산자1
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num1 = 3; //일반변수

//page영역에 속성값 저장
pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3", "5");
pageContext.setAttribute("num4", "8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 연산자</title>
</head>
<body>
	<h3>변수 선언 및 할당</h3>
	<!-- 
	EL 및 JSTL은 영역에 저장된 속성들을 이용하기때문에
	스크립트릿에서 선언된 변수는 사용할수 없음
	 -->
	스크립틀릿에서 선언한 변수 : ${ num1 } <br /><!-- 출력안됨 -->
	page 영역에 저장된 변수 :${num2}<br />
	<!-- EL에서도 변수를 할당할수는 있지만(Tomcat8이상지원) 방법이 이상하다.... -->
	변수 할당 및 즉시 출력 : ${num1=7 }<br /><!-- 일반적으로 선언하면 할당된 동시에 실행됨 -->
	변수 할당 및 별도 출력 :${num1=8;'' } => ${num2 }<br /><!-- 뒤에 ;''을 붙어야 할당 만 됨 -->
	num1 = ${num1 }, num2 = ${num2 }, num3 = ${num3 }, num4 = ${num4 }
	
	<h3>산술 연산자</h3>
	num1 +  num2 : ${num1 + num2}<br />
	num1 - num2 : ${num1 - num2}<br />
	num1 *  num2 : ${num1 * num2}<br />
	<!-- 
	나눗셈 및 나머지의 사용법
	* 자동형변환 되서 실수의 결과가 나올수도 있음
	 -->
	num1 /  num2 : ${num1 / num2}<br />
	num1 div  num2 : ${num1 div num2}<br />
	num1 %  num2 : ${num1 % num2}<br />
	num1 mod  num2 : ${num1 mod num2}
	
	<h3>+연산자는 덧셈만 가능</h3>
	<!-- 
	EL에서는 문자형과 덧셈할 수 없음-NumberFormatException(숫자형만됨), 
	덧셈연산만 가능하고 문자열 연결에는 사용되지않음 
	-->
	
	num1 + "34" : ${num1 + "34"}<br /><!-- 자동형변환되어 계산됨 -->
	num1 + "이십" : \${num1 + "이십"}<br />
	"삼십" + "사십" : \${"삼십" + "사십" } 
	
	<h3>비교 연산자</h3>
	num4 > num3 : ${num4 > num3}<br />
	num1 < num3 : ${num1 < num3}<br />
	num2 >= num4 : ${num2 >= num4}<br />
	num1 == num4 : ${num1 == num4}
	
	<h3>논리 연산자</h3>
	num3 <= num4 && num3 == num4 : ${num3 le num4 and num3 eq num4}<br />
	num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4}
</body>
</html>