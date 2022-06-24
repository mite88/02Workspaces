/**
fullcalendar-korean

https://github.com/chooco13/fullcalendar-korean/blob/master/README.md
 */
document.addEventListener('DOMContentLoaded', function() {

	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			start: 'prev,next today',
			center: 'title',
			end: '',
		},
		locale: "ko",
		height: 650,
		initialDate: new Date(),
		navLinks: false, // 사용자가 요일/주를 나타내는 보기로 이동
		selectable: true,
		selectMirror: true,
		select: function(arg) {
			//event_edit(calendar, arg);
		},
		windowResize: function(view) {
			calendar.changeView('dayGridMonth');
		},
		eventClick: function(info) {
			//내용클릭시 ...
			/*if (confirm('Are you sure you want to delete this event?')) {
				arg.event.remove()
			}*/
			
			//$(".fc-toolbar-chunk:eq(2) .office_num").value($("#code").val());
			
			var myModal = new bootstrap.Modal(document.getElementById('viewModal'));
			myModal.show();
			
			//데이터출력
			document.querySelector('#viewModal #number').value=info.event.id;
			document.querySelector('#viewModal #title').value=info.event.title;
			document.querySelector('#viewModal #startDate').value=moment(info.event.startStr).format('YYYY-MM-DD');
			document.querySelector('#viewModal #endDate').value=moment(info.event.endStr).format('YYYY-MM-DD');
			document.querySelector('#viewModal #message-text').value=info.event.extendedProps.message;

			//readonly지정
			document.querySelectorAll("#viewModal input, #viewModal textarea").forEach(function (input) {
			    input.readOnly=true; // readonly 처리
			 })
		},
		eventAfterAllRender: function() {
			// TODO

			$('.fc-event-container > .fc-event-more').remove();
			$('.fc-popover').each(function(index, item) {
				var dropdownContainer = $(item);
				var eventCount = dropdownContainer.find('li').length;
				dropdownContainer.find('.more_btn').text('+' + eventCount + '개');
			});

			$('.fc-day-header').attr('scope', 'col');
		},
		editable: true,
		dayMaxEvents: true, // allow "more" link when too many events
		events: function(info, successCallback, failureCallback) {
			//console.log(info);

			
			$(".fc-toolbar-chunk:eq(2) .office_num").remove();
			$("#editModal .clone_select .code").remove();
			
			$.ajax({
				url: 'select_ajax?start_datetmime=' + moment(info.startStr).format('YYYY-MM-DD')
					+ '&end_datetmime=' + moment(info.endStr).format('YYYY-MM-DD')+"&code="+document.querySelector("#code").value,
				type: 'GET',
				dataType: 'json',
				success: function(json) {
					
					$("#editModal .clone_select").append('<select class="code"><option value="">Select Month</option></select>');
					$(".fc-toolbar-chunk:eq(2)").append('<select class="office_num"><option value="">Select Month</option></select>');

					var events = [];

					var o_values = json.offlice_list; //java에서 정의한 ArrayList명을 적어준다.

					$.each(o_values, function(index, val) {
						//alert(val.code);
						$("#editModal .clone_select .code").append(
							'<option value="'+val.code+'">'+val.o_name+'</option>'
						);
						
						$(".fc-toolbar-chunk .office_num").append(
							'<option value="'+val.code+'">'+val.o_name+'</option>'
						);

					});
					
					$(".fc-toolbar-chunk:eq(2) .office_num").val($("#code").val());
					
					
					var values = json.Lists; //java에서 정의한 ArrayList명을 적어준다.
					$.each(values, function(index, val) {

						events.push({
							id: val.number,
							title: val.title,
							start:  moment(val.start).format('YYYY-MM-DD HH:mm:ss'),
							end:   moment(val.end).format('YYYY-MM-DD HH:mm:ss'),
							message : val.message,
							code: val.office_num,
						})

					});


					successCallback(events);

				}, error: function(request, status, error) {
					alert("code:" + request.status + "\n" + "error:" + error);
				}
				
			});
			//end ajax

		}

	});


	calendar.render();
	


	//지점변경시..
	$(document).on("change", ".office_num", function() {
		//alert("!"+this.value);
		
		$(".fc-toolbar-chunk:eq(2) .office_num").remove();
		$("#editModal .clone_select .code").remove();
		$("#code").val(this.value);
		calendar.refetchEvents();
		//calendar.changeView('dayGridMonth', this.value);
		//calendar.gotoDate( new Date(2022, this.value-1, 1));
   });
   
   //예약폼생성
   $('#editBtn').on('click', function() {
			
		event_edit();
	});

	
	//예약폼
	function event_edit() {
		
		var myModal = new bootstrap.Modal(document.getElementById('editModal'));
		myModal.show();

		console.log("!!");
		
		
		//데이터출력
		document.querySelector('#editModal #number').value="";
		document.querySelector('#editModal #title').value="";
		document.querySelector('#editModal #startDate').value="";
		document.querySelector('#editModal #endDate').value="";
		document.querySelector('#editModal #message-text').value="";

		//readonly지정
		document.querySelectorAll("#editModal input, #editModal textarea").forEach(function (input) {
		    input.readOnly=false; // readonly 처리
		 })

		$('#editModal #submitButton').on('click', function() {
			
			createClnd();
		});

	}
	
	editBtn



	//등록 액션    
	function createClnd() {
		if (!confirm("일정을 등록 하시겠습니까?")) return false;
		var title = $('#editModal #title').val();
		var startDate = $('#editModal #startDate').val();
		var endDate = $('#editModal #endDate').val();
		var message = $('#editModal #message-text').val();
		var code=$("#editModal .clone_select .code").val();
		
		var user_id = $("#user_id").val();

		$.ajax({
			url:  "create_ajax?title="+title+"&start="+startDate
			+"&end="+endDate+"&message="+message+"&code="+code+"&user_id="+user_id,
			type: "POST",
			contentType: "application/json;charset=UTF-8",
		});
		location.reload(true);

	}


	//수정액션
	function updateClnd(cal, xobj, event) {
		if (!confirm("해당일정을 정말로 수정 하시겠습니까?")) {
			if (event != undefined) event.revert();
			return false;
		}
		var $obj = calFunc.getFormValue();

		$.ajax({
			url:  "update_ajax",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify($obj)
		}).done(function(data) {
			var result = jQuery.parseJSON(data);
			cal.refetchEvents();
		}).fail(function(e) {
			alert("실패하였습니다." + e);
		}).always(function() {
			$("#name").val("");
			$("#comment").val("");
		});
	}

	//삭제액션
	function deleteClnd(cal, xobj) {
		if (!confirm("해당일정을 정말로 삭제 하시겠습니까?")) return false;

		var $obj = calFunc.getFormValue();
		$.ajax({
			url: "delete_ajax.do",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify($obj)
		}).done(function(data) {
			var result = jQuery.parseJSON(data);
			cal.refetchEvents();
		}).fail(function(e) {
			alert("실패하였습니다." + e);
		}).always(function() {
			$("#name").val("");
			$("#comment").val("");
		});
	}

});

