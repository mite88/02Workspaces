<%--
/**
 * <pre>
 * 1. 프로젝트명 : FormResult.jsp
 * 2. 작성일 : 2022. 5. 31. 오후 1:05:21
 * 3. 작성자 : mite88
 * 4. 설명 : EL - 폼값처리 결과
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 폼값처리</title>
</head>
<body>
<!-- 
폼값이 파라미터를 받을때 EL내장객체 사용
param :  단일값
paramValues : 2개이상 (배열)
 -->
	<h3>EL로 폼값 받기</h3>
	<ul>
		<li>이름 ${param.name}</li>
		<li>성별 ${param.gender}</li>
		<li>학력 ${param.grade}</li>
		<li>
			<!-- checkbox의 경우 체크한 값만 넘어오고 NullpointException 발생안함 -->
			관심사항
			${paramValues.inter[0] }
			${paramValues.inter[1] }
			${paramValues.inter[2] }
			${paramValues.inter[3] }
		</li>
	</ul>
	
	<h3>JSP내장객체를 통해 폼값 받기</h3>
	<%
	String name = request.getParameter("name");
	String[] interArr = request.getParameterValues("inter");
	
	//관심사항의 경우 1개 만 체크하면 interArr[1]은 에러가 남
	out.print("이름:"+name+"<br>");
	out.print("관심사항1:"+interArr[0]+"<br>");
	out.print("관심사항2:"+interArr[1]+"<br>");
	%>
</body>
</html>