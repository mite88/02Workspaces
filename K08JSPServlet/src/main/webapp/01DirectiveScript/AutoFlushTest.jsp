<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1kb" autoFlush="false"%>
<!-- 
화면상의 내용 출력시 항상 버퍼에 먼저 저장함
buffer속성으로 버퍼 사용여부(용량)을 설정할 수 있고
autoFlush속성으로 버퍼가 찬 경우 내보내기 할지를 설정함
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - buffer, autoFlush 속성</title>
</head>
<body>
<%
	for(int i = 1; i<= 100; i++){
		out.println("abcde12345");
	}

/*
 for 문을 이용하여 10글자를 100번 반복하여 출력시
 1000byte가 됨
 
 여기서 html태그들이 있어서 용량을 초과하기에 실행시 에러가 발생한다
 이를 해결하기위해선 buffer 용량을 늘리거나,autoFlush 속성을 true 하면됨
*/

%>
</body>
</html>