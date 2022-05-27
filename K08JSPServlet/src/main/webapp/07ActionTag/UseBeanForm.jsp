<%--
/**
 * 1. 프로젝트명 : 
 * 2. 작성일 : 2022. 5. 27. 오후 2:35:44
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - useBean</title>
</head>
<body>
    <h2>액션 태그로 폼값 한 번에 받기</h2> 
    <form method="post" action="UseBeanAction.jsp"> 
        이름 : <input type="text" name="name" /> <br /> 
        나이 : <input type="text" name="age" /> <br /> 
        <input type="submit" value="폼값 전송" />
    </form>
</body>
</html>