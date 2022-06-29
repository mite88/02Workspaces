<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration02.html</title>
    <link rel="stylesheet" href="./common/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--  Date Picker 한글화  -->
    <script src="./common/datepicker-ko.js"></script>

    <script>
    $( function() {
        //라디오를 버튼모양으로 바꿔주는 jQuery UI
        $("input[type=radio]").checkboxradio({
            icon: false
        });
        //날짜선택을 편리하게 - Date Picker
        //생년월일 치곤 년도 선택이 힘들어서 찾아서 조금추가했습니다
        $("#birthday").datepicker({
            dateFormat : "yy-mm-dd",
            showOn: "both",
            buttonImage: "./images/pick.jpg",
            buttonImageOnly: true,
       	 	changeMonth: true, //월변경가능
            changeYear: true, //년변경가능
       		showMonthAfterYear: true, //년 뒤에 월 표시
       		yearRange: 'c-150:c+0', //년도 범위
            
        });    
        $('img.ui-datepicker-trigger').css({'position':'relative','top':'11px','width':'33px','marginTop':'-5px'});
    } );
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function zipcodeFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                //DAUM 우편번호API가 전달해주는 값을 콘솔에 출력
                console.log("zonecode", data.zonecode);
                console.log("address", data.address);
                //회원 가입폼에 적용
                var f = document.registFrm;//<form>태그의 DOM객체를 변수에 저장
                f.zipcode.value = data.zonecode;
                f.address1.value = data.address;
                f.address2.focus();
            }
        }).open();
    }
    </script>
<script>
function fn_checkPass(pw) {

	var pw_RegExp = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/; //password 정규식
	
	if (pw_RegExp.test(pw.value)) {
		return true;
	} else {
		console.log("!");
		
		return false;
	}

}


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
<form action="registProcess.jsp" method="post" name="registFrm" onsubmit="return registValdidate(this)">
<div class="AllWrap">
    <div class="wrap_regiform">
        <p>*필수입력사항</p>
        <table class="regi_table">
            <colgroup>
                <col width="180px">
                <col width="*">
            </colgroup>
            <tr>
                <td><span class="red">*</span> 아이디</td>
                <td>
                    <input type="text" class="w01" name="userid" value="" />       
                    <button type="button" onclick="idCheck(this.form);">중복확인</button>             
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <span class="comment">※ 8~16자의 영문과 숫자만 가능합니다.</span>                
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 비밀번호</td>
                <td>
                    <input type="password" class="w01" name="pass1" value="" onkeypress="fn_checkPass(this);"/>                   
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <span class="comment">
                        ※ 영문/숫자/특수문자 조합 6~20자 이상 입력해주세요.
                    </span>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 비밀번호확인</td>
                <td>
                    <input type="password" class="w01" name="pass2" value="" />
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 이름</td>
                <td>
                    <input type="text" class="w01" name="name" value="" />
                    
                    <label for="radio-1">남</label>
                    <input type="radio" name="gender" id="radio-1" value="남" checked>
                    <label for="radio-2">여</label>
                    <input type="radio" name="gender" id="radio-2" value="여">
                    
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 생년월일</td>
                <td style="padding: 0px 0 5px 5px;">
                    <input type="text" class="w02" name="birthday" id="birthday" value="" />
                    <!-- <img src="./images/pick.jpg" id="pick" class="pick" /> -->
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 주소</td>
                <td>
                    <input type="text" class="w03" name="zipcode" value="" />
                    <button type="button" onclick="zipcodeFind();">우편번호찾기</button> 
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="text" class="w04" name="address1" value="" />                
                    <input type="text" class="w04" name="address2" value="" />
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 이메일</td>
                <td>
                    <input type="text" class="w05" name="email1" value="" />
                    @
                    <input type="text" class="w05" name="email2" value="" />
                    <select name="email_domain" class="s01" onchange="inputEmail(this.form);">
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 휴대폰번호</td>
                <td>
                    <select name="mobile1" class="s02" onchange="commonFocusMove(this, 3, 'mobile2');">
                        <option value=""></option>
						<option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    -
                    <input type="text" class="w06" name="mobile2" maxlength="4" 
                        value="" onkeyup="commonFocusMove(this, 4, 'mobile3');" />
                    -
                    <input type="text" class="w06" name="mobile3" maxlength="4" 
                        value="" onkeyup="commonFocusMove(this, 4, 'tel1');" />
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>
                    <select name="tel1" class="s02" onchange="commonFocusMove(this, 3, 'tel2');">
                        <option value=""></option>
						<option value="02">02</option>                        
                        <option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
                    </select>
                    -
                    <input type="text" class="w06" name="tel2" maxlength="4" value="" onkeyup="commonFocusMove(this, 4, 'tel3');" />
                    -
                    <input type="text" class="w06" name="tel3" maxlength="4" value="" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top:10px;">
            <button type="submit" class="btn_search">회원가입</button>
            <button type="reset" class="btn_search">다시쓰기</button>
        </div>
    </div>
</div>
</form>
</body>
</html>