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
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0 text-dark">문의게시판</h1>
							</div>
							<!-- /.col -->
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
									<li class="breadcrumb-item active">문의게시판</li>
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
									<h3 class="card-title">문의게시판</h3>
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
															<td>
																&nbsp;&nbsp;&nbsp;<img src="http://ijuju88.cdn3.cafe24.com/img/point.PNG" width="20px;">
																답변]<a href="home_questionview.do?qb_no=${vo.qb_no}">${vo.qb_title}</a>
															</td>
															</c:when>
																<c:when test="${vo.qb_remove==1}">
																<td style="color: red;">원본글이 없습니다</td>
															</c:when>
															<c:otherwise>
															<td>
																<a href="home_questionview.do?qb_no=${vo.qb_no}">${vo.qb_title}</a>
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
												<input type="button" class="btn btn-outline-dark writeadmin"
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


			<jsp:include page="../adminfooter.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	<!-- DataTables -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<!-- page script -->
	<script src="resources/js_jsp/question_list.js?ver=2"></script>
	<script>
		
	</script>
</body>
</html>