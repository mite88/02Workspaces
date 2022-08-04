$(function() {
	var no=$("#qb_no").val();
	
	var qb_writer=$("#qb_writer").val(); //글작성자 id
	var writer = $("#writer").val(); //현재 아이디(세션)
	
	//답글쓰기(관리자용)
	$('.admin_question_writer').on('click', function(e) {
		window.location.href="home_questionwrite.do?qb_no="+no;	

	}); 


	//수정하기(관리자용)
	$('.admin_question_update').on('click', function(e) {
		window.location.href="home_questionupdate.do?qb_no="+no;	

	}); 

	//수정하기로 이동(같은 id만 들어갈수 있게 하기위한...)
	$('.question_upedate').on('click', function(e) {
		if(qb_writer==writer)
		{
			window.location.href="home_questionupdate.do?qb_no="+no;

		}else{
			swal('문의게시판을 쓴 작성자가 다릅니다!!');
		
			return false;
		}
	}); 

	//삭제하기 클릭시
	$(".question_delete").click(function() {
		if(qb_writer==writer)
		{
			swal({
				title: '삭제',
				text: "문의한 내용을 삭제할건가요?",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '지울겁니다'
			}).then((result) => {
				if (result.value) {
					//alert(itm_no);
					window.location.href="question_delete.do?qb_no="+no;

				}
			});

		}else{
			swal('문의게시판을 쓴 작성자가 다릅니다!!');
			
			return false;
		}
		
		


	});

});