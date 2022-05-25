<%@ page import="java.util.Collection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//get방식으로 전송된 폼값을 날짜형식으로 변경함
/*
addDateHeader(헤더명, long타입의 타임스탬프)
:응답헤더 중 날짜 추가메서드로 세계표준시라서 +09(9시간)해야함
*/
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println("add_date=" + add_date);

//숫자형식으로 전송된  값을 정수로 변경
int add_int = Integer.parseInt(request.getParameter("add_int"));
//form태그를 통해 전송된 값
String add_str = request.getParameter("add_str");

/*
add계열 : 응답해더 값추가
set계열 : 기존의 응답값헤더값 수정
*/
response.addDateHeader("myBirthday", add_date);
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004);
response.addHeader("myName", add_str);
response.setHeader("myName", "안중근");
%>
<html>
<head>
<title>내장 객체 - response</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	//getHeaderNames()를통해얻으면 getHeader()엔 첫번째값만 나오게된다
	//이는 getHeader()의 특성임
	Collection<String> headerNames = response.getHeaderNames();
	for (String hName : headerNames) {
		String hValue = response.getHeader(hName);
	%>
	<li><%=hName%> : <%=hValue%></li>
	<%
	}
	%>

	<h2>myNumber만 출력하기</h2>
	<%
	/*
	myNumber라는헤더명으로 2개 값 추가했으므로
	아래의 각각의 값이 정상 출력됨
	*/
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
	<li>myNumber : <%=myNum%></li>
	<%
	}
	%>
</body>
</html>

