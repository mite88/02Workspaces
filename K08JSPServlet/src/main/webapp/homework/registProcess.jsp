<%--
/**
 * <pre>
 * 1. 프로젝트명 : registProcess.jsp
 * 2. 작성일 : 2022. 5. 28. 오후 2:12:01
 * 3. 작성자 : home
 * 4. 설명 : 회원가입 프로세서
 * </pre>
 */
--%>
<%@page import="utils.JSFunction"%>
<%@page import="homework.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email_str = request.getParameter("email1")+"@"+request.getParameter("email2");  //이메일
	String mobile_str = request.getParameter("mobile1")
					+"-"+request.getParameter("mobile2")
					+"-"+request.getParameter("mobile3");  //폰전화
	
	String tel_str = request.getParameter("tel1")
					+"-"+request.getParameter("tel2")+"-"
					+request.getParameter("tel3"); ;//일반전화
					
	MembershipDTO dto = new MembershipDTO();
	dto.setUserid(request.getParameter("userid"));
	dto.setPass(request.getParameter("pass1"));
	dto.setName(request.getParameter("name"));
	dto.setGender(request.getParameter("gender"));
	dto.setBirthday(request.getParameter("birthday"));
	dto.setZipcode(request.getParameter("zipcode"));
	dto.setAddress1(request.getParameter("address1"));
	dto.setAddress2(request.getParameter("address2"));
	dto.setMoblie(mobile_str);
	dto.setEmail(email_str);
	if(tel_str.length() >= 3 ){
		//내용존재시만 넣기위한거
		dto.setTel(tel_str);
	}
	
	MembershipDAO dao = new MembershipDAO(application); 
	
	int result = dao.memberInsert(dto);
	
	dao.close(); //자원해제
	
	if(result ==1){
		JSFunction.alertLocation("가입성공", "memberLogin.jsp", out);
	}else{
		JSFunction.alertBack("가입실패",  out);
	}
	
	
%>