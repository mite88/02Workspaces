<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<head>
<meta charset="UTF-8">
<meta name="description" content="">

<link rel="apple-touch-icon" sizes="76x76"
	href="http://ijuju88.cdn3.cafe24.com/img/home.gif">
<link rel="icon" type="image/png" href="resources/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ijujutest</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
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

<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<style>
textarea {
	overflow-x: hidden;
	overflow-y: auto;
	resize: none; /* 사이즈 변경불가 */
}

div {
	margin-bottom: 5px;
}

.con {
	border: 1px solid #e4e7e7;
	border-radius: 0.5em;
}

.conent {
	margin: 15px;
}
</style>

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
				<h3 class="title">공지게시판보기</h3>
			</div>
		</div>
	</div>

	<!-- ##### Contact Area Start ##### -->
	<div class="section section-pagination">
		<div class="container">

			<!-- Main content -->
			<section class="content">

				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="container">
								<div class="card-header">
									<h3 class="card-title" align="center">공지사항보기</h3>

									<!-- /.card-header -->
									<div class="card-body">

										<div>
											<input type="hidden" name="nb_no" class="form-control"
												id="nb_no" value="${nbVO.nb_no}" readonly />
										</div>

										<div>
											<div class="form-group row mb-4" style="margin-bottom: 5px">
												<div class="col-sm-5">
													제목 <input type="text" name="nb_title" class="form-control"
														id="nb_title" value="${nbVO.nb_title}" readonly />
												</div>
												<div class="col-sm-3">
													카테고리<input type="text" name="nb_category"
														class="form-control" id="nb_category"
														value="${nbVO.nb_category}" readonly />
												</div>
											</div>

											내용
											<div class="con">
												<div class="conent">${nbVO.nb_content}</div>
											</div>

											<div>
												쓴날짜 <input type="text" name="nb_title" class="form-control"
													id="nb_date" name="nb_date" readonly
													value="<fmt:formatDate value="${nbVO.nb_date}" pattern="yyyy/MM/dd HH:MM"/>">
											</div>

											<button type="button" class="btn btn-outline-secondary"
												onClick="window.location.href='home_noticelist.do'">이전으로</button>


										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
</div>

	</section>

	<jsp:include page="../home/homefooter.jsp"></jsp:include>
	<!-- page script -->
	<script src="resources/js_jsp/baselist.js"></script>
	<script src="resources/js_jsp/notice_list.js"></script>

</body>

</html>

