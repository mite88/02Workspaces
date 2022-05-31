<%--
/**
 * <pre>
 * 1. 프로젝트명 : CollectionUse.jsp
 * 2. 작성일 : 2022. 5. 31. 오후 4:34:53
 * 3. 작성자 : mite88
 * 4. 설명 : 표현 언어(EL) - 컬렉션
 * </pre>
 */
--%>
<%@page import="common.Person"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 컬렉션</title>
</head>
<body>

	<h2>List 컬렉션</h2>
	<%
	//List컬렉션을 Object기반으로 생성
	//* 권장사항은 아니지만 타입을 빼도 되긴함 
	List<Object> aList = new ArrayList<Object>();
	aList.add("청해진");//String객체
	aList.add(new Person("장보고", 28));//Person객체
	pageContext.setAttribute("Ocean", aList);//page영역에 저장함
	%>
	
	<ul>
		<li>0번째 요소 : ${Ocean[0]}</li>
		<li>1번째 요소 : ${Ocean[1].name}, ${Ocean[1].age}</li>
		<li>2번째 요소 : ${Ocean[2]}</li> <!-- EL은 기본적예외는 발생되지않아 에러는 안남 -->
	</ul>
	
	<h2>Map 컬렉션</h2>
	<%
	Map<String, String> map = new HashMap<String, String>();
	map.put("한글", "훈민정음"); //한글을 key값으로 저장
	map.put("Eng", "English"); //영문을 key값으로 저장
	pageContext.setAttribute("King", map); //page영역에 저장함
	%>
	
	<ul>
		<!-- 
		한글로 key 값을 지정하면 .(점)으로 출력할수 없음 
		 -->
		<li>영문 key : ${King["Eng"]},  ${King['Eng']},  ${King.Eng}</li>
		<li>한글 key : ${King["한글"]},  ${King['한글']},  \${King.한글}</li>
	</ul>

</body>
</html>