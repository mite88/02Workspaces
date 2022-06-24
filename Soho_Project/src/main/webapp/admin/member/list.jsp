<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<!--
* Tabler - Premium and Open Source dashboard template with responsive and high quality UI.
* @version 1.0.0-beta10
* @link https://tabler.io
* Copyright 2018-2022 The Tabler Authors
* Copyright 2018-2022 codecalm.net PaweÅ Kuna
* Licensed under MIT (https://github.com/tabler/tabler/blob/master/LICENSE)
-->
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>${title_name}</title>

</head>
<body>
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
							<div class="page-pretitle">사용자관리</div>
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

									<!-- 목록 테이블 -->
									<table id="contact_list" class="table text-center">
										<tr>
											<th>번호</th>
											<th>아이디</th>
											<th>이름</th>
											<th>가입일</th>
											<th>등급</th>
											<th>정보확인</th>
										</tr>
										<!-- 게시물이 없을 때 -->
										<c:choose>
											<c:when test="${empty memberLists }">
												<!-- 리스트에 저장된 게시물이 없을 때 출력부분 -->
												<tr>
													<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
												</tr>
											</c:when>
											<c:otherwise>


												<c:forEach items='${memberLists }' var="row"
													varStatus="loop">
													<tr align="center">

														<td>${map.totalCount -(((map.pageNum-1) * map.pageSize) + loop.index) }</td>
														<td>${row.user_id }</td>
														<td>${row.user_name }</td>
														<td><fmt:formatDate value="${row.megister_date }"
																pattern="yyyy-MM-dd hh:mm" /></td>
														<td>${row.memberLevel }</td>
														<td>ㅇ</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</table>

									<nav aria-label="Page navigation example">
										<ul class="pagination">${map.pagingImg }</ul>
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
</body>
</html>
