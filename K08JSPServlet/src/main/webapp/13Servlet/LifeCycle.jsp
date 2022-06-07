<%--
/**
 * 1. 프로젝트명 :  LifeCycle.jsp
 * 2. 작성일 : 2022. 6. 7. 오전 10:53:33
 * 3. 작성자 : mite88
 * 4. 설명 : 
 * ========================================================
 * 수정일         작성자             내용      
 * ========================================================
 *  
 * ========================================================
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> LifeCycle.jsp</title>
</head>
<body>
	<script>
	function requestAction(frm, met){
		if(met == 1){
			frm.method = 'get';
		}else{
			frm.method = 'post';
		}
		frm.submit();
	}
	</script>
	
	<h2>서블릿 수명주기(Life Cycle)메서드</h2>
	<!-- 자바스크립트를 통해 폼값 전송이 되기에 input태그는 버튼타입으로 하고 onclick이벤트헨들러로 호출함 -->
	<form action="./LifeCycle.do">
		<input type="button" value="Get방식요청"  onclick="requestAction(this.form, 1);"/>
		<input type="button" value="Post방식요청" onclick="requestAction(this.form, 2);"/>
	</form>
</body>
</html>