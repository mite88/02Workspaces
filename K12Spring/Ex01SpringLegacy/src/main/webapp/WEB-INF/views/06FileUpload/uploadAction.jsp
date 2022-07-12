<%--
/**
 * <pre>
 * 1. 프로젝트명 : 06FileUpload/uploadAction.jsp
 * 2. 작성일 : 2022. 7. 12. 오후 2:38:52
 * 3. 작성자 : mite88
 * 4. 설명 : 
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2></h2>
		<a href="./uploadForm.do">파일 업로드 폼 바로가기 </a>
		<!-- model객체에 저장된 갯수만큼 반복출력함 -->
		<c:forEach items="${resultList}" var="fmap" varStatus="vs">
			<ul>
				<li>No${vs.count}</li>
				<li>제목 : ${fmap.title }</li>
				<li>원본파일명 : ${fmap.originalName }</li>
				<li>저장된파일명 : ${fmap.saveFileName }</li>
				<li><img src="<%= request.getContextPath() %>/resources/upload/${fmap.saveFileName}"
					width="200"></li>
			</ul>
		</c:forEach>
	</div>
</body>
</html>