<%--
/**
 * 1. 프로젝트명 : Register.jsp
 * 2. 작성일 : 2022. 6. 4. 오후 7:06:07
 * 3. 작성자 : mite88
 * 4. 설명 : 회원가입
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register.jsp</title>
<script src="<%=request.getContextPath()%>/resources/jQuery/jquery-3.6.0.min.js"></script>

<script>
	//회원가입 유효성검사
	function registValdidate(form) {
		
		var id_RegExp = /^[a-zA-Z0-9]{8,16}$/; //id 정규식
    	var pw_RegExp = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/; //password 정규식
    	var name_RegExp = /^[가-힣]{2,}|[a-zA-Z]{2,}$/; //name 정규식(|로 하여 구분함)
    	var email_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//email정규식
    	var phone_RegExp = /^\d{3}-\d{3,4}-\d{4}$/; //폰번호 정규식

		var email_str = form.user_email1.value+"@"+form.user_email2.value; //이메일
    	var mobile_str = form.user_phone1.value+"-"+form.user_phone2.value+"-"+form.user_phone3.value;//전화

		//invalid 지우기
		var invalid_text = document.querySelectorAll("div[class*='invalid']");

		for (var x = 0; x < invalid_text.length; x++) {
			invalid_text[x].innerText = "";
		}

		if (!checkExistData(form.user_id.value, "invalid-id", id_RegExp,
				"아이디를 입력해주세요","아이디 형식에 맞쳐주세요")) {
			form.user_id.focus();
			return false;
		}else if (form.idDuplication.value == 'idUnckeck') {
			//idcheck 여부
			alert("아이디중복확인을 하세요");
			form.user_id.focus();
			return false;
		} else if (!checkExistData(form.user_pw1.value, "invalid-pw", pw_RegExp,
				"비밀번호를 입력해주세요", "비밀번호 형식을 맞쳐주세요")) {
			//pw
			form.user_pw1.focus();
			return false;
		} else if (form.user_pw1.value != form.user_pw2.value) {
			alert("비밀번호가 다릅니다. 다시입력해주세요");
			form.user_pw1.value = "";
			form.user_pw2.value = "";
			form.user_pw1.focus();
			return false;
		} else if (!checkExistData(form.user_name.value, "invalid-name", name_RegExp,
				"이름을 입력해주세요","이름을 입력해주세요")) {
			//이름:길이
			form.user_name.focus();
			return false;
		} else if (form.user_email1.value == '' || form.user_email2.value == '') {
			//휴대폰번호
			//alert("이메일을 입력해주세요");
			document.getElementsByClassName("invalid-email")[0].innerText = "이메일을 입력해주세요";
			document.getElementsByClassName("invalid-email")[0].style.color = "red";
			form.user_email1.focus();
			return false;

		} else if(!checkExistData(email_str, "invalid-email", email_RegExp,
    			"이메일을 입력해주세요"
    			, "이메일을 입력해주세요")){
    		//이메일
    		form.user_email1.focus();
    		return false;
    	}else if(!checkExistData(mobile_str, "invalid-phone", phone_RegExp,
    			"폰번호를 입력해주세요"
    			, "폰번호를 입력해주세요")){
    		//폰번호
    		form.user_phone1.focus();
    		return false;
    	}else if (form.user_phone1.value == '' || form.user_phone2.value == ''
				|| form.user_phone3.value == '') {
			//휴대폰번호
			//alert("휴대폰번호를 입력해주세요");
			document.getElementsByClassName("invalid-phone")[0].innerText = " 휴대폰번호를 입력해주세요";
			document.getElementsByClassName("invalid-phone")[0].style.color = "red";
			form.user_phone1.focus();
			return false;

		} else if (checkboxes(form.user_hoddy) < 1) {
			//관심분야
			/*
			checbox의 경우 같은name이 여러개이기 때문에 다음과 같은 방법으로 
			갯수를 체크해야한다
			 */
			//alert("관심분야를 입력해주세요");
			document.getElementsByClassName("invalid-hoddy")[0].innerText = "관심분야를 입력해주세요";
			document.getElementsByClassName("invalid-hoddy")[0].style.color = "red";
			return false;

		} else if (form.user_job.value == '') {
			//직업
			//alert("직업을 선택해주세요");
			document.getElementsByClassName("invalid-job")[0].innerText = "직업을 선택해주세요";
			document.getElementsByClassName("invalid-job")[0].style.color = "red";
			form.user_job.focus();
			return false;

		}

	}
	//아이디 중복체크
	function idCheck(form) {

	
		window.open('idcheck?user_id=' + form.user_id.value, '', 'width=600,height=300');
		

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

	//체크박스 체크한 갯수구하기
	function checkboxes(tagName) {
		var count = 0;

		for (var i = 0; i < tagName.length; i++) {
			if (tagName[i].type == "checkbox" && tagName[i].checked == true) {
				count++;
			}

		}

		//alert("!" + count);
		return count;
	}

	function commonFocusMove(obj, charLen, nextObj) {

		if (obj.value.length == charLen) {
			document.getElementsByName(nextObj)[0].focus();
		}

		//alert("글자수 "+charLen+"이 되면 "+nextObj+"으로 포커스가 이동합니다.");
	}

	// 유효검사 알림창 전용함수    
	function checkExistData(inp,input, RegExp, msg1, msg2) {
		//단순 글자 입력(두번째는 이메일 전용)
		
		if (inp == "" || inp == "@") {
			//alert(msg1);
			document.getElementsByClassName(input)[0].innerText = msg1;
			document.getElementsByClassName(input)[0].style.color = "red";
			return false;
		} 
		
		//정규식이 맞지않을때
		 if(inp != "" && !RegExp.test(inp)){
			//alert(msg2);
			document.getElementsByClassName(input)[0].innerText = msg2;
			document.getElementsByClassName(input)[0].style.color = "red";
			return false;
		} 

		return true;
	}
</script>

</head>
<body>

	<!-- header -->
	<jsp:include page="../layout/header.jsp" />

	<div class="container-xxl project py-5">
		<div class="container">

			<div class="text-center mx-auto mb-5 wow fadeInUp"
				data-wow-delay="0.1s"
				style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
				<h4 class="section-title">${title_name}</h4>
				<h1 class="display-5 mb-4">${title_name}</h1>
			</div>
		</div>

		<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s"
			style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

			<div class="col-lg-12">

				<div class="tab-content w-100">

					<div class="row my-5">

						<form action="../member.do/register" method="post" name="registFrm" onsubmit="return registValdidate(this)">
							<div class="row g-3">

								<!-- id -->
								<div class="col-12">
									<label for="user_id" class="form-label">ID(영문숫자 8~16글자)</label>
									<div class="input-group mb-3">
										<input type="text" class="form-control" id="user_id" name="user_id" placeholder="">
										<button type="button" class="btn btn-outline-secondary" onclick="idCheck(this.form);">중복확인</button>
									</div>
									<div class="invalid-id"></div>
									<input type="hidden" name="idDuplication" value="idUnckeck">
								</div>

								<!-- pw -->
								<div class="col-sm-6">
									<label for="user_pw1" class="form-label">패스워드(영문숫자특수문자 6~20글자)</label> 
									<input type="password" class="form-control" id="user_pw1" name="user_pw1" placeholder="">
								</div>

								<div class="col-sm-6">
									<label for="user_pw2" class="form-label">패스워드 확인</label> <input
										type="password" class="form-control" id="user_pw2" name="user_pw2"
										placeholder="">
								</div>

								<div class="col-12">
									<div class="invalid-pw"></div>
								</div>

								<!-- name -->
								<div class="col-12">
									<label for="user_name" class="form-label">이름</label> <input
										type="text" class="form-control" id="user_name"
										name="user_name" placeholder="">
									<div class="invalid-name"></div>
								</div>

								<!-- email -->
								<div class="col-12">
									<label for="user_email" class="form-label">이메일</label>
									<div class="input-group has-validation">
										<input type="text" class="form-control" id="user_email1"
											name="user_email1" placeholder="user_email1"> <span
											class="input-group-text">@</span> <input type="text"
											class="form-control" id="user_email2" name="user_email2"
											placeholder="user_email2"> <select
											class="form-select" id="email_domain" name="email_domain"
											onchange="inputEmail(this.form);">
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
										<select class="form-select" id="country" name="user_phone1"
											required="">
											<option value="" selected="selected">Choose...</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select> <input type="text" class="form-control" id="user_phone2"
											name="user_phone2" placeholder="user_phone2"> <span
											class="input-group-text">-</span> <input type="text"
											class="form-control" id="user_phone3" name="user_phone3"
											placeholder="user_phone3">

									</div>
								</div>

								<div class="col-12">
									<div class="invalid-phone"></div>
								</div>

								<!-- hoddy -->
								<div class="col-12">
									<label for="user_hoddy" class="form-label">관심분야</label>
									<div class="input-group has-validation">
										<input class="form-check-input" type="checkbox"
											name="user_hoddy" value="캠핑" id="ch1"> <label
											class="form-check-label" for="ch1">캠핑&nbsp;&nbsp;</label> <input
											class="form-check-input" type="checkbox" name="user_hoddy"
											value="등산" id="ch2"> <label class="form-check-label"
											for="ch2">등산&nbsp;&nbsp;</label> <input
											class="form-check-input" type="checkbox" name="user_hoddy"
											value="영화" id="ch3"> <label class="form-check-label"
											for="ch3">영화&nbsp;&nbsp;</label> <input
											class="form-check-input" type="checkbox" name="user_hoddy"
											value="독서" id="ch4"> <label class="form-check-label"
											for="ch4">독서</label>
									</div>

									<div class="invalid-hoddy"></div>
								</div>

								<!-- job -->
								<div class="col-12">
									<label for="user_job" class="form-label">직업</label>
									<div class="input-group has-validation">
										<select class="form-select" id="user_job" name="user_job">
											<option value="" selected="selected">Choose...</option>
											<option value="교사">교사</option>
											<option value="변호사">변호사</option>
											<option value="의사">의사</option>
											<option value="기술사">기술사</option>
										</select>
									</div>

									<div class="invalid-job"></div>
								</div>

								<!-- info -->
								<div class="col-12">
									<label for="user_info" class="form-label">하고싶은말</label>
									<div class="input-group has-validation">
										<textarea class="form-control" id="user_info" name="user_info"
											rows="3"></textarea>
									</div>
								</div>


								<hr class="my-4">
								<div class="col-12">
									<button class="w-100 btn btn-primary btn-lg" type="submit">회원가입</button>
								</div>

							</div>
						</form>
					</div>

				</div>

			</div>
			<!-- col-lg-12 end -->

		</div>
		<!-- row end -->

	</div>

	<!-- footer -->
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>