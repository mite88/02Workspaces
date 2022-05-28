<%--
/**
 * <pre>
 * 1. 프로젝트명 : loginProcess.jsp
 * 2. 작성일 : 2022. 5. 28. 오후 2:52:27
 * 3. 작성자 : home
 * 4. 설명 : 로그인 프로세서
 * </pre>
 */
--%>
<%@page import="java.util.List"%>
<%@page import="utils.JSFunction"%>
<%@page import="homework.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MembershipDAO dao = new MembershipDAO(application);

	String id = request.getParameter("userid");
	String pw = request.getParameter("passwd");
	
	
	List<MembershipDTO> array = dao.memberLogin(id, pw);
	
	System.out.print(array);
	
	if(array.isEmpty()){
		dao.close(); //자원해제
		JSFunction.alertBack("일치하는 회원정보가 없습니다", out);
	}else{
		 for (MembershipDTO dto : array){
				//인증되면 세선생성
				session.setAttribute("UserId", dto.getUserid());
				session.setAttribute("UserName", dto.getName());
			
				dao.close(); //자원해제
			
				JSFunction.alertLocation("로그인성공", "memberLogin.jsp", out); 
		 }
	}
	
%>