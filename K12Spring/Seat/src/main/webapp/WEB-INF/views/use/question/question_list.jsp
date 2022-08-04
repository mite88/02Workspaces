<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="">

<link rel="apple-touch-icon" sizes="76x76"
	href="http://ijuju88.cdn3.cafe24.com/img/home.gif">
<link rel="icon" type="image/png" href="resources/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ijujutest</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/now-ui-kit.css?ver=3" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="resources/css/demo.css" rel="stylesheet" />

<link rel="stylesheet" href="resources/home.css">

<!-- glide -->
<link rel="stylesheet" href="resources/css/glide.core.min.css">
<link rel="stylesheet" href="resources/css/glide.theme.min.css">
<link rel="stylesheet" href="resources/s.css">

<script src="resources/js/jquery-3.2.1.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/popper.min.js" type="text/javascript"></script>

<!-- Bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
</head>
<body>

	<jsp:include page="../home/hometitle.jsp"></jsp:include>

	<!-- 배경제목 -->
	<div class="page-header clear-filter" filter-color="orange">
		<div class="page-header-image" data-parallax="true"
			style="background-image: url(http://ijuju88.cdn3.cafe24.com/img/orchestra.jpg); transform: translate3d(0px, 0px, 0px);">
		</div>
		<div class="container">
			<div class="photo-container">
				<h3 class="title">문의게시판</h3>
			</div>
		</div>
	</div>
	<div class="section section-pagination">
		<div class="container">
			<!-- Main content -->
				<section class="content">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title" align="center">문의게시판</h3>

									<input type="hidden" class="form-control" id="writer"
										value="<%=(String) session.getAttribute("USESID")%>" />
									<!-- /.card-header -->
									<div class="card-body">
										<table id="questiontable"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>순번</th>
													<th>제목</th>
													<th>문의자</th>
													<th>날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="vo" items="${list}" varStatus="status">
													<tr>
														<td class="q_no">${vo.qb_no}</td>

														<c:choose>
															<c:when test="${vo.qb_level > 0}">
																<td>&nbsp;&nbsp;&nbsp;<img
																	src="http://ijuju88.cdn3.cafe24.com/img/point.PNG"
																	width="20px;"> 답변]<a
																	href="home_questionview.do?qb_no=${vo.qb_no}" class="a_view">${vo.qb_title}</a>
																</td>
															</c:when>
															<c:when test="${vo.qb_remove==1}">
																<td style="color: red;">원본글이 없습니다</td>
															</c:when>
															<c:otherwise>
																<td>
																<a href="home_questionview.do?qb_no=${vo.qb_no}"  class="a_view">
																${vo.qb_title}</a>
																</td>
															</c:otherwise>
														</c:choose>

														<td class="q_writer">${vo.qb_writer}</td>
														<td>${vo.qb_date}</td>
													</tr>
												</c:forEach>
										</table>
										<div class="form-group row mb-4">
											<div class="col-sm-2">
												<input type="button" class="btn btn-outline-dark write"
													value="글쓰기" />
											</div>
										</div>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
							<!-- /.col -->
						</div>
					</div>

				</section>
		</div>
	</div>
	</section>
	<jsp:include page="../home/homefooter.jsp"></jsp:include>

	<!-- DataTables -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

	<script src="resources/js_jsp/question_list.js?ver=4"></script>


</body>
</html>