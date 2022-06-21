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
		locale : "ko",
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
		eventClick: function(arg) {
			if (confirm('Are you sure you want to delete this event?')) {
				arg.event.remove()
			}
		},
		eventAfterAllRender: function () {
            // TODO

            $('.fc-event-container > .fc-event-more').remove();
            $('.fc-popover').each(function (index, item) {
                var dropdownContainer = $(item);
                var eventCount = dropdownContainer.find('li').length;
                dropdownContainer.find('.more_btn').text('+' + eventCount + '개');
            });

            $('.fc-day-header').attr('scope', 'col');
        },
		editable: true,
		dayMaxEvents: true, // allow "more" link when too many events
		events: [{
			title: 'All Day Event',
			start: '2022-06-01'
		}, {
			title: 'Long Event',
			start: '2022-06-07',
			end: '2022-06-10'
		}]
	});

	calendar.render();

	//예약폼
	function event_edit(calendar, arg) {
		/*
		var title = prompt('Event Title:');
		if (title) {
			calendar.addEvent({
				title: title,
				start: arg.start,
				end: arg.end,
				allDay: arg.allDay
			})
		}*/
		var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
		myModal.show();
		
	 	$('#submitButton').on('click',function(){
           var mockEvent = {title: title, start:startDate, end:endDate};
            $('#calendar').fullCalendar('renderEvent', mockEvent);
            $('#submitButton').unbind('click');
            $('#exampleModal').modal('hide');
       });
		
		
		
		//calendar.unselect()
	}
});

