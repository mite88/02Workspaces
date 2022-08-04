$(function() {
			var table = $('#example1').DataTable({
				"autoWidth" : false,
				"order" : [ [ 0, "desc" ] ],
				"aLengthMenu" : [ [ 5, 10, 25, -1 ], [ 5, 10, 25, "All" ] ],
				"language" : lang_kor,
				"columnDefs" : [ {
					"targets" : [ 3 ],
					"visible" : false,
					"searchable" : false
				}, {
					"targets" : [ 4 ],
					"visible" : false,
					"searchable" : false
				}, {
					"targets" : [ 5 ],
					"visible" : false,
					"searchable" : false
				}, {
					"targets" : [ 6 ],
					"visible" : false,
					"searchable" : false
				}, {
					"targets" : [ 8 ],
					"visible" : false,
					"searchable" : false
				} ]

			});

			$('a.toggle-vis').on('click', function(e) {
				e.preventDefault();

				// Get the column API object
				var column = table.column($(this).attr('data-column'));

				// Toggle the visibility
				column.visible(!column.visible());
			});

		});

		// Korean
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