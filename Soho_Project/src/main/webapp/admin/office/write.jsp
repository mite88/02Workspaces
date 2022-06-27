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
<title>관리자</title>
<script type="text/javascript">
	//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
	function validateForm(form){
		if(form.o_name.value == ""){
			alert("지점명을 입력하세요.");
			form.o_name.focus();
			return false;
		}
		
	}
	

	//이메일 select 선택시
	function inputEmail(form) {
		var e_domain_str = form.email_domain.value;
		if (e_domain_str == "") {
			form.o_email2.readOnly = false;
			form.o_email2.value = '';
		} else {
			form.o_email2.readOnly = true;
			form.o_email2.value = e_domain_str;
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
							<div class="page-pretitle">Overview</div>
							<h2 class="page-title">Dashboard</h2>
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

									<form action="../office/write" method="post" name="registFrm" enctype="multipart/form-data" onsubmit="return validateForm(this);">
							
							<!-- 지점명 -->
							<div class="col-12">
								<label class="form-label">지점명</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="o_name" name="o_name"  placeholder="" >
								</div>
							</div>

							<!-- 사업자등록번호 -->
							<div class="col-sm-12">
								<label class="form-label">사업자등록번호</label> 
								<input type="text" class="form-control" id="o_bnumber" name="o_bnumber" placeholder="" >
							</div>

						
							<!-- 주소 -->
							<div class="col-sm-12">
								<label class="form-label">주소</label> 
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="o_addr" name="o_addr">
									<button class="btn btn-outline-secondary" type="button" id="button-addr">주소검색</button>
								</div>
							</div>
							
							
							<!-- phone -->
							<div class="col-12">
								<label class="form-label">전화번호</label> 
								<input type="text" class="form-control" id="o_phone"name="o_phone">
								
							</div>
							
							<!-- fax -->
							<div class="col-12">
								<label class="form-label">Fax</label> 
								<input type="text" class="form-control" id="o_fax" name="o_fax">
								
							</div>
							
							<!-- o_manage_name -->
							<div class="col-12">
								<label class="form-label">담당자명</label> 
								<input type="text" class="form-control" id="o_manage_name"
									name="o_manage_name" placeholder="" >
								
							</div>
							
							<!-- o_manage_phone -->
							<div class="col-12">
								<label class="form-label">담장자전화번호</label> 
								<input type="text" class="form-control" id="o_manage_phone"
									name="o_manage_phone" placeholder="" >
								
							</div>
							
							<!-- email -->
						
							<div class="col-12">
								<label class="form-label">이메일</label>
								<div class="input-group has-validation">
									<input type="text" class="form-control" id="o_email1" name="o_email1" placeholder="o_email1" > 
									
									<span class="input-group-text">@</span> 
										
									<input type="text" class="form-control" id="o_email2" name="o_email2" placeholder="o_email2" > 
										
									<select class="form-select " id="email_domain" name="email_domain" 
									onchange="inputEmail(this.form);" >
										
										<option value="" selected="selected">Choose...</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</div>

							</div>

							
							<!-- o_banknumber -->
							<div class="col-12">
								<label class="form-label">계좌번호</label> 
								<input type="text" class="form-control" id="o_banknumber" name="o_banknumber" >
							</div>
							
							<!-- 예금주, 이름 같이 적기 -->
							<div class="col-12">
								<label  class="form-label">은행명, 예금주</label> 
								<input type="text" class="form-control" id="o_bankname"	name="o_bankname" placeholder="" >
							</div>
							
							<!-- 회사이미지1 -->
							<div class="col-12 files">
								<label class="form-label">지점이미지1</label> 
								 <input class="form-control" type="file" id="o_img1" name="o_img1">
							</div>
							
							<!-- 회사이미지2 -->
							<div class="col-12 files">
								<label class="form-label">지점이미지2</label> 
								 <input class="form-control" type="file" id="o_img2" name="o_img2">
							</div>

							<!-- 설명 -->
							<div class="col-12">
								<label class="form-label">설명</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="o_content" name="o_content"
										rows="6" ></textarea>
								</div>
							</div>
							
							<!-- 가격정보 -->
							<div class="col-12">
								<label class="form-label">가격정보</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="o_pay" name="o_pay"
										rows="6" ></textarea>
								</div>
							</div>
							
							<!-- 서비스 -->
							<div class="col-12">
								<label class="form-label">서비스</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="o_service" name="o_service"
										rows="6" ></textarea>
								</div>
							</div>
							
							<!-- 타입설명 -->
							<div class="col-12">
								<label class="form-label">타입</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="o_type" name="o_type"
										rows="6" ></textarea>
								</div>
							</div>
							
							
							
							<hr class="my-4 ">
							<div class="col-12">
								<button class="w-100 btn btn-primary btn-lg " id="btn_none1" type="submit">작성</button>
							</div>

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

	</div>
</c:otherwise>

	</c:choose>
</body>
</html>
