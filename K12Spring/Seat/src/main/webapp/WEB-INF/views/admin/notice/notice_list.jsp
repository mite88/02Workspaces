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
								<h1 class="m-0 text-dark">공지사항</h1>
							</div>
							<!-- /.col -->
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
									<li class="breadcrumb-item active">공지사항</li>
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
								<div class="card-header">
									<h3 class="card-title">공지사항</h3>

									<!-- /.card-header -->
									<div class="card-body">
										<table id="noticetable"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>순번</th>
													<th>카테고리</th>
													<th>제목</th>
													<th>날짜</th>
												</tr>
											</thead>
											<tbody id="datatable">
												<c:forEach var="vo" items="${noticelist}" varStatus="status">
													<tr>
														<td>${vo.nb_no}</td>
														<td>${vo.nb_category}</td>
														<td><a href="notice_view.do?nb_no=${vo.nb_no}">${vo.nb_title}</a></td>
														<td><fmt:formatDate value="${vo.nb_date}"
																pattern="yyyy/MM/dd HH:MM" /></td>
													</tr>
												</c:forEach>
											</tbody>

										</table>
										<div class="form-group row mb-4">
											<div class="col-sm-2">
												<input type="button" class="btn btn-outline-dark write"
													value="글쓰기" />
											</div>
											<!-- 카테고리별 -->
											<div class="col-sm-3">
												<select class="custom-select" name="category" id="category">
													<option value="0" selected>전체</option>
													<option value="1">공지사항</option>
													<option value="2">이벤트</option>
													<option value="3">기타</option>
												</select>
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


			<jsp:include page="../adminfooter.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	<!-- DataTables -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<!-- page script -->
	<script src="resources/js_jsp/baselist.js"></script>
	<script src="resources/js_jsp/notice_list.js"></script>
	<script>
		
	</script>
</body>
</html>