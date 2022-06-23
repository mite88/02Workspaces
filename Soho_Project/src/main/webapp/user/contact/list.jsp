<%--
/**
 * 1. 프로젝트명 : list.do
 * 2. 작성일 : 2022. 6. 23. 오전 9:55:35
 * 3. 작성자 : mite88
 * 4. 설명 : 게시판
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 23.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<!-- header -->
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="container-xxl project py-5">
		<div class="container-fluid">
			<div class="text-center mx-auto mb-5 wow fadeInUp"
				data-wow-delay="0.1s"
				style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
				<h4 class="section-title">${title_name}</h4>
				<h1 class="display-5 mb-4">Visit Our Latest Projects And Our
					Innovative Works</h1>
			</div>
			<!-- 안내 -->
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s"
				style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

				<div class="col-lg-12">
					<div class="tab-content w-100">

						<div class="row my-5">

							<div class="col-md-12">

								<!-- 검색 폼 -->
								<form method="get">
									<table class="table" >
										<tr>
											<td align="center"><select name="searchField">
													<option value="title">제목</option>
													<option value="content">내용</option>
													<option value="name">작성자</option>
											</select> <input type="text" name="searchWord" /> <input
												type="submit" value="검색하기" /></td>
										</tr>
									</table>
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
														href="<%= request.getContextPath() %>/contact.do/view/${num}?idx=${row.idx }">
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
									<ul class="pagination">
										${map.pagingImg }
									</ul>
								</nav>

								<%-- <table>
									<tr>
										<td>${map.pagingImg }</td>
										<td width="100">
											<button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
										</td>
									</tr>
								</table>  --%>


							</div>

						</div>

					</div>

				</div>
				<!-- col-lg-12 end -->

			</div>
			<!-- row end -->

		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>