

//버튼누를때 보내기
$('.charSend').click(function () {
	var txt=$("#message").val();

	socket.emit('publish', {"id": id, "msg" : txt});
});

//소셜버튼클릭시
$('.card__share > a').on('click', function(e){ 
	e.preventDefault() // prevent default action - hash doesn't appear in url
	$(this).parent().find( 'div' ).toggleClass( 'card__social--active' );
	$(this).toggleClass('share-expanded');
});


//예약하기로 이동
$('.seatshow').on('click', function(e) {
	var id=$(this).attr("id");
	var member_id = $("#userid").val();

	if(!(member_id==null))
	{
		window.open(
				'http://ijuju88.cafe24.com/seat/homeshowseat1.do?show_no='+id, '_blank', 
				'width=800, height=755, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no'
		);

	}else{
		alert("로그인후 예약이 가능합니다!!");
		return false;
	}
}); 


//모듈생성
$('.chats1').click(function() {
	$('#myModal').modal('show');
});

//회원가입들어가기
$('#Usejoin').click(function() {

	window.location.href="homejoin.do";

	/* var url = $(this).attr('href');
    $(".card-body").html('<embed type="text/html", width="100%", height="755," direction=yes, location=yes, menubar=yes, scrollbars=yes, status=yes,toolbar=no, resizeble=no, src="'+url+'"></embed>');

	});   */

});

//로그인 클릭시
$('#Uselogin').click(function() {
	var id=$("#id").val();
	var pw=$("#pw").val();

	$("#loginForm").submit();
});

//로그아웃클릭시
$('#Uselogout').click(function() {
	$("#logoutForm").submit();
});


//Mypage 클릭시

$('#UsePage').click(function() {
	window.location.href="http://ijuju88.cafe24.com/seat/homeMyPage1.do";
});





