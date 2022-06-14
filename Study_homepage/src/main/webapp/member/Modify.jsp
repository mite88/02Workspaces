<%--
/**
 * 1. 프로젝트명 :  Modify.jsp
 * 2. 작성일 : 2022. 6. 4. 오후 7:06:07
 * 3. 작성자 : mite88
 * 4. 설명 : 회원수정(+탈퇴버튼)
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/resources/jQuery/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/bootstrap-5.1.3/css/bootstrap.min.css"	rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>

<script>
	//회원가입 유효성검사
	function registValdidate(form){
		
		//invalid 지우기
    	var invalid_text = document.querySelectorAll("div[class*='invalid']");
    
    	for (var x = 0; x < invalid_text.length; x++){
    		invalid_text[x].innerText="";
    	}
	
		//invalid 지우기
		document.querySelectorAll("[class*='invalid-']").innerText="";
		
		//id는 확인할 필요없습니다
		if(form.user_pw1.value!= form.user_pw2.value){
				alert("비밀번호가 다릅니다. 다시입력해주세요");
				form.user_pw1.value="";
				form.user_pw2.value="";
	    		form.user_pw1.focus();
	    		return false;
	    }else if(!checkExistData(form.user_name.value, "invalid-name", "이름을 입력해주세요")){
			//이름:길이
			form.user_name.focus();
			return false;
		}else if( form.user_email1.value == '' || form.user_email2.value == ''){
			//휴대폰번호
			//alert("이메일을 입력해주세요");
			document.getElementsByClassName("invalid-email")[0].innerText = "이메일을 입력해주세요";
			document.getElementsByClassName("invalid-email")[0].style.color = "red";
	   		form.user_email1.focus();
	   		return false;
	    	
		}else if(form.user_phone1.value == '' || form.user_phone2.value == '' || form.user_phone3.value == ''){
			//휴대폰번호
			//alert("휴대폰번호를 입력해주세요");
			document.getElementsByClassName("invalid-phone")[0].innerText = " 휴대폰번호를 입력해주세요";
			document.getElementsByClassName("invalid-phone")[0].style.color = "red";
	   		form.user_phone1.focus();
	   		return false;
	    	
		}else if(checkboxes(form.user_hoddy) < 1){
    		//관심분야
    		/*
    		checbox의 경우 같은name이 여러개이기 때문에 다음과 같은 방법으로 
    		갯수를 체크해야한다
    		*/
    		//alert("관심분야를 입력해주세요");
    		document.getElementsByClassName("invalid-hoddy")[0].innerText = "관심분야를 입력해주세요";
    		document.getElementsByClassName("invalid-hoddy")[0].style.color = "red";
       		return false;
        	
    	}else if(form.user_job.value == ''){
    		//직업
    		//alert("직업을 선택해주세요");
    		document.getElementsByClassName("invalid-job")[0].innerText = "직업을 선택해주세요";
    		document.getElementsByClassName("invalid-job")[0].style.color = "red";
       		form.user_job.focus();
       		return false;
        	
    	}	
		
	}

	//이메일 select 선택시
	function inputEmail(form){
		var e_domain_str = form.email_domain.value;
		if(e_domain_str ==""){
			form.user_email2.readOnly = false; 
			form.user_email2.value ='';
		}else{
			form.user_email2.readOnly = true;
			form.user_email2.value =e_domain_str;
		}
	
	}
	
	
	//회원탈퇴
	function frmFunc(form){
		//비번입력을 받아 탈퇴합니다
		var inputString = prompt('탈퇴를 하실려면 비밀번호를 입력해주세요.', '비밀번호입력');
		//alert(inputString);
		form.del_pw.value=inputString;
		form.submit();
		
	}
	
	//체크박스 체크한 갯수구하기
	function checkboxes(tagName)
	{
	 var count = 0;
	
	  for (var i=0; i<tagName.length; i++) {       
	     if (tagName[i].type == "checkbox" && tagName[i].checked == true){
	        count++;
	     }
	
	  }
	  
	  //alert("!"+count);
	  return count;
	}
	
	
	function commonFocusMove(obj, charLen, nextObj){
		
	     if(obj.value.length == charLen){
	    	 document.getElementsByName(nextObj)[0].focus();
	     }
	     
		//alert("글자수 "+charLen+"이 되면 "+nextObj+"으로 포커스가 이동합니다.");
	}
	
	
	// 유효검사 알림창 전용함수    
	function checkExistData(inp, input, msg1) {
		if (inp == "") {
			//alert(msg1);
			document.getElementsByClassName(input)[0].innerText = msg1;
			document.getElementsByClassName(input)[0].style.color = "red";
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
		<div class="py-5 text-center">
			
			<h2>회원수정</h2>
			<!-- <p class="lead">...</p> -->
		</div>

		<div class="row">
			<div class="col-12">
				<!-- 회원탈퇴 -->
				<form action="../member/delete.do" method="post" name="delFrm" >
					<div class="col-12">
							<input type="hidden" name="del_pw">
							<button class="w-100 btn btn-primary btn-lg" type="button" onclick="frmFunc(this.form)">
							회원탈퇴
							</button>
					</div>
				</form>
				
				<!-- 회원수정 -->
				<form action="../member/modify.do" method="post" name="registFrm" onsubmit="return registValdidate(this)">
					<div class="row g-3">
					
					<!-- id -->
					<div class="col-12">
						<label for="user_id" class="form-label">ID</label> 
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="user_id" name="user_id" placeholder=""  value="${dto.user_id}" readonly>
							   
							<div class="invalid-id"></div>
						</div>
					</div>

					<!-- pw -->
					<div class="col-sm-6">
						<label for="user_pw1" class="form-label">패스워드</label> 
						<input type="text" class="form-control" id="user_pw1" name="user_pw1" placeholder="" >
					</div>
					
					<div class="col-sm-6">
						<label for="user_pw2" class="form-label">패스워드 확인</label> 
						<input type="text" class="form-control" id="user_pw2" name="user_pw2" placeholder="">								
					</div>
					
					<div class="col-12">
						<div class="invalid-pw"></div>
					</div>
					
					<!-- name -->
					<div class="col-12">
						<label for="user_name" class="form-label">이름</label> 
						<input type="text" class="form-control" id="user_name" name="user_name" placeholder="" value="${dto.user_name}">
						<div class="invalid-name"></div>
					</div>
					
					<!-- email -->
					<c:set var="set_email" value="${fn:split(dto.user_email,'@')}"/>

					<div class="col-12">
						<label for="user_email" class="form-label">이메일</label>
						<div class="input-group has-validation">
							<input type="text" class="form-control" id="user_email1" name="user_email1" placeholder="user_email1"
							value="${set_email[0]}">
							<span class="input-group-text">@</span> 
							
							<input type="text" class="form-control" id="user_email2" name="user_email2" placeholder="user_email2"
							value="${set_email[1]}">
							
							
							<select class="form-select" id="email_domain" name="email_domain" onchange="inputEmail(this.form);">
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
							<select class="form-select" id="country" name="user_phone1" required="">
									
								<option value="">Choose...</option>
								<c:set var="phone_list" value="010,011,016,017,018,019" scope="application"/>
									
								<c:forEach items="${fn:split(phone_list,',') }" var="one" varStatus="loop">
							  		<option value="${one}" ${fn:indexOf(dto.user_phone,one) >= 0 ? 'selected':''}>${one}</option>
								</c:forEach>

							</select> 
							<input type="text" class="form-control" id="user_phone2" name="user_phone2" placeholder="user_phone2" 
							value="${user_phone2}"> 
							<span class="input-group-text">-</span> 
							<input type="text" class="form-control" id="user_phone3" name="user_phone3" placeholder="user_phone3" 
							value="${user_phone2}">
							
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
							<c:set var="hoddy_list" value="캠핑,등산,영화,독서" scope="application"/>
							
							<c:forEach items="${fn:split(hoddy_list,',') }" var="one" varStatus="loop">
								<input class="form-check-input" type="checkbox" name="user_hoddy" value="${one}" id="ch${loop.count}"
								${fn:indexOf(dto.user_hoddy,one) >= 0 ? 'checked':''}>
								<label class="form-check-label" for="ch${loop.count}">${one}&nbsp;&nbsp;</label>
							</c:forEach>
							
							
						</div>
						
						<div class="invalid-hoddy"></div>
					</div>
					
					<!-- job -->
					<div class="col-12">
						<label for="user_job" class="form-label">직업</label>
						<div class="input-group has-validation">
							<select class="form-select" id="user_job" name="user_job">
								<option value="" >Choose...</option>
								<option value="교사" ${dto.user_job=='교사'?'selected':'' }>교사</option>
							    <option value="변호사" ${dto.user_job=='변호사'?'selected':'' }>변호사</option>
							    <option value="의사" ${dto.user_job=='의사'?'selected':'' }>의사</option>
							    <option value="기술사" ${dto.user_job=='기술사'?'selected':'' }>기술사</option>
							</select> 
						</div>
						
						<div class="invalid-job"></div>
					</div>
					
					<!-- info -->
					<div class="col-12">
						<label for="user_info" class="form-label">하고싶은말</label>
						<div class="input-group has-validation">
							<textarea class="form-control" id="user_info" name="user_info" rows="3">${dto.user_info}</textarea>
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

		<jsp:include page="/layout/footer.jsp" />
	</div>
</body>
</html>