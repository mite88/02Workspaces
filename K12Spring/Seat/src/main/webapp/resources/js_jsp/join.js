$(function() {
	var idck = 0;
	$(function() {

		//아이디 중복체크 버튼을 클릭했을 때 
		$("#idck").click(function() {

			//m_id 값
			var userid =  $("#m_id").val(); 

			//비동기를 위한 ajax
			$.ajax({
				async: true,
				type : 'POST',
				data : userid,
				url : "idcheck.do",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {

						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
						$("#m_id").focus();


					} else {
						alert("사용가능한 아이디입니다.");
						$("#m_pw").focus();
						//아이디가 중복하지 않으면  idck = 1 
						idck = 1;

					}
				},
				error : function(error) {

					alert("error : " + error);
				}
			});
		});
	});

	//회원가입 클릭시
	$(".joinok").click(function() {
		if(confirm("회원가입을 하시겠습니까?")){
			if(idck==0){
				alert('아이디 중복체크를 해주세요');
				return false;
			}else{
				$("#smVO").submit();
			}
		}
	});


});


//주소 - 다음api

// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
}

function openDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
					document.getElementById('m_zip').value = data.zonecode;

					//도로명주소일때
					if (data.userSelectedType == 'R') {
						document.getElementById('m_addr1').value = data.roadAddress;
						//alert(data.roadAddress);
					} else {
						//지번주소
						document.getElementById('m_addr1').value = data.jibunAddress;
					}
					//전체 주소에서 연결 번지 및 ()로 묶여 있는 부가정보를 제거하고자 할 경우,
					//아래와 같은 정규식을 사용해도 된다. 정규식은 개발자의 목적에 맞게 수정해서 사용 가능하다.
					//var addr = data.address.replace(/(\s|^)\(.+\)$|\S+~\S+/g, '');
					//document.getElementById('addr').value = addr;

					$('#m_addr2').focus();
				}
			}).open();
}