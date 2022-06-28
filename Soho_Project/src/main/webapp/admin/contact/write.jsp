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
<title>${title_name}</title>
<script type="text/javascript">
	//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
	function validateForm(form){
		if(form.name.value == ""){
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
		if(form.title.value == ""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if(form.content.value == ""){
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	
	}
</script>
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
							<div class="page-pretitle">게시판관리</div>
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
								<div class="card-body markdown">

									<form name="writeFrm" method="post"enctype="multipart/form-data" onsubmit="return validateForm(this);">

										<div class="mb-3">
											<input
												type="hidden" class="form-control" autocomplete="off"
												name="name" readonly value="관리자">
											
											<label class="form-label required">게시판 타입</label> 	
											<select class="form-select" aria-label="Default select example" name="type">
											  <option value="1">공지게시판</option>
											  <option value="2">홍보게시판</option>
											</select>
										</div>


										<div class="mb-3">
											<label class="form-label required">제목</label> <input
												type="text" class="form-control" autocomplete="off"
												name="title">
										</div>

										<div class="mb-3">
											<label class="form-label">내용</label>
											<textarea class="form-control" data-bs-toggle="autosize"
												placeholder="Type something…" name="content"
												style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 96px;"></textarea>
										</div>


										<div class="mb-3">
											<label class="form-label">영상 url</label>
											<div class="input-group mb-2">
												<input type="text" class="form-control" placeholder="username" name="video_url" autocomplete="off">
											</div>

										</div>

										<div class="mb-3">
											<label for="formFile" class="form-label">파일첨부</label> <input
												class="form-control" type="file" name="ofile">
										</div>
										
										
										<button type="submit" class="btn btn-outline-primary">작성완료</button>
										<button class="btn btn-outline-primary" type="reset">RESET</button>
										<button class="btn btn-outline-primary" type="button" onclick="location.href='../mvcboard/list.do'">
											목록 바로가기
										</button>

									</form>

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
	</c:otherwise>

	</c:choose>
</body>
</html>
