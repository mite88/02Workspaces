<%--
/**
 * 1. 프로젝트명 : inc/ParamInclude.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 2:47:44
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 27.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <h2>인클루드된 페이지에서 매개변수 확인</h2>
<%= request.getParameter("loc1")%>에
<%= request.getParameter("loc2")%>이 있습니다