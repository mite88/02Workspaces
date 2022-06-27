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
							<div class="page-pretitle">Overview</div>
							<h2 class="page-title">Dashboard</h2>
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
													<div class="font-weight-medium">132 Sales</div>
													<div class="text-muted">12 waiting payments</div>
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
													<div class="font-weight-medium">78 Orders</div>
													<div class="text-muted">32 shipped</div>
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
													<div class="font-weight-medium">623 Shares</div>
													<div class="text-muted">16 today</div>
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
													<div class="font-weight-medium">132 Likes</div>
													<div class="text-muted">21 today</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end menu -->

						<!-- 현황 -->
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h3 class="card-title">회원현황</h3>
									<div id="chart-mentions" class="chart-lg"></div>
								</div>
							</div>
						</div>

						<div class="col-lg-6">

							<div class="card">
								<div class="card-header">
									<h3 class="card-title">일별환황</h3>
								</div>
								<div class="card-table table-responsive">
									<table class="table table-vcenter">
										<thead>
											<tr>
												<th>일자</th>
												<th>사무실사용수</th>
												<th>방문자</th>
												<th>가입</th>
												<th>문의</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>/about.html 
												</td>
												<td class="text-muted">4,896</td>
												<td class="text-muted">3,654</td>
												<td class="text-muted">82.54%</td>
												<td class="text-end w-1">
													<div class="chart-sparkline chart-sparkline-sm"
														id="sparkline-bounce-rate-1"></div>
												</td>
											</tr>
											<tr>
												<td>/special-promo.html</td>
												<td class="text-muted">3,652</td>
												<td class="text-muted">3,215</td>
												<td class="text-muted">76.29%</td>
												<td class="text-end w-1">
													<div class="chart-sparkline chart-sparkline-sm"
														id="sparkline-bounce-rate-2"></div>
												</td>
											</tr>
											<tr>
												<td>/special-promo.html</td>
												<td class="text-muted">3,256</td>
												<td class="text-muted">2,865</td>
												<td class="text-muted">72.65%</td>
												<td class="text-end w-1">
													<div class="chart-sparkline chart-sparkline-sm"
														id="sparkline-bounce-rate-3"></div>
												</td>
											</tr>
											<tr>
												<td>/special-promo.html</td>
												<td class="text-muted">986</td>
												<td class="text-muted">865</td>
												<td class="text-muted">44.89%</td>
												<td class="text-end w-1">
													<div class="chart-sparkline chart-sparkline-sm"
														id="sparkline-bounce-rate-4"></div>
												</td>
											</tr>
											<tr>
												<td>/special-promo.html</td>
												<td class="text-muted">912</td>
												<td class="text-muted">822</td>
												<td class="text-muted">41.12%</td>
												<td class="text-end w-1">
													<div class="chart-sparkline chart-sparkline-sm"
														id="sparkline-bounce-rate-5"></div>
												</td>
											</tr>
											<tr>
												<td>/special-promo.html</td>
												<td class="text-muted">855</td>
												<td class="text-muted">798</td>
												<td class="text-muted">32.65%</td>
												<td class="text-end w-1">
													<div class="chart-sparkline chart-sparkline-sm"
														id="sparkline-bounce-rate-6"></div>
												</td>
											</tr>
										</tbody>

										<tfoot>
											<tr>
												<td>최근 7일간합계</td>
												<td class="text-muted">0건</td>
												<td class="text-muted">0명</td>
												<td class="text-muted">0명</td>
												<td class="text-end w-1">0명</td>
											</tr>
											<tr>
												<td>이번달합계</td>
												<td class="text-muted">0건</td>
												<td class="text-muted">0명</td>
												<td class="text-muted">0명</td>
												<td class="text-end w-1">0명</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>

						</div>

						<!-- 현황 end -->

						<!-- 게시판 -->
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									<h3 class="card-title">공지사항</h3>
								
									<a class="float_r text-12 opacity-50 force-padding no-padding-y"
										href="https://imweb.me/notice">더보기</a>
								</div>
								
								<div class="card-body border-top">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">List group item heading</h5>
												<small>3 days ago</small>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">List group item heading</h5>
												<small>3 days ago</small>
											</div>
										</li>
										
										<li class="list-group-item">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">List group item heading</h5>
												<small>3 days ago</small>
											</div>
										</li>
										
										<li class="list-group-item">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">List group item heading</h5>
												<small>3 days ago</small>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									<h3 class="card-title">1:1문의</h3>
								
									<a class="float_r text-12 opacity-50 force-padding no-padding-y"
										href="https://imweb.me/notice">더보기</a>
								</div>
								
								<div class="card-body border-top">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">List group item heading</h5>
												<small>3 days ago</small>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">List group item heading</h5>
												<small>3 days ago</small>
											</div>
										</li>
										
										<li class="list-group-item">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">List group item heading</h5>
												<small>3 days ago</small>
											</div>
										</li>
										
										<li class="list-group-item">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-1">List group item heading</h5>
												<small>3 days ago</small>
											</div>
										</li>
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
	

	<script>
		// @formatter:off
		document.addEventListener("DOMContentLoaded", function() {
			window.ApexCharts
					&& (new ApexCharts(document
							.getElementById('chart-mentions'), {
						chart : {
							type : "bar",
							fontFamily : 'inherit',
							height : 240,
							parentHeightOffset : 0,
							toolbar : {
								show : false,
							},
							animations : {
								enabled : false
							},
							stacked : true,
						},
						plotOptions : {
							bar : {
								columnWidth : '50%',
							}
						},
						dataLabels : {
							enabled : false,
						},
						fill : {
							opacity : 1,
						},
						series : [
								{
									name : "Web",
									data : [ 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 2,
											12, 5, 8, 22, 6, 8, 6, 4, 1, 8, 24,
											29, 51, 40, 47, 23, 26, 50, 26, 41,
											22, 46, 47, 81, 46, 6 ]
								},
								{
									name : "Social",
									data : [ 2, 5, 4, 3, 3, 1, 4, 7, 5, 1, 2,
											5, 3, 2, 6, 7, 7, 1, 5, 5, 2, 12,
											4, 6, 18, 3, 5, 2, 13, 15, 20, 47,
											18, 15, 11, 10, 0 ]
								},
								{
									name : "Other",
									data : [ 2, 9, 1, 7, 8, 3, 6, 5, 5, 4, 6,
											4, 1, 9, 3, 6, 7, 5, 2, 8, 4, 9, 1,
											2, 6, 7, 5, 1, 8, 3, 2, 3, 4, 9, 7,
											1, 6 ]
								} ],
						grid : {
							padding : {
								top : -20,
								right : 0,
								left : -4,
								bottom : -4
							},
							strokeDashArray : 4,
							xaxis : {
								lines : {
									show : true
								}
							},
						},
						xaxis : {
							labels : {
								padding : 0,
							},
							tooltip : {
								enabled : false
							},
							axisBorder : {
								show : false,
							},
							type : 'datetime',
						},
						yaxis : {
							labels : {
								padding : 4
							},
						},
						labels : [ '2020-06-20', '2020-06-21', '2020-06-22',
								'2020-06-23', '2020-06-24', '2020-06-25',
								'2020-06-26', '2020-06-27', '2020-06-28',
								'2020-06-29', '2020-06-30', '2020-07-01',
								'2020-07-02', '2020-07-03', '2020-07-04',
								'2020-07-05', '2020-07-06', '2020-07-07',
								'2020-07-08', '2020-07-09', '2020-07-10',
								'2020-07-11', '2020-07-12', '2020-07-13',
								'2020-07-14', '2020-07-15', '2020-07-16',
								'2020-07-17', '2020-07-18', '2020-07-19',
								'2020-07-20', '2020-07-21', '2020-07-22',
								'2020-07-23', '2020-07-24', '2020-07-25',
								'2020-07-26' ],
						colors : [ "#206bc4", "#79a6dc", "#bfe399" ],
						legend : {
							show : false,
						},
					})).render();
		});
		// @formatter:on
	</script>
	
</c:otherwise>

	</c:choose>
</body>
</html>
