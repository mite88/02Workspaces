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
			event_edit(calendar, arg);
		},
		windowResize: function(view) {
			calendar.changeView('dayGridMonth');
		},
		eventClick: function(info) {
			//내용클릭시 ...
			/*if (confirm('Are you sure you want to delete this event?')) {
				arg.event.remove()
			}*/
			
			var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
			myModal.show();
			
			//데이터출력
			document.querySelector('#exampleModal #number').value=info.event.id;
			document.querySelector('#exampleModal #title').value=info.event.title;
			document.querySelector('#exampleModal #startDate').value=moment(info.event.startStr).format('YYYY-MM-DD');
			document.querySelector('#exampleModal #endDate').value=moment(info.event.endStr).format('YYYY-MM-DD');
			document.querySelector('#exampleModal #message-text').value=info.event.extendedProps.message;

			//readonly지정
			document.querySelectorAll("#exampleModal input, #exampleModal textarea").forEach(function (input) {
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
			
			$.ajax({
				url: 'select_ajax?start_datetmime=' + moment(info.startStr).format('YYYY-MM-DD')
					+ '&end_datetmime=' + moment(info.endStr).format('YYYY-MM-DD')+"&code="+document.querySelector("#code").value,
				type: 'GET',
				dataType: 'json',
				success: function(json) {
					$(".fc-toolbar-chunk:eq(2)").append('<select class="office_num"><option value="">Select Month</option></select>');

					var events = [];

					var o_values = json.offlice_list; //java에서 정의한 ArrayList명을 적어준다.

					$.each(o_values, function(index, val) {
						//alert(val.code);
						$(".fc-toolbar-chunk .office_num").append(
							'<option value="'+val.code+'">'+val.o_name+'</option>'
						);

					});
					
					
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

	$(document).on("change", ".office_num", function() {
		//alert("!"+this.value);
		$(".fc-toolbar-chunk:eq(2) .office_num").remove();
		$("#code").val(this.value);
		calendar.refetchEvents();
		//calendar.changeView('dayGridMonth', this.value);
		//calendar.gotoDate( new Date(2022, this.value-1, 1));
   });

	
	//예약폼
	function event_edit(calendar, arg) {

		var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
		myModal.show();

		console.log(calendar);

		$('#submitButton').on('click', function() {
			var title = $('#exampleModal #title').val();
			var startDate = $('#exampleModal #start').val();
			var endDate = $('#exampleModal #end').val();
			var message = $('#exampleModal #message-text').val();
			var xObj = { title: title, start: startDate, end: endDate, message: message };

			createClnd(calendar, xObj);
		});

	}

	var ctx = "${path}";

	//등록 액션    
	function createClnd(cal, xobj) {
		if (!confirm("일정을 등록 하시겠습니까?")) return false;
		var $obj = calFunc.getFormValue();

		$.ajax({
			url: ctx + "/create_ajax.do",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify($obj)
		}).done(function(data) {
			var result = jQuery.parseJSON(data);

			$('#exampleModal').modal('hide');
			//calendar.unselect();
			//모든 소스에서 이벤트를 다시 가져와 화면에 다시 렌더링
			cal.refetchEvents();
		}).fail(function(e) {
			alert("실패하였습니다." + e);
		}).always(function() {
			//모듈 값 초기화
			$('#exampleModal #title').val("");
			$('#exampleModal #title').val("");
			$('#exampleModal #title').val("");
			$('#exampleModal #message-text').val("");
		});


	}


	//수정액션
	function updateClnd(cal, xobj, event) {
		if (!confirm("해당일정을 정말로 수정 하시겠습니까?")) {
			if (event != undefined) event.revert();
			return false;
		}
		var $obj = calFunc.getFormValue();

		$.ajax({
			url: ctx + "/adms/calendar/management/update_ajx.do",
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
			url: ctx + "/adms/calendar/management/delete_ajx.do",
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

