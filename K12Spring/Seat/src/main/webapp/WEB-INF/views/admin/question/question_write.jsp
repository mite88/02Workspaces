<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<%
	int qb_no = 0, qb_ref = 1, qb_restep = 0, qb_level = 0;
%>
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

				<!-- Main content -->
				<section class="content">

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="container">
									<div class="card-header">
										<!-- Content Header (Page header) -->
										<div class="content-header">
											<div class="container-fluid">
												<div class="row mb-2">
													<div class="col-sm-6">
														<h1 class="m-0 text-dark">문의게시판 답변쓰기</h1>
													</div>
													<!-- /.col -->
													<div class="col-sm-6">
														<ol class="breadcrumb float-sm-right">
															<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
															<li class="breadcrumb-item active">문의게시판 답변쓰기</li>
														</ol>
													</div>
													<!-- /.col -->
												</div>
												<!-- /.row -->
											</div>
											<!-- /.container-fluid -->
										</div>
										<!-- /.content-header -->

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
															value="<%=(String) session.getAttribute("SID")%>" />
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
			<jsp:include page="../adminfooter.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
<script src="resources/js/summernote-bs4.js"></script>
	<script src="resources/js_jsp/question_write_update.js"></script>

</body>
</html>