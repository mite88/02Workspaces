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
								
								
									<!-- 검색 폼 -->
								<form method="get">

									<div class="input-group">
										<select name="searchField" class="form-select input-group-text">
												<option value="user_id">아이디</option>
												<option value="user_name">이름</option>
												<option value="user_email">이메일</option>
												<option value="user_phone">전화번호</option>
										</select> 
										<input type="text"  class="form-control" name="searchWord" /> 
							            <button type="submit" class="btn btn-primary">검색하기</button>
							        </div>

								</form>

									<!-- 목록 테이블 -->
									<table id="contact_list" class="table text-center">
										<tr>
											<th>번호</th>
											<th>아이디</th>
											<th>이름</th>
											<th>가입일</th>
											<th>등급</th>
											<th>정보확인</th>
										</tr>
										<!-- 게시물이 없을 때 -->
										<c:choose>
											<c:when test="${empty memberLists }">
												<!-- 리스트에 저장된 게시물이 없을 때 출력부분 -->
												<tr>
													<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
												</tr>
											</c:when>
											<c:otherwise>


												<c:forEach items='${memberLists }' var="row" varStatus="loop">
													<tr align="center">

														<td>${map.totalCount -(((map.pageNum-1) * map.pageSize) + loop.index) }</td>
														<td>${row.user_id }</td>
														<td>${row.user_name }</td>
														<td><fmt:formatDate value="${row.megister_date }"
																pattern="yyyy-MM-dd hh:mm" /></td>
														<td>${row.memberLevel }</td>
														<td>
															<a href="#" class="btn btn-info w-100 " data-bs-toggle="offcanvas" 
															data-bs-target="#offcanvasRight_${row.user_id }" aria-controls="offcanvasScrolling">
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
	<c:forEach items='${memberLists }' var="row2" varStatus="loop">
	<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasRight_${row2.user_id }" 
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header">
			<h5 id="offcanvasRightLabel">회원정보</h5>
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
								<div class="card-title">${row2.user_id }</div>
								<div class="card-subtitle">${row2.memberLevel }</div>
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
								<a class="dropdown-item" href='javascript:void(0)' id='btn2' onclick="frmEditFunc()">회원수정</a> 
								<a class="dropdown-item" href="#">예약확인</a> 
								
								<!-- 회원탈퇴 -->
								<form action="<%=request.getContextPath()%>/admin.do/member/delete" method="post"  name="delFrm_${row2.user_id }" id="delFrm_${row2.user_id}">
									<div class="col-12">
										<input type="hidden" name="del_id" value="${row2.user_id}">
										<input type="hidden" name="del_pw">
										<a class="dropdown-item text-danger" href="#" onclick="frmFunc(delFrm_${row2.user_id})">회원탈퇴</a>
									</div>
								</form>
								
								
								
							</div>
						</div>
					</div>
				</div>
				<div class="card-body p-0">
					
					<!-- 회원정보 출력 -->

					<div class="row g-3">
					
					<!-- 회원수정 -->
						<form action="../member/modify" method="post" name="registFrm_${row2.user_id}" onsubmit="return registValdidate(this)">
						
							<!-- id -->
							<div class="col-12">
								<label for="user_id" class="form-label">ID</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="user_id" name="user_id"
									 placeholder="" value="${row2.user_id }" readonly>
								</div>
								<div class="invalid-id"></div>
								<input type="hidden" name="idDuplication" value="idUnckeck">
							</div>

							<!-- pw -->
							<div class="col-sm-6">
								<label for="user_pw1" class="form-label">패스워드</label> 
								<input type="text" class="form-control" id="user_pw1" name="user_pw1"
									placeholder="" value="${row2.user_pw }" readonly>
							</div>

							<div class="col-sm-6">
								<label for="user_pw2" class="form-label">패스워드 확인</label> 
								<input type="text" class="form-control" id="user_pw2" name="user_pw2"
									placeholder="" value="${row2.user_pw }" readonly>
							</div>

							<div class="col-12">
								<div class="invalid-pw"></div>
							</div>

							<!-- name -->
							<div class="col-12">
								<label for="user_name" class="form-label">이름</label> 
								<input type="text" class="form-control" id="user_name"
									name="user_name" placeholder="" value="${row2.user_name }" readonly>
								<div class="invalid-name"></div>
							</div>

							<!-- email -->
							<c:set var="set_email" value="${fn:split(row2.user_email,'@')}" />

							<div class="col-12">
								<label for="user_email" class="form-label">이메일</label>
								<div class="input-group has-validation">
									<input type="text" class="form-control" id="user_email1" name="user_email1" 
									placeholder="user_email1" value="${set_email[0]}" readonly> 
									
									<span class="input-group-text">@</span> 
										
									<input type="text" class="form-control" id="user_email2" name="user_email2"
										placeholder="user_email2" value="${set_email[1]}" readonly> 
										
									<select class="form-select " id="email_domain" name="email_domain" 
									onchange="inputEmail(this.form);" disabled >
										
										<option value="" selected="selected">Choose...</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</div>

							</div>

							<div class="col-12">
								<div class="invalid-email"></div>
							</div>

							<!-- phone -->
							<div class="col-12">
								<label for="user_phone" class="form-label">휴대폰번호</label>
								<div class="input-group has-validation">
									<select class="form-select" id="country" name="user_phone1" required="" disabled>

										<option value="">Choose...</option>
										<c:set var="phone_list" value="010,011,016,017,018,019" scope="application" />

										<c:forEach items="${fn:split(phone_list,',') }" var="one" varStatus="loop">
											<option value="${one}" ${fn:indexOf(row2.user_phone,one) >= 0 ? 'selected':''}>${one}</option>
										</c:forEach>

									</select> 
									
									<c:set var="set_phone" value="${fn:split(row2.user_phone,'-')}" />
									
									<input type="text" class="form-control" id="user_phone2" name="user_phone2" 
									placeholder="user_phone2" value="${set_phone[1]}" readonly> 
									
									<span class="input-group-text">-</span> 
									
									<input type="text" class="form-control" id="user_phone3" name="user_phone3"
										placeholder="user_phone3" value="${set_phone[2]}" readonly>

								</div>
							</div>

							<div class="col-12">
								<div class="invalid-phone"></div>
							</div>

							<!-- hoddy -->
								<!-- ,로 구분된걸 나누어서 배열로 받기위해서 ...-->

								<div class="col-12">
									<label for="user_hoddy" class="form-label">관심분야</label>
									<div class="input-group has-validation">
										<c:set var="hoddy_list" value="캠핑,등산,영화,독서"
											scope="application" />

										<c:forEach items="${fn:split(hoddy_list,',') }" var="one"
											varStatus="loop">
											<input class="form-check-input" type="checkbox"
												name="user_hoddy" value="${one}" id="ch${loop.count}"
												${fn:indexOf(row2.user_hoddy,one) >= 0 ? 'checked':''} readonly>
											<label class="form-check-label" for="ch${loop.count}">${one}&nbsp;&nbsp;</label>
										</c:forEach>


									</div>

									<div class="invalid-hoddy"></div>
								</div>

							<!-- job -->
								<div class="col-12">
									<label for="user_job" class="form-label">직업</label>
									<div class="input-group has-validation">
										<select class="form-select" id="user_job" name="user_job" disabled>
											<option value="">Choose...</option>
											<option value="교사" ${row2.user_job=='교사'?'selected':'' }>교사</option>
											<option value="변호사" ${row2.user_job=='변호사'?'selected':'' }>변호사</option>
											<option value="의사" ${row2.user_job=='의사'?'selected':'' }>의사</option>
											<option value="기술사" ${row2.user_job=='기술사'?'selected':'' }>기술사</option>
										</select>
									</div>

									<div class="invalid-job"></div>
								</div>

							<!-- info -->
							<div class="col-12">
								<label for="user_info" class="form-label">하고싶은말</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="user_info" name="user_info"
										rows="6" readonly>${row2.user_info}</textarea>
								</div>
							</div>
							
							<!-- 등급 -->
							<div class="col-12">
								<label for="memberLevel" class="form-label">회원등급</label>
								<select class="form-select" id="memberLevel" name="memberLevel" disabled>
									<option value="">Choose...</option>
									<option value="admin" ${row2.memberLevel=='admin'?'selected':'' }>admin</option>
									<option value="user" ${row2.memberLevel=='user'?'selected':'' }>user</option>
									<option value="vip" ${row2.memberLevel=='vip'?'selected':'' }>vip</option>

								</select>
							</div>
							
							<hr class="my-4 ">
							<div class="col-12">
								<button class="w-100 btn btn-primary btn-lg " id="btn_none1" type="submit" disabled>수정</button>
							</div>

						</form>
					</div>

					<!-- 회원정보 끝 -->
					
				</div>
			</div>

		</div>
	</div>
	</c:forEach>
	
	
	<script>
	$(".offcanvas-body input").attr("readonly", true);
	$(".offcanvas-body textarea").attr("readonly", true);
	$(".offcanvas-body #user_id").attr("readonly", true);
	$(".offcanvas-body button").attr("disabled", true);
	$(".offcanvas-body select").attr("disabled", true);
	
	//초기
	$(".offcanvas-header .text-reset").click( function() {
		//alert("!!!");
		$(".offcanvas-body input").attr("readonly", true);
		$(".offcanvas-body textarea").attr("readonly", true);
		$(".offcanvas-body #user_id").attr("readonly", true);
		$(".offcanvas-body button").attr("disabled", true);
		$(".offcanvas-body select").attr("disabled", true);
	} );
	
	//수정하기 클릭시 활성화
	function frmEditFunc() {

		//속성 변경
		$(".offcanvas-body input").attr("readonly", false);
		$(".offcanvas-body textarea").attr("readonly", false);
		$(".offcanvas-body #user_id").attr("readonly", true);
		$(".offcanvas-body button").attr("disabled", false);
		$(".offcanvas-body select").attr("disabled", false);
		//return false;
	
	}

	//회원가입 유효성검사
	function registValdidate(form) {
		
		//alert(form.user_name.value);
	
		//invalid 지우기
		var invalid_text = document.querySelectorAll("div[class*='invalid']");

		for (var x = 0; x < invalid_text.length; x++) {
			invalid_text[x].innerText = "";
		}

		//invalid 지우기
		document.querySelectorAll("[class*='invalid-']").innerText = "";

		//id는 확인할 필요없습니다
		if (form.user_pw1.value != form.user_pw2.value) {
			//alert("비밀번호가 다릅니다. 다시입력해주세요");
			$(".invalid-pw").text("비밀번호가 다릅니다. 다시입력해주세요");
			$(".invalid-pw").css("color" , "red");
			form.user_pw1.value = "";
			form.user_pw2.value = "";
			form.user_pw1.focus();
			return false;
		} else if (!checkExistData(form.user_name.value, "invalid-name", "이름을 입력해주세요")) {
			//이름:길이
			form.user_name.focus();
			return false;
		} else if (form.user_email1.value == '' || form.user_email2.value == '') {
			//휴대폰번호
			//alert("이메일을 입력해주세요");
			$(".invalid-email").text("이메일을 입력해주세요");
			$(".invalid-email").css("color" , "red");
			form.user_email1.focus();
			return false;

		} else if (form.user_phone1.value == '' || form.user_phone2.value == ''
				|| form.user_phone3.value == '') {
			//휴대폰번호
			//alert("휴대폰번호를 입력해주세요");
			$(".invalid-phone").text("휴대폰번호를 입력해주세요");
			$(".invalid-phone").css("color" , "red");
			
			form.user_phone1.focus();
			return false;

		} else if (checkboxes(form.user_hoddy) < 1) {
			//관심분야
			/*
			checbox의 경우 같은name이 여러개이기 때문에 다음과 같은 방법으로 
			갯수를 체크해야한다
			 */
			//alert("관심분야를 입력해주세요");
			$(".invalid-hoddy").text("관심분야를 입력해주세요");
			$(".invalid-hoddy").css("color" , "red");
			
			return false;

		} else if (form.user_job.value == '') {
			//직업
			//alert("직업을 선택해주세요");
			$(".invalid-job").text("직업을 선택해주세요");
			$(".invalid-job").css("color" , "red");
			
			form.user_job.focus();
			return false;

		}

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

	//회원탈퇴
	function frmFunc(form) {
		//비번입력을 받아 탈퇴합니다
		var inputString = prompt('탈퇴를 하실려면 비밀번호를 입력해주세요.', '비밀번호입력');

		form.del_pw.value = inputString;
		form.submit();

	}

	//체크박스 체크한 갯수구하기
	function checkboxes(tagName) {
		var count = 0;

		for (var i = 0; i < tagName.length; i++) {
			if (tagName[i].type == "checkbox" && tagName[i].checked == true) {
				count++;
			}

		}

		//alert("!"+count);
		return count;
	}

	function commonFocusMove(obj, charLen, nextObj) {

		if (obj.value.length == charLen) {
			document.getElementsByName(nextObj)[0].focus();
		}

		//alert("글자수 "+charLen+"이 되면 "+nextObj+"으로 포커스가 이동합니다.");
	}

	// 유효검사 알림창 전용함수    
	function checkExistData(inp, input, msg1) {
		if (inp == "") {
			//alert(msg1);
			$("."+input+"").text(msg1);
			$("."+input+"").css("color" , "red");
			
			//document.getElementsByClassName(input)[0].innerText = msg1;
			//document.getElementsByClassName(input)[0].style.color = "red";
			return false;
		}

		return true;
	}
</script>

</c:otherwise>

	</c:choose>
</body>
</html>
