<%--
/**
 * 1. 프로젝트명 : etc/Fmt1.jsp
 * 2. 작성일 : 2022. 6. 3. 오전 10:34:49
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- etc/Fmt1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 1</title>
</head>
<body>
	<!-- 
		국제화(Formatting)태그
		국가별 언어, 날짜, 시간 , 숫자형식 설정시 사용
		접두어는 fmt
	 -->
	<h4>숫자 포멧 설정</h4>
	<c:set var="number1" value="12345"/>
	<!-- 
		groupingUsed : 세자리마다 콤마를 출력함(디폴트 true)
	 -->
	콤마 O : <fmt:formatNumber value="${number1}"/>
	콤마 X : <fmt:formatNumber value="${number1}" groupingUsed="false"/>
	
	<!-- 
	type 속성
    - number : 숫자 형식으로 출력(기본값)
    - percent : %형식으로 출력
    - currency : 통화 형식으로 출력

	currencySymbol
    - 통화 출력시 사용할 기호 표시 (type이 currency 일때 의미 있음)
    - 미 지정시 현지 통화 심벌로 출력(한국 : \)
	 -->
	<fmt:formatNumber value="${number1}" type="currency" 
	var="printNum1" currencySymbol="$"/>
	통화기호 : ${printNum1}
	<!-- value속성값을 %다누이로 변환하여 출력함 -->
	<fmt:formatNumber value="0.03" type="percent" var="printNum2"/>
	퍼센트 : ${printNum2}
	
	<h4>문자열을 숫자로 변경</h4>
	<!-- 
	Integer.parseInt()와 같은 기능으로 문자열을 숫자로 변환
	pattern : 반환할 문자열의 패턴지정
	integerOnly : 소수점이하 절삭
	 -->
	<c:set var="number2" value="6,789.01"/>
	<!-- 
	pattern으로 주어진 부분을 분석하여 문자열을 숫자형으로 파싱함
	 -->
	<fmt:parseNumber value="${number2}" pattern="00,000.00" var="printNum3"/>
	소수점까지 :  ${printNum3}
	<fmt:parseNumber value="${number2}" integerOnly="true" var="printNum4"/>
	정수부분만 :  ${printNum4}
</body>
</html>