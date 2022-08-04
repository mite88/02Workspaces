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
						<h1 class="m-0 text-dark">회원관리</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
							<li class="breadcrumb-item active">회원관리</li>
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
						<h3 class="card-title">회원정보</h3>

					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>순번</th>
									<th>아이디</th>
									<th>회원명</th>
									<th>전화번호</th>
									<th>생년월일</th>
									<th>이메일</th>
									<th>우편번호</th>
									<th>주소</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="vo" items="${Memberlist}" varStatus="status">
								<tr>
									<td>${vo.m_no}</td>
									<td>${vo.m_id}</td>
									<td>${vo.m_name}</td>
									<td>${vo.m_tel}</td>
									<td>${vo.m_jumin1}</td>
									<td>${vo.m_email}</td>
									<td>${vo.m_zip}</td>
									<td>${vo.m_addr1}</td>
									<td>${vo.m_date}</td>
								</tr>
							</c:forEach>
							</tbody>
						
						<!-- 누르면 테이블이 표시되었다 안되었다 하기 위한것 -->
						<div class="container">
						<div class="center-block" style="width: 100%;">
						
						<div class="btn-group mr-2" role="group">
							<a class="btn btn-secondary toggle-vis"  style="color: white;" data-column="1">아이디</a> 
							<a class="btn btn-secondary toggle-vis"  style="color: white;"data-column="2">회원명</a>  
						</div>		
						
						<div class="btn-group mr-2" role="group">
							<a class="btn btn-secondary toggle-vis" style="color: white;" data-column="3">전화번호</a>  
							<a class="btn btn-secondary toggle-vis" style="color: white;" data-column="4">생년월일</a>
						</div>	
					
						
						<div class="btn-group mr-2" role="group">
							<a class="btn btn-secondary toggle-vis" style="color: white;" data-column="5">이메일</a>
							<a class="btn btn-secondary toggle-vis" style="color: white;" data-column="6">우편번호</a>
						</div>
						
						<div class="btn-group mr-2" role="group">
							<a class="btn btn-secondary toggle-vis" style="color: white;" data-column="7">주소</a>
							<a class="btn btn-secondary toggle-vis" style="color: white;" data-column="8">가입일</a>
						</div>
					
					</div>
					</div>
					
						</table>

					
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
	</c:otherwise></c:choose>
	<!-- DataTables -->
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<!-- page script -->
	<script src="resources/js_jsp/adminmemberlist.js"></script>

</body>
</html>