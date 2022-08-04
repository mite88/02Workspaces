<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
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
								<h1 class="m-0 text-dark">공지사항보기</h1>
							</div>
							<!-- /.col -->
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
									<li class="breadcrumb-item active">공지사항보기</li>
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

												<button type="button"
													class="btn btn-outline-success viewupdate">수정</button>
													<button type="button"
													class="btn btn-outline-secondary delete_submit">삭제</button>
												<button type="button" class="btn btn-outline-secondary"
													onClick="window.location.href='notice_list.do'">이전으로</button>

												<script src="resources/js_jsp/notice_view.js"></script>
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
</body>
</html>