<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 삭제 버튼 클릭시 실행할 함수 js함수 선언 -->
<script type="text/javascript">
function deleteRow(idx) {
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="delete.do?idx="+idx;
	}
}
</script>
</head>
<body>
<div class="container">
	<h3 class="text-center">방명록(한줄게시판)</h3>
	
	<div class="text-center">
	<form method="get">
		<select name="searchField">
			<option value="contents">내용</option>
			<option value="name">작성자</option>
		</select>
		<input type="text" name="searchTxt" />
		<input type="submit" value="검색" />
	</form>
	</div>
	
	<!-- 글쓰기 버튼 및 로그인/로그아웃 버튼 -->
		<div style="text-align: right;">
		<!-- 세션영역에 로그인 정보가 있다면 "로그아웃" 버튼을 출력하고, 만약 없다면
		"로그인" 버튼을 출력한다. sessionScope는 세션영역을 가리키는 EL의 내장객체로
		생략할 수 있다. -->
			<c:choose>
				<c:when test="${not empty sessionScope.siteUserInfo }">
					<button class="btn btn-info" onclick="location.href='logout.do';">
						로그아웃
					</button>
				</c:when>
				<c:otherwise>
				<!-- 로그인이 되지 않은 경우 -->
					<button class="btn btn-info" onclick="location.href='login.do';">
						로그인
					</button>
				</c:otherwise>
			</c:choose>
			&nbsp;&nbsp;
			<button class="btn btn-success" onclick="location.href='write.do';">
				방명록쓰기
			</button>
		</div>
	<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row">		
		<div class="border mt-2 mb-2">
			<div class="media">
				<div class="media-left mr-3">
					<img src="../images/img_avatar3.png" class="media-object" style="width:60px">
				</div>
				<div class="media-body">
					<h4 class="media-heading">작성자:${row.name }(${row.id })</h4>
					<p>${row.contents }</p>
				</div>	  
				<!--  수정,삭제버튼 -->
				<div class="media-right">
				<!-- 작성자 본인에게만 버튼을 출력하기 위해 세션영역과 게시물의 아이디를 
				비교한다. -->
					<c:if test="${sessionScope.siteUserInfo.id eq row.id }">
						<button class="btn btn-primary" onclick="location.href='modify.do?idx=${row.idx}';">
							수정
						</button>
						<button class="btn btn-danger" onclick="javascript:deleteRow(${row.idx});">
							삭제
						</button>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<!-- 방명록 반복 부분 e -->
	<ul class="pagination justify-content-center">
		${pagingImg }
	</ul>
</div>


</body>
</html>