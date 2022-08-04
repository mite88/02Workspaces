
$(function() {
	
	//테이블
	var table = $('#hometable').DataTable({
		"autoWidth" : false,
		"order" : [ [ 0, "desc" ] ],
		"aLengthMenu" : [ [ 5, 10, 25, -1 ], [ 5, 10, 25, "All" ] ],
		"language" : lang_kor,
		"processing": true,
		"serverSide": false,
		ajax: {
			"type" : "POST",
			"url" : "homelist.do",
			"data":function ( d ) {
				d.show_startdate = document.getElementById("start_date").value ,
				d.show_enddate = document.getElementById("end_date").value;
			},
			"dataType": "JSON",
			"dataSrc": function (jsonData) {
				for ( var i=0, len=jsonData.data.length ; i<len ; i++ ) {
					jsonData.data[i][0] = "<a href='homeimgtitle.do?show_no="+jsonData.data[i].show_no+"&idx=2'"+
					"data-lightbox='readtrip-"+[i+1]+"' data-title='My caption' onload='resize(this)'>"+
					"<img src='homeimgtitle.do?show_no="+jsonData.data[i].show_no+"&idx=2' width='90%' /></a>";
					jsonData.data[i][1] = "<h3>"+jsonData.data[i].show_title+"</h3> <br />"+
					"<hr> 장소 : "+jsonData.data[i].show_id_name+"공연장<br /> 시간 :"+jsonData.data[i].show_startdate+
					"~"+jsonData.data[i].show_enddate+"<br/>" +
					"<a href='homeseatintro.do?show_no="+jsonData.data[i].show_no+"' " +
					"class='btn btn-outline-primary' role='button' aria-pressed='true'>자세히보기</a>" +
					"<a href='#' class='btn btn-outline-primary seatshows' role='button' " +
					"id='"+jsonData.data[i].show_no+"' aria-pressed='true' onclick='onClick(this,"+jsonData.data[i].show_no+")'>예약하기</a>" ;
				}
				return jsonData.data;
			}
		}

	});
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

/*function enter(e){
	if (e.keyCode == 13) {
		fn_search();
	}
}
 */

function fn_search(){
	$("#hometable").DataTable().ajax.reload();
};

//예약하기로 이동
function onClick(e, id){
	var member_id = $("#userid").val();
	if(!(member_id==null))
	{
		window.open(
				'homeshowseat1.do?show_no='+id, '_blank', 
				'width=800, height=755, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no'
		);
		
	}else{
		alert("로그인후 예약이 가능합니다!!");
		return false;
	}
}; 



