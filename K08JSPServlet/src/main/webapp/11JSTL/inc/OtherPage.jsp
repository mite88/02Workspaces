<%--
/**
 * 1. 프로젝트명 : inc/OtherPage.jsp
 * 2. 작성일 : 2022. 6. 2. 오후 4:39:53
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 2.    mite88   
 */
--%>
<!-- inc/OtherPage.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>OtherPage.jsp</h4>
<ul>
	<li>저장된 값 : ${requestVar}</li>
	<li>매개변수1 :  ${param.user_param1}</li>
	<li>매개변수2 :  ${param.user_param2}</li>
</ul>