$(function() {
	var no = $("#nb_no").val();

	$(".viewupdate").click(function() {
		window.location.href = "notice_update.do?nb_no="+no;
	});


	//삭제하기 클릭시
	$(".delete_submit").click(function() {

		swal({
			title: '삭제',
			text: "삭제할건가요?",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '지울겁니다'
		}).then((result) => {
			if (result.value) {
				//alert(itm_no);
				window.location.href="notice_delete.do?nb_no="+no;

			}
		});


	});

});