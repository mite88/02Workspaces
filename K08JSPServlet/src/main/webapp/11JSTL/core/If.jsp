<%--
/**
 * 1. 프로젝트명 : If.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 12:16:42
 * 3. 작성자 : mite88
 * 4. 설명 : JSTL - if
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- If.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - if</title>
</head>
<body>
	<!--
	if태그 : 조건확인하여 실행여부 판단
	test : EL을 이용한 조건식
	var :결과값
	-->
	<!-- 변수 선언 -->
	<c:set var="number" value="100" />
	<c:set var="string" value="JSP" />

	<h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
	<c:if test="${number mod 2 eq 0}" var="result">
		${number}는 짝수입니다. <br />
	</c:if>
	result : ${result}
	<br />

	<!-- 조건이 여러개라면 다음예제의 choose태그를사용하자 -->
	<h4>문자열 비교와 else 구문 흉내내기</h4>
	<!-- 
	eq : java에서 비교연산자인 ==, equles()가 모두 가능함
	(compareTo()와 같이 사전순으로 비교함) 
	-->
	<c:if test="${string eq 'java'}" var="result2">
		문자열은 Java입니다. <br />
	</c:if>
	<c:if test="${not result2}">
		'Java'가 아닙니다. <br />
	</c:if>

	<h4>조건식 주의사항</h4>
	<c:if test="100" var="result3">
		EL이 아닌 정수를 지정하면 false <br />
	</c:if>
	result3 : ${result3}
	<br />

	<c:if test="tRuE" var="result4">
		대소문자 구문없이 "tRuE"인 경우 true<br />
	</c:if>
	result4 : ${result4}
	<br />

	<c:if test=" ${true} " var="result5">
		EL 양쪽에 빈 공백이 있는 경우 false<br />
	</c:if>
	result5 : ${result5}
	<br />


	<h4>연습문제 : if태그</h4>
	<!-- 
	아이디, 패스워드를 입력후 submit 한후 EL식을 통해 파라미터로 받은후
	"kosmo", "1234" 인 경우에는 "kosmo님 하이룽~" 이라고 출력한다. 

	만약 틀렸다면 "아이디와 비번을 확인하세요" 를 출력한다. 
	EL과 JSTL의 if태그만을 이용해서 구현하시오.
	 -->
	<form method="get">
		아이디 : <input type="text" name="user" /> <br /> 패스워드 : <input
			type="text" name="pass" /> <br /> <input type="submit" value="로그인" />
	</form>

	<!-- 최초실행시엔 파라미터가 없으므로 출력안되야함 -->
	<c:if test="${not empty param.user }">
		<!-- 아이디/비번 일치 시 -->
		<c:if test="${param.user eq 'kosmo' && param.pass eq '1234'}" var="result">
			"kosmo님 하이룽~" <br />
			</c:if>
	
		<!-- 아이디/비번  불일치 시 -->
		<c:if test="${not result}" >
			아이디와 비번을 확인하세요 <br />
		</c:if>
	</c:if>

</body>
</html>