<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- 
trimDirectiveWhitespaces="true" 를 해서 공백을 제거해준다 
지시어는 공백 하나를 나타내기 때문에 하지않으면 데이터가 있는것으로 인식하여
ajax시 제대로 작동하지 않을 수 있음
-->    
<%
String chkVal = request.getParameter("inactiveToday");

//chkVal가 null이아니고 1일때 쿠키생성함
if(chkVal != null && chkVal.equals("1")){
	Cookie cookie = new Cookie("PopupClose", "off");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(60*60*24); 
	response.addCookie(cookie); 
	out.println("쿠키 : 하루 동안 열지 않음");
}
%>