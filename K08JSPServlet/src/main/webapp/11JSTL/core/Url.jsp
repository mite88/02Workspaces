<%--
/**
 * 1. 프로젝트명 : core/Url.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 5:58:59
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- core/Url.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - Url</title>
</head>
<body>
	<!-- 
		url태그
		url생성시 사용
		절대경로 생성시 컨텍스트 루트 경로 제외
		var속성 미지정시 해당 위치에 즉시 url 출력됨
		param태그로 지정한 값은 쿼리스트링으로 연결됨
	 -->
	<h4>Url태그로 링크 걸기</h4>
	<c:url value="/11JSTL/inc/OtherPage.jsp" var="url">
		<c:param name="user_param1" value="Must"/>
		<c:param name="user_param2">Have</c:param>
	</c:url>
	
	<a href="${url}">OtherPage.jsp 바로가기</a>
</body>
</html>