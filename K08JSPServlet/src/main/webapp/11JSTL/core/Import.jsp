<%--
/**
 * 1. 프로젝트명 : Import.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 5:33:29
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - import</title>
</head>
<body>
	<!-- 
	import 태그
	include 액션태그와 같은 기능으로 request영역을 공유
	url속성에 절대 경로로 지정할 경우 컨텍스트 루트명은 포함되지 않음
	 -->

	<!--request 영역에 변수 저장 -->
	<c:set var="requestVar" value="MustHave" scope="request" />
	<!-- 
	var속성 
	미사용 : 해당위치 즉시 포함
	사용 : var에 지정된 변수를 EL로 출력하는곳에 포함
	(선언과 출력 별도로 할수 있음)
	 -->

	<!-- 
	 import태그의 하위 태그로 param사용
	 지정된 페이지로 파라미터 전달
	  -->
	<c:import url="/11JSTL/inc/OtherPage.jsp" var="contents">
		<c:param name="user_param1" value="JSP"></c:param>
		<c:param name="user_param2" value="기본서"></c:param>
	</c:import>

	<!-- 앞에서 사용한 import태그의 var속성의 변수출력 -->
	<h4>다른 문서 삽입하기</h4>
	${contents}

	<!-- http로 시작하는 외부 url 삽입 -->
	<h4>외부 문서 삽입하기</h4>
	<iframe src="../inc/GoldPage.jsp" style="width: 100%; height: 600px">
	</iframe>
</body>
</html>