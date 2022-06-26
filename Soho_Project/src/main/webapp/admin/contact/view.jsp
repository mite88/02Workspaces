<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<style>
.entry-meta li {
	display: inline-block;
	font-size: 13px;
	color: #919191;
	margin-bottom: 15px;
	white-space: nowrap;
}
/*정보 아래 선*/
.bottom-line:after {
	content: "";
	display: block;
	width: 48px;
	border-bottom: 3px solid #e8e8e8;
	margin: 15px auto 15px;
}
/*정보구분선*/
.blog-content .entry-meta li:first-child:before {
	margin: 0 0 0 -3px;
}

.entry-meta li:first-child:before {
	content: "";
	margin: 0;
}

.entry-meta li:before {
	content: "|";
	opacity: 0.5;
	margin: 0 7px;
}
</style>
</head>
<body>

	<!-- 파일 형식지정용 -->
	<c:set var="filetype" value="${fn:split(dto.ofile, '.')}" />
	<c:set var="filetype_img"
		value="${(fn:toLowerCase(filetype[1]) eq 'jpg') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'png') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'jpeg') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'gif')}" />

	<c:set var="filetype_video"
		value="${(fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'mp4') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'ogv') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'WebM')
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'avi')}" />

	<c:set var="filetype_audio"
		value="${(fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'wav')  
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'Ogg') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'mp3')}" />



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

							<div class="card card-lg">
								<div class="card-body markdown text-center">
									<h1 id="whos-that-then">${ dto.title}</h1>

									<ul class="entry-meta bottom-line">
										<li class="entry-date"><a href="#">${ dto.postdate}</a></li>

										<li class="entry-author">by <a href="#">${dto.name}</a> </li>

										<li><a href="blog-single.html" class="entry-comments">${ dto.visitcount} 조회수</a></li>
									</ul>

									<c:if test="${ not empty dto.ofile}">
									${ dto.ofile}
									<a href="<%= request.getContextPath() %>/contact.do/download?ofile=${ dto.ofile}&sfile=${ dto.sfile}&idx=${ dto.idx}">
											[다운로드] </a>
									(다운로드수 : ${dto.downcount })
									</c:if>

									<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s"
										style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

										<div class="col-lg-12">

											<div class="row">
												<div class="col-lg-12 text-center">


													<c:if test="${not empty dto.ofile and filetype_img}">
														<img alt="img" class="img-fluid"
															src="<%=request.getContextPath()%>/Uploads/contact/${dto.sfile}">
													</c:if>

													<c:if test="${not empty dto.ofile and filetype_video}">
														<div class="embed-responsive embed-responsive-16by9">
															<iframe class="embed-responsive-item"
																src="<%=request.getContextPath() %>/Uploads/contact/${dto.sfile}"></iframe>
														</div>
													</c:if>

													<c:if test="${not empty dto.ofile and filetype_audio}">
														<div class="embed-responsive embed-responsive-16by9">
															<audio controls class="embed-responsive-item">
																<source
																	src="<%=request.getContextPath() %>/Uploads/contact/${dto.sfile}" />
															</audio>

														</div>
													</c:if>

													<c:if test="${not empty dto.video_url}">
														<div class="ratio ratio-16x9">
															<iframe src="${dto.video_url}"></iframe>
														</div>


													</c:if>



												</div>
												<!-- end of col -->
											</div>

											<!-- 내용 -->
											<div class="tab-content w-100">

												<div class="row my-5">
													<div class="col-lg-12 text-center">${ dto.content}</div>
												</div>

											</div>

											<!-- 버튼 -->
											<div class="d-grid gap-1">
												<button class="btn btn-secondary btn-pill w-100"
													type="button"
													onclick="location.href='<%= request.getContextPath() %>/admin.do/contact/list/?type=${dto.type}';">
													목록</button>
													
												<button class="btn btn-secondary btn-pill w-100" type="button"
													onclick="location.href='<%= request.getContextPath() %>/admin.do/contact/edit/?idx=${dto.idx }';">
													수정</button>
													
												<button class="btn btn-secondary btn-pill w-100" type="button"
													onclick="location.href='<%= request.getContextPath() %>/admin.do/contact/delete/?idx=${dto.idx }';">
													삭제</button>
													
											</div>

										</div>
										<!-- col-lg-12 end -->

									</div>
									<!-- row end -->


								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
			<!--page-body end-->

		</div>
		<!--page-wrapper end-->

		<!-- header -->
		<jsp:include page="../layout/footer.jsp" />

	</div>
</body>
</html>
