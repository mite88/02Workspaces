<%--
/**
 * 1. 프로젝트명 : contact.jsp
 * 2. 작성일 : 2022. 6. 14. 오후 3:48:57
 * 3. 작성자 : mite88
 * 4. 설명 : 제휴게시판(이메일형)
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 14.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/jQuery/jquery-3.6.0.min.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<header>
		<jsp:include page="/layout/header.jsp" />
	</header>
	
	<jsp:include page="/layout/breadcrumbs.jsp"></jsp:include>

	<div class="container-fluid">
	
	</div>

	<jsp:include page="/layout/footer.jsp" />
</body>
</html>