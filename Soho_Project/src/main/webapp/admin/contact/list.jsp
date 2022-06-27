<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>${title_name}</title>


<style type="text/css">
@media only screen and (max-width: 800px) {
	
	table#contact_list th:nth-of-type(3), table#contact_list td:nth-of-type(3),
	table#contact_list th:nth-of-type(4), table#contact_list td:nth-of-type(4),
	table#contact_list th:nth-of-type(6), table#contact_list td:nth-of-type(6) 
	 { display: none; }

}
</style>

</head>
<body>
<c:choose>
		<c:when test="${empty ADMIN_ID}">
			<script>
				alert("로그인 후 이용 가능합니다");
				location.href="<%=request.getContextPath()%>/admin.do/login";
				
			</script>
		</c:when>
		<c:otherwise>
	<div class="page">

		<!-- header -->
		<jsp:include page="../layout/header.jsp" />

		<div class="page-wrapper">
			<div class="container-xl">
				<!-- Page title -->
				<div class="page-header d-print-none">
					<div class="row g-2 align-items-center">
						<div class="col">
							<!-- Page pre-title -->
							<div class="page-pretitle">게시판</div>
							<h2 class="page-title">${title_name}</h2>
						</div>
					</div>
				</div>
			</div>

			<!--page-body -->
			<div class="page-body">
				<div class="container-xl">
					<div class="row row-deck row-cards">

						<!-- menu -->
						<div class="col-12">
							<div class="card">

								<div class="card-body">
								
								<a href="<%= request.getContextPath() %>/admin.do/contact/write" class="btn btn-primary w-100"> 글쓰기  </a>
								
									<!-- 검색 폼 -->
								<form method="get">
									<div class="mb-3">
										<label class="form-label">게시판타입</label>
										<div class="form-selectgroup">

											<label class="form-selectgroup-item"> 
											<input type="submit" name="type" value="all" class="form-selectgroup-input"> 
											<span class="form-selectgroup-label type_span_all">전체</span>
											</label>
											
											<label class="form-selectgroup-item"> 
											<input type="submit" name="type" value="1" class="form-selectgroup-input"> 
											<span class="form-selectgroup-label type_span_1">공지</span>
											</label>
											
											<label class="form-selectgroup-item"> 
											<input type="submit" name="type" value="2" class="form-selectgroup-input"> 
											<span class="form-selectgroup-label type_span_2">홍보</span>
											</label>

										</div>
									</div>

									<div class="input-group">
										<select name="searchField" class="form-select input-group-text">
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="name">작성자</option>
										</select> 
										<input type="text"  class="form-control" name="searchWord" /> 
							            <button type="submit" class="btn btn-primary">검색하기</button>
							        </div>

								</form>

									<!-- 목록 테이블 -->
									<table id="contact_list" class="table text-center">
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>조회수</th>
											<th>작성일</th>
											<th>첨부</th>
										</tr>
										<!-- 게시물이 없을 때 -->
										<c:choose>
											<c:when test="${empty boardLists }">
												<!-- 리스트에 저장된 게시물이 없을 때 출력부분 -->
												<tr>
													<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
												</tr>
											</c:when>
											<c:otherwise>
											
											<c:forEach items='${boardLists }' var="row" varStatus="loop">
												<tr align="center">
													<td>
														
            										 ${map.totalCount -(((map.pageNum-1) * map.pageSize) + loop.index) }
													</td>
													<td align="left">
														<!-- 제목. 클릭시 상세보기 페이지로 이동함. --> <a
														href="<%= request.getContextPath() %>/admin.do/contact/view/${num}?idx=${row.idx }">
															${row.title } </a>
													</td>
													<td>${row.name }</td>
													<td>${row.visitcount }</td>
													<td>${row.postdate }</td>
													<td>
														<!-- 첨부파일이 있을때만 다운로드 링크를 출력함 --> 
														<c:if test="${not empty row.ofile }">
															<a
																href="<%= request.getContextPath() %>/contact.do/download?ofile=${row.ofile }&sfile=${row.sfile}&idx=${row.idx}">
																[down] </a>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
								
								
									<nav aria-label="Page navigation example">
										<ul class="pagination" >${map.pagingImg }</ul>
									</nav>

								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
			<!--page-body end-->

		</div>
		<!--page-wrapper end-->

	</div>

	<!-- footer -->
	<jsp:include page="../layout/footer.jsp" />

<script>
$(document).ready(function(){
	 var styleObj = {  'background': '#206bc4',  'color': '#fff' };
	var type = getParameterByName("type");
	if(type =='1' || type =='2' ){
		$(".type_span_"+ type).css( styleObj);
	}else{
		$(".type_span_all").css( styleObj);
	}
});

//파라미터 받기용
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

</script>
</c:otherwise>

	</c:choose>

</body>
</html>
