<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>관리자</title>

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
		
		<!-- bootstrap-datepicker -->
		<script src="<%=request.getContextPath()%>/user/resources/lib/bootstrap-datepicker-master/js/bootstrap-datepicker.js"></script>
		<script src="<%=request.getContextPath()%>/user/resources/lib/bootstrap-datepicker-master/js/bootstrap-datepicker.kr.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/user/resources/lib/bootstrap-datepicker-master/css/bootstrap-datepicker.css">
	
		<!-- fullcalendar CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<!-- fullcalendar 언어 CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	


		<div class="page-wrapper">
			<div class="container-xl">
				<!-- Page title -->
				<div class="page-header d-print-none">
					<div class="row g-2 align-items-center">
						<div class="col">
							<!-- Page pre-title -->
							<div class="page-pretitle">Overview</div>
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
							<div class="tab-content w-100">


								<div class="row my-5">

									<div class="col-md-12">
									
									<!-- 검색 폼 -->
									<form method="get">
	
										<div class="input-group">
											<select name="searchField" class="form-select input-group-text">
													<option value="user_id">아이디</option>
													<option value="pay_type">입금여부</option>
													<option value="o_name">지점명</option>
											</select> 
											<input type="text"  class="form-control" name="searchWord" /> 
								            <button type="submit" class="btn btn-primary">검색하기</button>
								        </div>
	
									</form>

										<!-- 목록 테이블 -->
										<table id="contact_list" class="table text-center">
											<tr>
												<th>일련번호</th>
												<th>번호</th>
												<th>제목</th>
												<th>기간</th>
												<th>입금여부</th>
												<th>오피스명</th>
												<th>정보보기</th>
												
											</tr>
											<!-- 게시물이 없을 때 -->
											<c:choose>
												<c:when test="${empty Lists }">
													<!-- 리스트에 저장된 게시물이 없을 때 출력부분 -->
													<tr>
														<td colspan="7" align="center">등록된 게시물이 없습니다^^*</td>
													</tr>
												</c:when>
												<c:otherwise>


													<c:forEach items='${Lists }' var="row" varStatus="loop">
														<tr align="center">
															<td>${row.number }</td>
															<td>${map.totalCount -(((map.pageNum-1) * map.pageSize) + loop.index) }</td>

															<td>${row.title }</td>
															<td><fmt:formatDate value="${row.start }"
																	pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
																	value="${row.end }" pattern="yyyy-MM-dd" /></td>
															<td>${row.pay_type }</td>
															<td>
																<!-- 사무실점 찾기용 --> 
																${row.o_name } 
															</td>
															<td>
																<a href="#" class="btn btn-info w-100 " data-bs-toggle="offcanvas" 
																data-bs-target="#offcanvasRight_${row.number }" aria-controls="offcanvasScrolling">
																정보확인</a>
															</td>
															
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</table>

										<nav aria-label="Page navigation example">
											<ul class="pagination">${map.pagingImg }</ul>
										</nav>

									</div>

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
		
		
		<!-- offcanvas -->
	<c:forEach items='${Lists }' var="row2" varStatus="loop">
	<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasRight_${row2.number }" 
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header">
			<h5 id="offcanvasRightLabel">예약정보</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">

			<div class="card" style="    border: none;">
				<div class="card-header">
					<div>
						<div class="row align-items-center">
							<div class="col-auto">
								
							</div>
							<div class="col">
								<div class="card-title">${row2.user_id }의 예약정보</div>
							</div>
						</div>
					</div>
					<div class="card-actions">
						<div class="dropdown">
							<a href="#" class="btn-action dropdown-toggle"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<!-- Download SVG icon from http://tabler-icons.io/i/dots-vertical -->
								<i class="ti ti-dots-vertical icon-demo-size-1_5"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-end" style="">
								<a class="dropdown-item" href='javascript:void(0)' id='btn2' onclick="frmEditFunc()">예약수정</a> 
								
								<!-- 예약탈퇴 -->
								<form action="<%=request.getContextPath()%>/admin.do/books/delete" method="post"  name="delFrm_${row2.number }" id="delFrm_${row2.number}">
									<div class="col-12">
										<input type="hidden" class="form-control" id="d_number"   name="d_number" value="${row2.number}">
										<a class="dropdown-item text-danger" href="#" onclick="frmFunc(delFrm_${row2.number })">예약취소</a>
									</div>
								</form>
								
								
								
							</div>
						</div>
					</div>
				</div>
				<div class="card-body p-0">
					
					<!-- 예약정보 출력 -->

					<div class="row g-3">
					
					<!-- 예약수정 -->
						<form action="<%= request.getContextPath() %>/admin.do/books/modify" method="post" name="registFrm_${row2.number}" onsubmit="return registValdidate(this)">
							<input type="hidden" class="form-control" id="user_id"   name="user_id" value="${row2.user_id}">
							<input type="hidden" class="form-control" id="number"   name="number" value="${row2.number}">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">title:</label>
								<input type="text" class="form-control" id="title" name="title" value="${row2.title}">
							</div>

							
							<select class="office_num" name="office_number">
								<c:forEach items='${office_list }' var="row3" varStatus="loop">
									<option value="${row3.code }" ${row3.code ==row2.office_num ?'selected':'' }>${row3.o_name }</option>
								</c:forEach>
							</select>

							<div class="mb-3">
								<div class="input-group has-validation">
									<input class="from_date form-control" placeholder="Select start date" 
									type="text" id="startDate" name="startDate" value="<fmt:formatDate value="${row2.start}" pattern="yyyy-MM-dd"/>">
									<span class="input-group-text">~</span> 
									<input class="to_date form-control" placeholder="Select end date" 
									type="text" id="endDate" name="endDate" value="<fmt:formatDate value="${row2.end}" pattern="yyyy-MM-dd"/>">
								</div>
							</div>
							
							<!-- 입금여부체크 -->
							<div class="mb-3">
								<label class="form-check">
									<input class="form-check-input" type="radio" ${row2.pay_type =="N" ?'checked':'' } 
	                                id="pay_type" name="pay_type" value="N">
	                                 <span class="form-check-label">미입금</span>
                                </label>
                               	<label class="form-check"> 
	                                <input class="form-check-input" type="radio" ${row2.pay_type =="Y" ?'checked':'' } 
	                                id="pay_type" name="pay_type" value="Y">
	                                <span class="form-check-label">입금</span>
	                            </label>
							</div>
						
							<div class="mb-3">
								<label for="message-text" class="col-form-label">Message:</label>
								<textarea class="form-control" id="message-text" name="message-text">${row2.message}</textarea>
							</div>
								
							<hr class="my-4 ">
							<div class="col-12">
								<button class="w-100 btn btn-primary btn-lg " id="btn_none1" type="submit" disabled>수정</button>
							</div>

						</form>
					</div>

					<!-- 예약정보 끝 -->
					
				</div>
			</div>

		</div>
	</div>
	</c:forEach>

	</div>
	
	<script>
	
	$(".from_date").datepicker({
	    format: 'yyyy-mm-dd',
	    autoclose: true,
	    language : "kr",
	}).on('changeDate', function (selected) {
		var date = new Date(selected.date.valueOf());
		var startDate =   new Date(date.setDate(date.getDate() + 60));

	    $('.to_date').datepicker('setStartDate', startDate);
	}).on('clearDate', function (selected) {
	    $('.to_date').datepicker('setStartDate', null);
	});

	$(".to_date").datepicker({
	    format: 'yyyy-mm-dd',
	    autoclose: true,
	    language : "kr"
	});
	
	//초기
	$(".offcanvas-body input").attr("readonly", true);
	$(".offcanvas-body input").attr("disabled", true);
	$(".offcanvas-body textarea").attr("readonly", true);
	$(".offcanvas-body #user_id").attr("readonly", true);
	$(".offcanvas-body button").attr("disabled", true);
	$(".offcanvas-body select").attr("disabled", true);
	
	$(".offcanvas-body .from_date").datepicker('option', 'disabled', true);
	$(".offcanvas-body .to_date").datepicker('option', 'disabled', true);
	
	$(".offcanvas-header .text-reset").click( function() {
		$(".offcanvas-body input").attr("readonly", true);
		$(".offcanvas-body input").attr("disabled", true);
		$(".offcanvas-body textarea").attr("readonly", true);
		$(".offcanvas-body #user_id").attr("readonly", true);
		$(".offcanvas-body button").attr("disabled", true);
		$(".offcanvas-body select").attr("disabled", true);
		
		$(".offcanvas-body .from_date").datepicker('option', 'disabled', true);
		$(".offcanvas-body .to_date").datepicker('option', 'disabled', true);
	} );
	
		
	//수정하기 클릭시 활성화
	function frmEditFunc() {

		//속성 변경
		$(".offcanvas-body input").attr("readonly", false);
		$(".offcanvas-body input").attr("disabled", false);
		$(".offcanvas-body textarea").attr("readonly", false);
		$(".offcanvas-body #user_id").attr("readonly", true);
		$(".offcanvas-body button").attr("disabled", false);
		$(".offcanvas-body select").attr("disabled", false);
		
		$(".offcanvas-body .from_date").datepicker('option', 'disabled', false);
		$(".offcanvas-body .to_date").datepicker('option', 'disabled', false);
		//return false;
	
	}
	
	//예약취소
	function frmFunc(form) {
		//비번입력을 받아 탈퇴합니다
		var result = confirm('취소를 하시겠습니까?');

		if(result){
			form.submit();
		}
		

	}
	
	</script>
	
	</c:otherwise>

	</c:choose>
</body>
</html>
