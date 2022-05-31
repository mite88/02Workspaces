<%--
/**
 * 1. 프로젝트명 : registReview.jsp
 * 2. 작성일 : 2022. 5. 30. 오전 9:37:11
 * 3. 작성자 : mite88
 * 4. 설명 : 우편번호 API
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 30.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 API</title>
</head>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <link rel="stylesheet" href="./common/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function zipcodeFind() {
		
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);//전체데이터확인용
				var f = document.registFrm;
				f.zipcode.value = data.zonecode;
				f.address1.value =data.address;
				f.address2.focus();
				
				f.sido.value =data.sido; //시군
				f.sigungu.value =data.sigungu; //시군구
			}
		}).open();
	}
</script>

<script>
$( function() {
	$( "#datepicker" ).datepicker({
	      showButtonPanel: true
	    });
  } );
</script>

<body>
	<h2>회원가입폼</h2>
	<form action="" name="registFrm">
		우편번호<input type="text" name="zipcode" />
		<input type="button" value="우편번호 검색" onclick="zipcodeFind()"/><br />
		주소1 <input type="text" name="address1"/><br />
		주소2 <input type="text" name="address2" /><br />
		
		<!-- 회원로그용 데이터 -->
		<input type="hidden" name="sido"/>
		<input type="hidden" name="sigungu"/>
		
		<hr />
		
		생년월일 <input type="text" name="birth" id="datepicker">
	</form>
</body>
</html>