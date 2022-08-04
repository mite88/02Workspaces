<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<style type="text/css">
.ck-editor__editable {
	min-height: 400px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="resources/js/jquery-3.2.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js?var=1"></script>

<!-- Bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="resources/css/summernote-bs4.css">
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.SID eq null}">
			<h3>잘못된 접근입니다...</h3>
		</c:when>
		<c:otherwise>

			<jsp:include page="../admintitle.jsp"></jsp:include>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0 text-dark">공지사항쓰기</h1>
							</div>
							<!-- /.col -->
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
									<li class="breadcrumb-item active">공지사항쓰기</li>
								</ol>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- /.content-header -->

				<!-- Main content -->
				<section class="content">

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="container">
									<div class="card-header">
										<h3 class="card-title" align="center">공지사항쓰기</h3>

										<!-- /.card-header -->
										<div class="card-body">
											<form action="notice_writesave.do" method="post"
												enctype="multipart/form-data" id="writesaveform">

												<div class="form-group row mb-4" style="margin-bottom: 5px">
													<div class="col-sm-5">
														<input type="text" name="nb_title" class="form-control"
															placeholder="제목" id="nb_title" /> 
														</div>
														<div class="col-sm-4">	
														<select class="custom-select" id="selectBox">
															<option value="1" selected>공지사항</option>
															<option value="2">이벤트</option>
															<option value="3">기타</option>
														</select>
														<script>
														$("select").change(function () {
															var str = ""; $("select option:selected").each(function () { 
																str += $(this).text() + " "; 
																}); 
															
															$("#nb_category").val(str);
														}) .change();

														</script>
														<input type="hidden" name="nb_category" id="nb_category" value="공지사항">
													</div>
												</div>

												<div style="margin-bottom: 5px">
													<textarea id="nb_content" name="nb_content">Hello!</textarea>
												</div>


												<button type="submit"
													class="btn btn-outline-success write_submit">작성</button>
												<button type="button" class="btn btn-outline-secondary"
													onClick="window.location.href='notice_list.do'">이전으로</button>
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


			<jsp:include page="../adminfooter.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>

	<script src="resources/js/summernote-bs4.js"></script>

	<script src="resources/js_jsp/notice_write_update.js"></script>

</body>
</html>