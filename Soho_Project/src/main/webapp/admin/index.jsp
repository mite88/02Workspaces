<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>관리자</title>

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
		<jsp:include page="layout/header.jsp" />


		<div class="page-wrapper">
			<div class="container-xl">
				<!-- Page title -->
				<div class="page-header d-print-none">
					<div class="row g-2 align-items-center">
						<div class="col">
							<!-- Page pre-title -->
							<h2 class="page-title">대시보드</h2>
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
							<div class="row row-cards">

								<div class="col-sm-6 col-lg-3">
									<div class="card card-sm">
										<div class="card-body">
											<div class="row align-items-center">
												<div class="col-auto">
													<span class="bg-blue text-white avatar"> <i
														class="ti ti-search"></i>
													</span>
												</div>
												<div class="col">
													<div class="font-weight-medium">회원관리</div>
													<div class="text-muted">전체 : ${member_count}</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-sm-6 col-lg-3">
									<div class="card card-sm">
										<div class="card-body">
											<div class="row align-items-center">
												<div class="col-auto">
													<span class="bg-green text-white avatar"> <i
														class="ti ti-search"></i>
													</span>
												</div>
												<div class="col">
													<div class="font-weight-medium">제휴관리</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-sm-6 col-lg-3">
									<div class="card card-sm">
										<div class="card-body">
											<div class="row align-items-center">
												<div class="col-auto">
													<span class="bg-twitter text-white avatar"> <i
														class="ti ti-search"></i>
													</span>
												</div>
												<div class="col">
													<div class="font-weight-medium">예약관리</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-3">
									<div class="card card-sm">
										<div class="card-body">
											<div class="row align-items-center">
												<div class="col-auto">
													<span class="bg-facebook text-white avatar"> <i
														class="ti ti-search"></i>
													</span>
												</div>
												<div class="col">
													<div class="font-weight-medium">게시판관리</div>
													<div class="text-muted">(공지)전체 : ${contact_count1}</div>
													<div class="text-muted">(홍보)전체 : ${contact_count2}</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end menu -->


						<!-- 게시판 -->
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									<h3 class="card-title">공지사항</h3>
								
									<a class="float_r text-12 opacity-50 force-padding no-padding-y"
										href="<%=request.getContextPath()%>/admin.do/contact/list/?type=1">더보기</a>
								</div>
								
								<div class="card-body border-top">
									<ul class="list-group list-group-flush">
										<c:forEach items='${boardLists1}' var="row" varStatus="loop" begin="0" end="5">
											<li class="list-group-item">
												<div class="d-flex w-100 justify-content-between">
													<h5 class="mb-1">${row.title }</h5>
													<small>${row.postdate }</small>
												</div>
											</li>
										</c:forEach>
									
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									<h3 class="card-title">홍보</h3>
								
									<a class="float_r text-12 opacity-50 force-padding no-padding-y"
										href="<%=request.getContextPath()%>/admin.do/contact/list/?type=2">더보기</a>
								</div>
								
								<div class="card-body border-top">
									<ul class="list-group list-group-flush">
										<c:forEach items='${boardLists2}' var="row2" varStatus="loop" begin="0" end="5">
											<li class="list-group-item">
												<div class="d-flex w-100 justify-content-between">
													<h5 class="mb-1">${row2.title }</h5>
													<small>${row2.postdate }</small>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<!-- 게시판 end -->

					</div>
				</div>
			</div>
			<!-- page body end -->

		</div>
	</div>

	
	<!-- footer -->
	<jsp:include page="layout/footer.jsp" />
	

	
</c:otherwise>

	</c:choose>
</body>
</html>
