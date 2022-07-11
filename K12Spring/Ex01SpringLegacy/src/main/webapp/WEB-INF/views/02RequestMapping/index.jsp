<%--
/**
 * <pre>
 * 1. 프로젝트명 : 02RequestMapping/index.jsp
 * 2. 작성일 : 2022. 7. 11. 오후 2:38:14
 * 3. 작성자 : mite88
 * 4. 설명 : @RequestMapping 어노테이션(GET)
 * </pre> 
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>@RequestMapping</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap-5.1.3/css/bootstrap.css" />
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/jquery/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap-5.1.3/js/bootstrap.bundle.js"></script>

</head>
<body>
	<h2>@RequestMapping 어노테이션</h2>
	<h3>GET방식으로 전송하기[검색폼]</h3>

	<script>
		//검색폼에서 검색 부분에 빈값이 있는지 체크하는 JS함수 선언
		function searchCheck(f) {
			if(!f.searchWord.value){
				alert("검색어를 입력하세요");
				f.searchWord.focus();
				
				return false;
			}
		}
	</script>

	<form action="../requestMapping/getSearch.do" method="get"
		name="searchFrm" onsubmit="return searchCheck(this);">
		<select name="searchColumn">
			<option value="title">제목</option>
			<option value="name">작성자</option>
			<option value="content">내용</option>
		</select> <input type="text" name="searchWord" id="searchWord" /> <input
			type="submit" value="검색하기" />
	</form>

	<hr />

	<h3>POST방식으로 전송[로그인폼]</h3>
	<!-- 컨텍스트 루트 경로얻기 -->
	<% String ctxPath = request.getContextPath(); %>
	<script>
	function loginCheck(fm){
	}
	</script>
	<form action="<%=ctxPath%>/requestMapping/postLogin.do" method="post"
		name="loginFrm" onsubmit="return loginCheck(this);">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" /></td>
			</tr>
			
			<tr>
				<td>패스워드</td>
				<td><input type="text" name="user_pw" /></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="로그인" /></td>
			</tr>
		</table>
	</form>
	
	
	<hr />
	<h3>@ModelAttribute 어노테이션 사용하여 커맨드객체 이름변경하기</h3>
	<script>
		var stuCheck = function() {}
	</script>
	<form action="<%=ctxPath%>/requestMapping/modelAttribute.do" method="post"
		name="studentFrm" onsubmit="return stuCheck();">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" /></td>
			</tr>
			<tr>
				<td></td>
				<td><select name="gradeNum">
						<option value="1학년">1학년</option>
						<option value="2학년">2학년</option>
						<option value="3학년">3학년</option>
				</select></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="radio" name="classNum" value="1반" />1반 
					<input type="radio" name="classNum" value="2반" />2반
					<input type="radio" name="classNum" value="3반" />3반
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="전송하기" /></td>
			</tr>
		</table>
	</form>

</body>
</html>