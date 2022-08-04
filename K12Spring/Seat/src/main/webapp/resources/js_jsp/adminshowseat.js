var formatDate = scheduler.date.date_to_str("%Y-%m-%d %H:%i");

	//달력나오는 부분
	function init() {

		//한글설정
		scheduler.locale = {
			date : {
				month_full : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				month_short : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				day_full : [ "Sunday", "Monday", "Tuesday", "Wednesday",
						"Thursday", "Friday", "Saturday" ],
				day_short : [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
			},
			labels : {
				dhx_cal_today_button : "오늘",
				day_tab : "Day",
				week_tab : "Week",
				month_tab : "Month",
				new_event : "New event",
				icon_save : "Save",
				icon_cancel : "Cancel",
				icon_details : "Details",
				icon_edit : "Edit",
				icon_delete : "Delete",
				confirm_closing : "", //Your changes will be lost, are your sure?
				confirm_deleting : "Event will be deleted permanently, are you sure?",
				section_description : "Description",
				section_time : "Time period"
			}
		}

		scheduler.clearAll(); //모든이벤트 지우기
		scheduler.config.drag_move = false; //drop막기

		//계단식 자료보기 설정
		scheduler.config.cascade_event_display = true;
		scheduler.config.cascade_event_count = 4;
		scheduler.config.cascade_event_margin = 30;

		scheduler.keys.edit_save = 32; //enter을 사용하기 위해 save버튼을 다른곳으로 돌림
		scheduler.config.xml_date = "%Y-%m-%d %H:%i"; //날짜형식

		//버튼막기
		scheduler.config.details_on_click = false;
		scheduler.config.details_on_dblclick = true;

		scheduler.config.details_on_create = true;

		//공연장별 색조정
		scheduler.templates.event_class = function(start, end, ev) {
			return "sections_" + ev.show_id;
		};

		//Tooltips
		dhtmlXTooltip.config.className = 'dhtmlXTooltip tooltip';
		dhtmlXTooltip.config.timeout_to_display = 50;
		dhtmlXTooltip.config.delta_x = 15;
		dhtmlXTooltip.config.delta_y = -20;

		scheduler.templates.tooltip_date_format = scheduler.date
				.date_to_str("%Y-%m-%d %H:%i");
		scheduler.templates.tooltip_text = function(start, end, event) {
			var tooltipTxt = "<b>공연명 #:</b> " + event.text + "<br/>";
			tooltipTxt += "<b>공연장:</b> " + event.show_id + "<br/>";
			tooltipTxt += "<b>시작일:</b> "
					+ scheduler.templates.tooltip_date_format(event.start_date)
					+ "<br/>";
			tooltipTxt += "<b>마지막일:</b> "
					+ scheduler.templates.tooltip_date_format(event.end_date)
					+ "<br/>";

			return tooltipTxt;
		};

		//time 탭설정
		var sections;
		var display = [];

		sections = scheduler.serverList("options", [ {
			key : 1,
			label : "Main Hell"
		}, {
			key : 2,
			label : "Hell 1"
		}, {
			key : 3,
			label : "Hell 2"
		} ]);

		//초기데이터용
		scheduler.attachEvent("onXLE", function() {
			display = $("#show_filter option.group1").map(function() {
				return {
					key : $(this).val(),
					label : $(this).text()
				};
			}).get(); //선택한것만 나오게 하기위해 저장

			scheduler.updateCollection("sections", display);
		});

		//공연장별버튼 외에는 안보이게..
		$(".dhx_cal_tab").on("click", function() {
			var id = $(this).attr('id');

			$("#show_filter").hide();

			$("#timeline_tab").click(function() {
				$("#show_filter").show();
			});

		});

		//선택용
		$("#show_filter").change(
				function() {

					if ($("#show_filter option:selected.group").val() == "0") {
						display = $("#show_filter option.group1").map(
								function() {
									return {
										key : $(this).val(),
										label : $(this).text()
									};
								}).get(); //선택한것만 나오게 하기위해 저장

					} else {
						display = $("#show_filter option:selected.group1").map(
								function() {
									return {
										key : $(this).val(),
										label : $(this).text()
									};
								}).get(); //선택한것만 나오게 하기위해 저장
					}

					console.log($("#show_filter option:selected.group").val());

					//update timeline reloads options and redraws the view
					scheduler.updateCollection("sections", display);

				});

		//select 선택시 보이는 데이터(공연별 설정을 위한..)
		scheduler.createTimelineView({
			name : "timeline",
			section_autoheight : true,
			resize_events : false,
			x_unit : "day",
			x_date : "%M %d",
			x_step : 1,
			x_size : 7,
			x_start : 0,
			x_length : 7,
			y_unit : scheduler.serverList("sections"),
			y_property : "show_id",
			render : "bar"
		});

		scheduler.date.timeline_start = function(date) {
			return new Date(date.getFullYear(), date.getMonth(), date.getDate()
					- date.getDay(), 0, 0);
		};

		scheduler.locale.labels.timeline_tab = "공연장별";
		scheduler.locale.labels.day_tab = "day";
		scheduler.locale.labels.week_tab = "week";
		scheduler.locale.labels.month_tab = "month";

		var last_used = new Date();
		document.querySelector("#scheduler_here").addEventListener("wheel",
				function(e) {
					//prevent too fast scrolling
					var time = new Date();
					if (time - last_used < 200)
						return;
					last_used = time;

				});

		scheduler.config.fix_tab_position = false;
		scheduler.init("scheduler_here", new Date(), "timeline");

		var contentStr = "";
		//달력에 데이터 넣기
		$.ajax({
			type : 'POST',
			url : 'ajax_adminshowseatlist.do', //데이터를 요청할 페이지
			dataType : 'json', //데이터 유형
			success : function(jdata) { //성공시 처리 함수, 인수는 위에서 data를 사용한 경우

				for (var i = 0; i < jdata.length; i++) {
					contentStr = [ {
						"text" : jdata[i].show_title,
						"show_id" : jdata[i].show_id,
						"show_no" : jdata[i].show_no,
						"content" : jdata[i].show_content,
						"show_img1" : jdata[i].show_img1,
						"show_img2" : jdata[i].show_img2,
						"start_date" : (jdata[i].show_startdate).substring(0,
								16),
						"end_date" : (jdata[i].show_enddate).substring(0, 16),
						"show_vipprice" : jdata[i].show_vipprice,
						"show_rprice" : jdata[i].show_rprice,
						"show_sprice" : jdata[i].show_sprice,
						"show_aprice" : jdata[i].show_aprice,
					} ];
					scheduler.parse(JSON.stringify(contentStr), "json");
					//alert(JSON.stringify(contentStr));
				}

			}
		});

	};

	//삽입부분 
	var html = function(id) {
		return document.getElementById(id);
	};

	//id설정을 위한..(삽입과 수정을 같이 해야되서 pk 설정시 문제가 발생 -> Date를 이용해 show_no 지정)
	scheduler.showLightbox = function(id) {
		var d = new Date();

		var day_no = d.getFullYear() + "" + (d.getMonth() + 1) + ""
				+ d.getDate() + "" + d.getHours() + "" + d.getMinutes() + ""
				+ d.getSeconds();

		var ev = scheduler.getEvent(id);
		scheduler.startLightbox(id, html("my_form"));

		var sd = scheduler.getEvent(id).start_date;
		var ed = scheduler.getEvent(id).end_date;

		//데이터가 있다면...
		if (!(ev.text == "New event")) {
			$("#show_no").val(ev.show_no);
			$("#show_id").val(ev.show_id);
			$("#show_title").val(scheduler.getEvent(id).text);
			$("#show_content").text(ev.content);

			var sd1 = formatDate(sd);
			var ed1 = formatDate(ed);

			$("#show_vipprice").val(ev.show_vipprice);
			$("#show_sprice").val(ev.show_sprice);
			$("#show_rprice").val(ev.show_rprice);
			$("#show_aprice").val(ev.show_aprice);

			$("#start_date").val(sd1);
			$("#end_date").val(ed1);

			var imgname1= ev.show_img1.split("_");
			var imgname2= ev.show_img2.split("_");
			
			$("#file_img1UUID").val(imgname1[0]);
			$("#file_img1").val(imgname1[1]);
			
			$("#file_img2UUID").val(imgname2[0]);
			$("#file_img2").val(imgname2[1]);

		} else {
			//데이터가 없는곳에는....
			$("#show_no").val(day_no);

			//공연장선택관련
			if (ev.show_id == null) {
				$("#show_id").val(1);
			} else {
				$("#show_id").val(ev.show_id);
			}

		}
		return true;

		//$("#show_title").focus();
	};

	function save_form() {
		if( $("#file_img1").val()==""){
			alert("!!1");
		}else if( $("#file_img2").val()==""){
			alert("!!2");
		}else if (!$("#show_title").val()) {
			alert("Text must not be empty");
			return false;
		} else {
			//달력에 보일 일정 text설정
			//alert($('#list_table tr td').eq(0).text());
			$('#realForm').submit();

		}
		return true;

		scheduler.endLightbox(true, html("my_form"));
	}
	function close_form() {
		$("#show_no").val("");
		$("#show_title").val("");
		$("#show_content").text("");

		$("#show_vipprice").val("");
		$("#show_rprice").val("");
		$("#show_sprice").val("");
		$("#show_aprice").val("");

		$("#start_date").val("");
		$("#end_date").val("");
		$("#grade").val("");
		$("#price").val("");
		$("#file_img1").val("");
		$("#file_img2").val("");
		
		$('#list_table tr td').remove();
		scheduler.endLightbox(false, html("my_form"));

	}

	function delete_event() {
		var event_id = scheduler.getState().lightbox_id;
		location.href = "adminshowseatdelete.do?show_no=" + $("#show_no").val();
		scheduler.endLightbox(false, html("my_form"));
		scheduler.deleteEvent(event_id);

	}