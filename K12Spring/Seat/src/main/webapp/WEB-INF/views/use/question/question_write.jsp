<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<%
	int qb_no = 0, qb_ref = 1, qb_restep = 0, qb_level = 0;
%>
<head>
<meta charset="UTF-8">

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<link rel="apple-touch-icon" sizes="76x76" href="http://ijuju88.cdn3.cafe24.com/img/home.gif">
<link rel="icon" type="image/png" href="resources/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ijujutest</title>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<link rel="stylesheet" href="resources/css/summernote-bs4.css?ver=1">

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
				<h3 class="title">문의게시판쓰기</h3>
			</div>
		</div>
	</div>
	<div class="section section-pagination">
		<!-- Main content -->
		<section class="content">

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="container">
							<div class="card-header">
								<h3 class="card-title" align="center">문의게시판쓰기</h3>

								<!-- /.card-header -->
								<div class="card-body">
									<form action="question_writesave.do" method="post"
										enctype="multipart/form-data" id="writesaveform">
										<c:if test="${qbVO == null}">
											<input type="hidden" id="qb_no" name="qb_no"
												value="<%=qb_no%>">
											<input type="hidden" id="qb_ref" name="qb_ref"
												value="<%=qb_ref%>">
											<input type="hidden" id="qb_restep" name="qb_restep"
												value="<%=qb_restep%>">
											<input type="hidden" id="qb_level" name="qb_level"
												value="<%=qb_level%>">
										</c:if>

										<c:if test="${qbVO!=null}">
											<input type="hidden" id="qb_no" name="qb_no"
												value="${qbVO.qb_no}">
											<input type="hidden" id="qb_ref" name="qb_ref"
												value="${qbVO.qb_ref}">
											<input type="hidden" id="qb_restep" name="qb_restep"
												value="${qbVO.qb_restep}">
											<input type="hidden" id="qb_level" name="qb_level"
												value="${qbVO.qb_level}">
										</c:if>

										<div class="col" style="margin-bottom: 5px">
											<div class="input-group">
												<div class="input-group-prepend">
													<div class="input-group-text">
														<label class="fa fa-sticky-note-o"
															for="inlineFormInputGroupUsername"></label>
													</div>
												</div>
												<input type="text" name="qb_title" class="form-control"
													placeholder="제목" id="qb_title" />
											</div>
										</div>

										<div class="col" style="margin-bottom: 5px">
											<div class="input-group">
												<div class="input-group-prepend">
													<div class="input-group-text">
														<label class="fa fa-user"
															for="inlineFormInputGroupUsername"></label>
													</div>
												</div>
												<input type="text" name="qb_writer" class="form-control"
													placeholder="작성자ID" id="qb_writer" readonly
													value="<%=(String) session.getAttribute("USESID")%>" />
											</div>
										</div>

										<div style="margin-bottom: 5px">
											<textarea id="qb_content" name="qb_content">Hello!</textarea>
										</div>


										<button type="submit"
											class="btn btn-outline-success write_submit">작성</button>
										<button type="button" class="btn btn-outline-secondary"
											onClick="window.location.href='home_questionlist.do'">이전으로</button>
									</form>
									<!-- <div class="output"></div> -->

								</div>
								<!-- /.card-body -->
							</div>
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
			</div>

		</section>

	</div>

	<jsp:include page="../home/homefooter.jsp"></jsp:include>

	<script src="resources/js/summernote-bs4.js"></script>
	<script src="resources/js_jsp/question_write_update.js"></script>


</body>
</html>