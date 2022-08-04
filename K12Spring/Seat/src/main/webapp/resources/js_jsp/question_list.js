$(function() {
	 $('#questiontable').DataTable({
		"autoWidth" : false,
		"ordering": false,
		"aLengthMenu" : [ [ 5, 10, 25, -1 ], [ 5, 10, 25, "All" ] ],
		"language" : lang_kor

	});
	
	//Korean
	var lang_kor = {
			"sEmptyTable" : "데이터가 없습니다",
			"sInfo" : "_START_ - _END_ / _TOTAL_",
			"sInfoEmpty" : "0 - 0 / 0",
			"sInfoFiltered" : "(총 _MAX_ 개)",
			"sInfoPostFix" : "",
			"sInfoThousands" : ",",
			"sLengthMenu" : "페이지당 줄수 _MENU_",
			"sLoadingRecords" : "읽는중...",
			"sProcessing" : "처리중...",
			"sSearch" : "검색:",
			"sZeroRecords" : "검색 결과가 없습니다",
			"oPaginate" : {
				"sFirst" : "처음",
				"sLast" : "마지막",
				"sNext" : "다음",
				"sPrevious" : "이전"
			},
			"oAria" : {
				"sSortAscending" : ": 오름차순 정렬",
				"sSortDescending" : ": 내림차순 정렬"
			}
	}
	
	//글쓰기
	$(".write").click( function() {
		var userid = $("#userid").val(); 
		if(userid==null)
		{
			alert("문의게시판쓰기 위해서는 로그인을 해야합니다!!");
			return false;
		}else {
			window.location.href = "home_questionwrite.do";
		}
	});
	
	$(".writeadmin").click( function() {
		window.location.href = "home_questionwrite.do";	
	});

	//사용자용
	$(".a_view").click( function() {
		
		var qb_writer =$(this).closest("tr").find('.q_writer').text(); //글작성자 id
		var writer = $("#writer").val(); //현재 아이디(세션)
		var no = $(this).closest("tr").find('.q_no').text();
		
		//alert(no+"/"+qb_writer+"/"+writer);

		if (qb_writer == writer || qb_writer=="admin") {
		
			window.location.href ="home_questionview.do?qb_no="+no;
		} else if(qb_writer != writer) {
			swal("문의게시판을 쓴 작성자가 다릅니다!!");
			return false;
		} else{
			swal("로그인을 해주세요");
			return false;
		}
	});

});



