<%--
/**
 * <pre>
 * 1. 프로젝트명 : Register.jsp
 * 2. 작성일 : 2022. 6. 4. 오후 7:06:07
 * 3. 작성자 : mite88
 * 4. 설명 : 회원가입
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register.jsp</title>
<script src="<%=request.getContextPath() %>/resources/jQuery/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/bootstrap-5.1.3/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>

<script>
	//회원가입 유효성검사
    function registValdidate(form){
    	//이번엔 참고하시라고 유효성검사에 정규식을 조금 넣어볼까합니다만...
    	var id_RegExp = /^[a-zA-Z0-9]{8,16}$/; //id 정규식
    	var pw_RegExp = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/; //password 정규식
    	var name_RegExp = /^[가-힣]{2,}|[a-zA-Z]{2,}$/; //name 정규식(|로 하여 구분함)
    	var email_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//email정규식
    	var mobile_RegExp = /^\d{3}-\d{3,4}-\d{4}$/; //폰번호 정규식
		var tel_RegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;//일반전화 정규식
    	
    	var email_str = form.email1.value+"@"+form.email2.value; //이메일
    	var mobile_str = form.mobile1.value+"-"+form.mobile2.value+"-"+form.mobile3.value;//폰전화
    	var tel_str = form.tel1.value+"-"+form.tel2.value+"-"+form.tel3.value;//일반전화
    	//alert(form.mobile1.value);
		
    	if(!checkExistData(form.userid.value, id_RegExp,
    			"아이디를 입력해주세요", "아이디는  8~16자의 영문과 숫자만 가능합니다.")){
    		//id
    		
    		form.userid.focus();
    		return false;
    	}else if(!checkExistData(form.pass1.value, pw_RegExp,
    			"비밀번호를 입력해주세요"
    			, "비밀번호는 영문/숫자/특수문자 조합 6~20자 이상 입력해주세요.")){
    		//pw
    		
    		form.pass1.focus();
    		return false;
    	}else if(form.pass1.value!= form.pass2.value){
    			alert("비밀번호가 다릅니다. 다시입력해주세요");
    			form.pass1.value="";
    			form.pass2.value="";
        		form.pass1.focus();
        		return false;
        }else if(!checkExistData(form.name.value, name_RegExp,
    			"이름을 입력해주세요"
    			, "이름은 최소 2자 이상으로 적어주세요")){
    		//이름:길이
    		form.name.focus();
    		return false;
    	}else if(form.birthday.value ==''){
    		//생일
    		alert("생년월일을 입력해주세요");
    		form.birthday.focus();
    		return false;
    	}else if(form.zipcode.value =='' || form.address1.value =='' || form.address2.value ==''){
    		//주소
    		alert("주소를 입력해주세요");
    		return false;
    	}else if(!checkExistData(email_str, email_RegExp,
    			"이메일을 입력해주세요"
    			, "이메일을 입력해주세요")){
    		//이메일
    		form.email1.focus();
    		return false;
    	}else if(!checkExistData(mobile_str, mobile_RegExp,
    			"폰번호를 입력해주세요"
    			, "폰번호를 입력해주세요")){
    		//폰번호
    		form.mobile2.focus();
    		return false;
    	}else if(form.tel1.value != ''){
    		//전호번호 - 선택사항
    		if(!checkExistData(tel_str, tel_RegExp,
        			"전화번호를 입력해주세요"
        			, "전화번호를 입력해주세요")){
        		//전화번호
        		form.tel2.focus();
        		return false;
        	}
    	} 	 
    	
    }
    
    function idCheck(form){
    	alert("아이디 중복체크는 하지않습니다.");
    }
    function inputEmail(form){
    	//alert(form.email_domain.value);
    	var e_domain_str = form.email_domain.value;
    	if(e_domain_str ==""){
    		form.email2.readOnly = false; 
    		form.email2.value ='';
    	}else{
    		form.email2.readOnly = true;
    		form.email2.value =e_domain_str;
    	}
    
    }
    function commonFocusMove(obj, charLen, nextObj){
    	
         if(obj.value.length == charLen){
        	 document.getElementsByName(nextObj)[0].focus();
         }
         
    	//alert("글자수 "+charLen+"이 되면 "+nextObj+"으로 포커스가 이동합니다.");
    }
    
	
	// 유효검사 알림창 전용함수    
	function checkExistData(inp,  RegExp, msg1, msg2) {
		//단순 글자 입력(두번째는 이메일 전용)
		if (inp == "" || inp == "@") {
			alert(msg1);
			return false;
		}
		
		//정규식이 맞지않을때
		if(inp != "" && !RegExp.test(inp)){
			alert(msg2);
			return false;
		}
		
		
		return true;
	}
</script>
</head>
<body>

	<header>
		<jsp:include page="/layout/header.jsp" />
	</header>
	
	<div class="container">
		<main>
			<div class="py-5 text-center">
				
				<h2>회원가입</h2>
				<!-- <p class="lead">...</p> -->
			</div>

			<div class="row">
				<div class="col-12">
				
					<form action="../member/register.do" method="post" name="registFrm" onsubmit="return registValdidate(this)">
						<div class="row g-3">
							<div class="col-12">
								<label for="user_id" class="form-label">ID</label> 
								<input type="text" class="form-control" id="user_id" name="user_id" placeholder="">
								<div class="invalid-id"></div>
							</div>

							<div class="col-sm-6">
								<label for="user_pw1" class="form-label">패스워드</label> 
								<input type="text" class="form-control" id="user_pw1" name="user_pw1" placeholder="">
							</div>
							
							<div class="col-sm-6">
								<label for="user_pw2" class="form-label">패스워드 확인</label> 
								<input type="text" class="form-control" id="user_pw2" name="user_pw2" placeholder="">
								<div class="invalid-pw"></div>
							</div>
							
							<div class="col-12">
								<label for="user_name" class="form-label">이름</label> 
								<input type="text" class="form-control" id="user_name" name="user_name" placeholder="">
								<div class="invalid-name"></div>
							</div>

							<div class="col-12">
								<label for="user_email" class="form-label">이메일</label>
								<div class="input-group has-validation">
									<input type="text" class="form-control" id="user_email1" placeholder="user_email1">
									<span class="input-group-text">@</span> 
									
									<input type="text" class="form-control" id="user_email2" placeholder="user_email2">
									<div class="invalid-email"></div>
									
									<select class="form-select" id="email_domain" name="email_domain">
										<option value="" selected="selected">Choose...</option>
									    <option value="naver.com">naver.com</option>
									    <option value="hanmail.net">hanmail.net</option>
									    <option value="gmail.com">gmail.com</option>
									</select> 
								</div>
							</div>

							<div class="col-12">
								<label for="user_phone" class="form-label">휴대폰번호</label>
								<div class="input-group has-validation">
									<select class="form-select" id="country" name="user_phone1" required="">
										<option value="" selected="selected">Choose...</option>
									  	<option value="010" >010</option>
									    <option value="011">011</option>
									    <option value="016">016</option>
									    <option value="017">017</option>
									    <option value="018">018</option>
									    <option value="019">019</option>
									</select> 
									<input type="text" class="form-control" id="user_phone2"
										placeholder="user_phone2"> <span
										class="input-group-text">-</span> <input type="text"
										class="form-control" id="user_phone3"
										placeholder="user_phone3">
									<div class="invalid-email"></div>
								</div>
							</div>
							
							
							<div class="col-12">
								<label for="user_hoddy" class="form-label">관심분야</label>
								<div class="input-group has-validation">
									<input class="form-check-input" type="checkbox" name="user_hoddy" value="캠핑" id="ch1">
									<label class="form-check-label" for="ch1">캠핑&nbsp;&nbsp;</label>
									
									<input class="form-check-input" type="checkbox" name="user_hoddy" value="캠핑" id="ch2">
									<label class="form-check-label" for="ch2">등산&nbsp;&nbsp;</label>
									
									<input class="form-check-input" type="checkbox" name="user_hoddy" value="캠핑" id="ch3">
									<label class="form-check-label" for="ch3">영화&nbsp;&nbsp;</label>
									
									<input class="form-check-input" type="checkbox" name="user_hoddy" value="캠핑" id="ch4">
									<label class="form-check-label" for="ch4">독서</label>
								</div>
								
								<div class="invalid-hoddy"></div>
							</div>
							
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
							
							<div class="col-12">
								<label for="user_info" class="form-label">하고싶은말</label>
								<div class="input-group has-validation">
									<textarea class="form-control" id="user_info" name="user_info" rows="3"></textarea>
								</div>
							</div>

							<!-- <div class="col-md-3">
								<label for="zip" class="form-label">Zip</label> <input
									type="text" class="form-control" id="zip" placeholder=""
									required="">
								<div class="invalid-feedback">Zip code required.</div>
							</div>
							
							<div class="col-12">
								<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" id="address"
									placeholder="1234 Main St" required="">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>

							<div class="col-12">
								<label for="address2" class="form-label">Address 2 <span
									class="text-muted">(Optional)</span></label> <input type="text"
									class="form-control" id="address2"
									placeholder="Apartment or suite">
							</div> -->


						<hr class="my-4">
						<div class="col-12">
							<button class="w-100 btn btn-primary btn-lg" type="submit">회원가입</button>
						</div>
						
					</form>
				</div>
			</div>
		</main>

		<jsp:include page="/layout/footer.jsp" />
	</div>
</body>
</html>