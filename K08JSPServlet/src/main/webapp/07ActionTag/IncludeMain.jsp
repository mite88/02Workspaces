<%--
/**
 * 1. 프로젝트명 : IncludeMain.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 12:16:16
 * 3. 작성자 : mite88
 * 4. 설명 : 지시어와 액션 태그 동작 방식 비교
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 27.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//외부파일의 경로를 변수로 설정
String outerPath1 = "./inc/OuterPage1.jsp";
String outerPath2 = "./inc/OuterPage2.jsp";

//page영역 및 request 영역의 속성 저장함
pageContext.setAttribute("pAttr", "동명왕");
request.setAttribute("rAttr", "온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어와 액션 태그 동작 방식 비교</title>
</head>
<body>
	<h2>지시어와 액션 태그 동작 방식 비교</h2>

	<h3>지시어로 페이지 포함하기</h3>
	<!-- include 지시어를 쓸경우 변수형으론 쓸수없음 -->
	<%@ include file="./inc/OuterPage1.jsp"%>

	<!-- 
	지시어를 통한 include는 포함할 파일의 소스 그대로 현 문서에 포함 후
	컴파일이 진행되어 해당변수가 정상적으로 출력됨
	 -->
	<p>
		외부 파일에 선언한 변수 : <%=newVar1%></p>

	<h3>액션 태그로 페이지 포함하기</h3>
	<!-- 액션태그로 할땐 둘다 사용가능함 -->
	<jsp:include page="./inc/OuterPage2.jsp" />
	<jsp:include page="<%=outerPath2%>" />

	<!-- 
		액션태그를 통해 include시 파일을 먼저 컴파일 후 결과를
		해당 문서에 포함시키므로 아래의 변수가 정성적으로 출력되지 않음
	 -->
	<p>
		외부 파일에 선언한 변수 : <%-- newVar2 --%>
	</p>
	
</body>
</html>