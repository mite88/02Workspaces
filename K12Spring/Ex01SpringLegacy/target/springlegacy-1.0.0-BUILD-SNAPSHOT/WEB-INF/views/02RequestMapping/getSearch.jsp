<%--
/**
 * <pre>
 * 1. 프로젝트명 :  views/02RequestMapping/getSearch.jsp
 * 2. 작성일 : 2022. 7. 11. 오후 2:46:14
 * 3. 작성자 : mite88
 * 4. 설명 : @RequestMapping 어노테이션 GET 전송된 검색 파라미터
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>@RequestMapping 어노테이션</title>
</head>
<body>
	<h2>@RequestMapping 어노테이션</h2>
	<h3>GET방식으로 전송된 검색 파라미터</h3>
	<ul>
		<li>검색필드 : ${sColumn }</li>
		<li>검색단어 : ${sWord }</li>
	</ul>

</body>
</html>