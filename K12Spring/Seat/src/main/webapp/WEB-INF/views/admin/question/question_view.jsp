<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="resources/js/jquery-3.2.1.js"></script>

<!-- Bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>

<!-- 알림창용 sweetalert2 -->
<!-- https://sweetalert2.github.io/ -->
<script src="resources/js/sweetalert2.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<script src="resources/js_jsp/question_view.js?ver=1"></script>
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
	height: 40%;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.SID eq null}">
			<h3>잘못된 접근입니다...</h3>
		</c:when>
		<c:otherwise>

			<jsp:include page="../admintitle.jsp"></jsp:include>


			<!-- ##### Contact Area Start ##### -->

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0 text-dark">문의게시판보기</h1>
							</div>
							<!-- /.col -->
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
									<li class="breadcrumb-item active">문의게시판보기</li>
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
											<!-- Content Header (Page header) -->
											<div class="content-header">
												<div class="container-fluid">
													<div class="row mb-2">
														<div class="col-sm-6">
															<h1 class="m-0 text-dark">문의게시판 질문보기</h1>
														</div>
														<!-- /.col -->
														<div class="col-sm-6">
															<ol class="breadcrumb float-sm-right">
																<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
																<li class="breadcrumb-item active">문의게시판 질문보기</li>
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

												<div>
													<input type="hidden" name="qb_no" class="form-control"
														id="qb_no" value="${qbVO.qb_no}" readonly />
												<input type="hidden" class="form-control" id="writer"
												value="<%=(String) session.getAttribute("SID")%>" />
												</div>

												<div>
													<div class="form-group row mb-4" style="margin-bottom: 5px">
														<div class="col-sm-5">
															제목 <input type="text" name="qb_title"
																class="form-control" id="qb_title"
																value="${qbVO.qb_title}" readonly />
														</div>
														<div class="col-sm-3">
															작성자<input type="text" name="qb_writer"
																class="form-control" id="qb_writer"
																value="${qbVO.qb_writer}" readonly />
														</div>
													</div>

													내용
													<div class="con">
														<div class="conent" style="overflow:scroll; ">${qbVO.qb_content}</div>
													</div>

													<div>
														쓴날짜 <input type="text" name="qb_title"
															class="form-control" id="qb_date" name="qb_date" readonly
															value="${qbVO.qb_date}">
													</div>

													<button type="button"
														class="btn btn-outline-secondary admin_question_writer">답글쓰기</button>

													<c:if test="${sessionScope.SID==qbVO.qb_writer}">
													<button type="button"
														class="btn btn-outline-secondary admin_question_update">답글수정</button>
														<button type="button"
															class="btn btn-outline-secondary question_delete">삭제</button>
													</c:if>
													
													<button type="button" class="btn btn-outline-secondary"
														onClick="window.location.href='home_questionlist.do'">이전으로</button>


												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

			<jsp:include page="../adminfooter.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>

</body>
</html>