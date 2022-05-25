<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - out</title>
</head>
<body>
<%
out.print("출력되지 않는 텍스트");
//버퍼에 저장된 내용이 삭제되어 이전내용이 출력되지 않는다
out.clearBuffer(); 

out.print("<h2>out 내장 객체</h2>");

out.print("출력 버퍼의 크기 : "+out.getBufferSize()+"<br>");
out.print("남은 버퍼의 크기 : "+out.getRemaining()+"<br>");

//버퍼에 저장된 내용을 플러쉬(출력)함
out.flush();
out.print("flush 후 버퍼의 크기 : "+out.getRemaining()+"<br>");

out.print(1);
out.print(false);
out.print('가');
%>
</body>
</html>