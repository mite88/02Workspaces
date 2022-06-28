<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

</style>

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
							<div class="page-pretitle">사용자관리</div>
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
							<div class="card">

								<div class="card-body">
								<a href="/Soho_Project/admin.do/office/write" class="btn btn-primary w-100"> 지점추가  </a>

								<!-- 검색 폼 -->
								<form method="get">

									<div class="input-group">
										<select name="searchField" class="form-select input-group-text">
												<option value="o_name">지점명</option>
												<option value="o_addr">주소</option>
												<option value="o_email">이메일</option>
												<option value="o_phone">지점전화번호</option>
												<option value="o_manage_name">매니져명</option>
												<option value="o_manage_phone">매니져전화번호</option>
										</select> 
										<input type="text"  class="form-control" name="searchWord" /> 
							            <button type="submit" class="btn btn-primary">검색하기</button>
							        </div>

								</form>

									<!-- 목록 테이블 -->
									<table id="contact_list" class="table text-center">
										<tr>
											<th>번호</th>
											<th>지점명</th>
											<th>주소</th>
											<th>정보확인</th>
										</tr>
										<!-- 게시물이 없을 때 -->
										<c:choose>
											<c:when test="${empty officeLists }">
												<!-- 리스트에 저장된 게시물이 없을 때 출력부분 -->
												<tr>
													<td colspan="4" align="center">등록된 게시물이 없습니다^^*</td>
												</tr>
											</c:when>
											<c:otherwise>


												<c:forEach items='${officeLists }' var="row" varStatus="loop">
													<tr align="center">

														<td>${map.totalCount -(((map.pageNum-1) * map.pageSize) + loop.index) }</td>
														<td>${row.o_name }</td>
														<td>${row.o_addr }</td>					
														<td>
															<a href="#" class="btn btn-info w-100 " data-bs-toggle="offcanvas" 
															data-bs-target="#offcanvasRight_${row.code }" aria-controls="offcanvasScrolling">
															정보확인</a>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</table>

									<nav aria-label="Page navigation example">
										<ul class="pagination" >${map.pagingImg }</ul>
									</nav>

								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
			<!--page-body end-->

		</div>
		<!--page-wrapper end-->

	</div>

	<!-- footer -->
	<jsp:include page="../layout/footer.jsp" />



	<!-- offcanvas -->
	<c:forEach items='${officeLists }' var="row2" varStatus="loop">
	<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasRight_${row2.code }" 
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header">
			<h5 id="offcanvasRightLabel">지점정보</h5>
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
								<div class="card-title">${row2.o_name }</div>
								<!-- div class="card-subtitle">${row2.code }</div-->
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
								<a class="dropdown-item" href='javascript:void(0)' id='btn2' onclick="frmEditFunc()">지점수정</a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/admin.do/books/list?searchField=o_name&searchWord=${row2.o_name }">예약확인</a> 
								
								<!-- 지점탈퇴 -->
								<form action="<%=request.getContextPath()%>/admin.do/office/delete" method="post"  name="delFrm_${row2.code }" id="delFrm_${row2.code}">
									<div class="col-12">
										<input type="hidden" name="code" value="${row2.code}">
										
										<a class="dropdown-item text-danger" href="#" onclick="frmFunc(delFrm_${row2.code})">지점탈퇴</a>
									</div>
								</form>
								
								
								
							</div>
						</div>
					</div>
				</div>
				<div class="card-body p-0">
					
					<!-- 지점정보 출력 -->

					<div class="row g-3">
					
					<!-- 지점수정 -->
						<form action="<%= request.getContextPath() %>/admin.do/office/modify" method="post" name="registFrm_${row2.code}" enctype="multipart/form-data" >
							<input type="hidden" name="code2" value="${row2.code}">
									
							<input type="hidden" name="prevfile1" value="${ row2.o_img1 }" />
							<input type="hidden" name="prevfile2" value="${ row2.o_img2 }" />

						
							<!-- 지점명 -->
							<div class="col-12">
								<label for="code" class="form-label">지점명</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="o_name" name="o_name"
									 placeholder="" value="${row2.o_name }" readonly>
								</div>
							</div>

							<!-- 사업자등록번호 -->
							<div class="col-sm-12">
								<label for="user_pw1" class="form-label">사업자등록번호</label> 
								<input type="text" class="form-control" id="o_bnumber" name="o_bnumber"
									placeholder="" value="${row2.o_bnumber }" readonly>
							</div>

						
							<!-- 주소 -->
							<div class="col-sm-12">
								<label class="form-label">주소</label> 
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="o_addr" name="o_addr"
									placeholder="" value="${row2.o_addr }" readonly>
									<button class="btn btn-outline-secondary" type="button" id="button-addr">주소검색</button>
								</div>
							</div>


							<!-- phone -->
							<div class="col-12">
								<label for="user_name" class="form-label">전화번호</label> 
								<input type="text" class="form-control" id="o_phone"
									name="o_phone" placeholder="" value="${row2.o_phone }" readonly>
								
							</div>
							
							<!-- fax -->
							<div class="col-12">
								<label for="user_name" class="form-label">Fax</label> 
								<input type="text" class="form-control" id="o_fax"
									name="o_fax" placeholder="" value="${row2.o_fax }" readonly>
								
							</div>
							
							<!-- o_manage_name -->
							<div class="col-12">
								<label for="user_name" class="form-label">담당자명</label> 
								<input type="text" class="form-control" id="o_manage_name"
									name="o_manage_name" placeholder="" value="${row2.o_manage_name }" readonly>
								
							</div>
							
							<!-- o_manage_phone -->
							<div class="col-12">
								<label for="user_name" class="form-label">담장자전화번호</label> 
								<input type="text" class="form-control" id="o_manage_phone"
									name="o_manage_phone" placeholder="" value="${row2.o_manage_phone }" readonly>
								
							</div>
							
							<!-- email -->
							<c:set var="set_email" value="${fn:split(row2.o_email,'@')}" />

							<div class="col-12">
								<label for="user_email" class="form-label">이메일</label>
								<div class="input-group has-validation">
									<input type="text" class="form-control" id="o_email1" name="o_email1" 
									placeholder="o_email1" value="${set_email[0]}" readonly> 
									
									<span class="input-group-text">@</span> 
										
									<input type="text" class="form-control" id="o_email2" name="o_email2"
										placeholder="o_email2" value="${set_email[1]}" readonly> 
										
									<select class="form-select " id="email_domain" name="email_domain" 
									onchange="inputEmail(this.form);" disabled >
										
										<option value="" selected="selected">Choose...</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</div>

							</div>

							
							<!-- o_banknumber -->
							<div class="col-12">
								<label for="user_name" class="form-label">계좌번호</label> 
								<input type="text" class="form-control" id="o_banknumber"
									name="o_banknumber" placeholder="" value="${row2.o_banknumber }" readonly>
							</div>
							
							<!-- 예금주, 이름 같이 적기 -->
							<div class="col-12">
								<label for="user_name" class="form-label">은행명, 예금주</label> 
								<input type="text" class="form-control" id="o_bankname"
									name="o_bankname" placeholder="" value="${row2.o_bankname }" readonly>
							</div>
							
							<!-- 회사이미지1 -->
							<div class="col-12 files">
								<label for="o_img1" class="form-label">지점이미지1</label> 
								 <input class="form-control" type="file" id="o_img1" name="o_img1">
							</div>
							
							<!-- 회사이미지2 -->
							<div class="col-12 files">
								<label for="o_img2" class="form-label">지점이미지2</label> 
								 <input class="form-control" type="file" id="o_img2" name="o_img2">
							</div>
							
							<label for="user_name" class="form-label">지점이미지</label> 
							<!-- 회사이미지 나오게하기 -->
							<div class="col-md-6 imgs float-start">
								<img src="<%=request.getContextPath()%>/Uploads/office/${row2.o_img1}" class="img-fluid" alt="o1">
							</div>
							
							<div class="col-md-6 imgs float-end">
								<img src="<%=request.getContextPath()%>/Uploads/office/${row2.o_img2}" class="img-fluid" alt="o2">
							</div>
						

							<!-- 설명 -->
							<div class="col-12">
								<label for="user_info" class="form-label">설명</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="o_content" name="o_content"
										rows="6" readonly>${row2.o_content}</textarea>
								</div>
							</div>
							
							<!-- 가격정보 -->
							<div class="col-12">
								<label for="user_info" class="form-label">가격정보</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="o_pay" name="o_pay"
										rows="6" readonly>${row2.o_pay}</textarea>
								</div>
							</div>
							
							<!-- 서비스 -->
							<div class="col-12">
								<label for="user_info" class="form-label">서비스</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="o_service" name="o_service"
										rows="6" readonly>${row2.o_service}</textarea>
								</div>
							</div>
							
							<!-- 타입설명 -->
							<div class="col-12">
								<label for="user_info" class="form-label">타입</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="o_type" name="o_type"
										rows="6" readonly>${row2.o_type}</textarea>
								</div>
							</div>
							
							
							
							<hr class="my-4 ">
							<div class="col-12">
								<button class="w-100 btn btn-primary btn-lg " id="btn_none1" type="submit" disabled>수정</button>
							</div>

						</form>
					</div>

					<!-- 지점정보 끝 -->
					
				</div>
			</div>

		</div>
	</div>
	</c:forEach>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		window.onload = function(){
		    document.getElementById("button-addr").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("o_addr").value = data.address; // 주소 넣기
		            }
		        }).open();
		    });
		}
	</script>
	
	
	
	<script>
	
	//초기
	$(".offcanvas-body .files").hide();
	$(".offcanvas-body .imgs").show();
	$(".offcanvas-body button").attr("disabled", true);
	
	$(".offcanvas-header .text-reset").click( function() {
		//alert("!!!");
		$(".offcanvas-body .files").hide();
		$(".offcanvas-body .imgs").show();
		$(".offcanvas-body input").attr("readonly", true);
		$(".offcanvas-body textarea").attr("readonly", true);
		$(".offcanvas-body #code").attr("readonly", true);
		$(".offcanvas-body button").attr("disabled", true);
		$(".offcanvas-body select").attr("disabled", true);
	} );
	
	//수정하기 클릭시 활성화
	function frmEditFunc() {

		//속성 변경
		$(".offcanvas-body .files").show();
		//$(".offcanvas-body .imgs").hide();
		
		$(".offcanvas-body input").attr("readonly", false);
		$(".offcanvas-body textarea").attr("readonly", false);
		$(".offcanvas-body #code").attr("readonly", true);
		$(".offcanvas-body button").attr("disabled", false);
		$(".offcanvas-body select").attr("disabled", false);
		//return false;
	
	}

	

	//이메일 select 선택시
	function inputEmail(form) {
		var e_domain_str = form.email_domain.value;
		if (e_domain_str == "") {
			form.user_email2.readOnly = false;
			form.user_email2.value = '';
		} else {
			form.user_email2.readOnly = true;
			form.user_email2.value = e_domain_str;
		}

	}

	//지점탈퇴
	function frmFunc(form) {
		
		form.submit();

	}


</script>

</c:otherwise>

	</c:choose>
</body>
</html>
