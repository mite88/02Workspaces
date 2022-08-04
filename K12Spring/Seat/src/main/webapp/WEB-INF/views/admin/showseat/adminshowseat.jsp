<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.swing.ImageIcon"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<!DOCTYPE>
<html>

<head>


<title>Touch support</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="resources/admin/codebase/dhtmlxscheduler_flat.css" type="text/css" media="screen" title="no title" charset="utf-8">

<link
	href="resources/admin/plugins/timepicker/bootstrap-datetimepicker.css"
	rel="stylesheet">
</head>
<style type="text/css" media="screen">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: auto;
}

/*lightbox style
https://forum.dhtmlx.com/viewtopic.php?f=6&t=29526
*/

/*labels*/
.dhx_cal_light {
	font-size: 100%;
}

/*textarea*/
.dhx_cal_light textarea {
	background-color: rgb(238, 240, 246);
}

/*selects*/
.dhx_cal_light select {
	background-color: rgb(238, 240, 246);
	font-size: 30%;
}

select {
	width: 150px;
	height: 50px;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	background: url('../images/snippet/ico_select_arrow.png') right center
		no-repeat; /* background로 배경 깔아줌 */
	background-color: #fff;
	appearance: none; /* 기본 스타일 없애기 */
	-webkit-appearance: none;
	-moz-appearance: none;
	-o-appearance: none;
}

/*공연장별 색조정*/
.dhx_cal_event.sections_2 div, .dhx_cal_event_line.sections_2 {
	background-color: orange !important;
}

.dhx_cal_event_clear.sections_2 {
	color: orange !important;
}

.dhx_cal_event.sections_3 div, .dhx_cal_event_line.sections_3 {
	background-color: #E05B63 !important;
}

.dhx_cal_event_clear.sections_3 {
	color: #E05B63 !important;
}

.dhx_body hr {
	border: none;
	background-color: white;
	height: 2px;
}
</style>

<script src="resources/js/jquery-3.2.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/admin/codebase/jquery.form.js"
	type="text/javascript">
	
</script>

<!-- 달력 및 파일 라이브러리  https://docs.dhtmlx.com/-->
<script src="resources/admin/codebase/dhtmlxscheduler.js"
	type="text/javascript"></script>
<script src="resources/admin/codebase/dhtmlxscheduler_timeline.js"
	type="text/javascript"></script>
<script src="resources/admin/codebase/dhtmlxscheduler_tooltip.js"></script>

<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script
	src="resources/admin/plugins/timepicker/bootstrap-datetimepicker.js"
	type="text/javascript"></script>

<%
	String picurls = null;
	ImageIcon icon = new ImageIcon(picurls);
	String imgsrc = application.getRealPath("/img");
	File imgFile = new File(imgsrc);
%>
<script type="text/javascript" charset="utf-8">
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
					} ];
					scheduler.parse(JSON.stringify(contentStr), "json");
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
		//공연정보 no 유일키생성
		var d = new Date();

		var day_no = d.getFullYear() + "" + (d.getMonth() + 1) + ""
				+ d.getDate() + "" + d.getHours() + "" + d.getMinutes() + ""
				+ d.getSeconds();

		var ev = scheduler.getEvent(id);
		scheduler.startLightbox(id, html("my_form"));

		var sd = scheduler.getEvent(id).start_date;
		var ed = scheduler.getEvent(id).end_date;

		//공연좌석정보 유일키생성
		var crypto = window.crypto || window.msCrypto || null; // IE11 fix

		var Guid = Guid
				|| (function() {

					var EMPTY = '00000000-0000-0000-0000-000000000000';

					var _padLeft = function(paddingString, width,
							replacementChar) {
						return paddingString.length >= width ? paddingString
								: _padLeft(replacementChar + paddingString,
										width, replacementChar || ' ');
					};

					var _s4 = function(number) {
						var hexadecimalResult = number.toString(16);
						return _padLeft(hexadecimalResult, 4, '0');
					};

					var _cryptoGuid = function() {
						var buffer = new window.Uint16Array(8);
						window.crypto.getRandomValues(buffer);
						return [
								_s4(buffer[0]) + _s4(buffer[1]),
								_s4(buffer[2]),
								_s4(buffer[3]),
								_s4(buffer[4]),
								_s4(buffer[5]) + _s4(buffer[6])
										+ _s4(buffer[7]) ].join('-');
					};

					var _guid = function() {
						var currentDateMilliseconds = new Date().getTime();
						return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
								.replace(
										/[xy]/g,
										function(currentChar) {
											var randomChar = (currentDateMilliseconds + Math
													.random() * 16) % 16 | 0;
											currentDateMilliseconds = Math
													.floor(currentDateMilliseconds / 16);
											return (currentChar === 'x' ? randomChar
													: (randomChar & 0x7 | 0x8))
													.toString(16);
										});
					};

					var create = function() {
						var hasCrypto = crypto != 'undefined'
								&& crypto !== null, hasRandomValues = typeof (window.crypto.getRandomValues) != 'undefined';
						return (hasCrypto && hasRandomValues) ? _cryptoGuid()
								: _guid();
					};

					return {
						newGuid : create,
						empty : EMPTY
					};
				})();

		// DEMO: Create and show GUID
		//alert(Guid.newGuid());

		//데이터가 있다면...
		if (!(ev.text == "New event")) {
			$("#show_no").val(ev.show_no);
			$("#show_id").val(ev.show_id);
			$("#show_title").val(scheduler.getEvent(id).text);
			$("#show_content").text(ev.content);

			var sd1 = formatDate(sd);
			var ed1 = formatDate(ed);

			
			var showno=$("#show_no").val();
			//동적테이블불러오기
			var ssStr = "";

			$.ajax({
				type : 'POST',
				url : 'ajax_adminshowseatdata.do?show_no='+showno, //데이터를 요청할 페이지
				dataType : 'json', //데이터 유형
				success : function(data) { //성공시 처리 함수, 인수는 위에서 data를 사용한 경우
					//alert(data[0].ss_no);

					//$("#tbl").trigger("click");
					$.each(data, function(key, value) {

						$("#ss_seattype").val(value.ss_seattype);
						$("#ss_seatpay").val(value.ss_seatpay);
						$("#ss_seatrow").val(value.ss_seatrow);
						$("#ss_seatcol").val(value.ss_seatcol);
						var ss_no_num = value.ss_no.split("_");

						$("#ss_no").val(ss_no_num[0]);
						add_more_book();
						auto_number();

					});

					var num_row = $('table#tbl tr:eq(1)').index();
					//alert(num_row);
					$("table#tbl tr:eq(1)").remove();
					auto_number();
				}
			});

			$("#ss_no").val(ev.ss_no);

			$("#start_date").val(sd1);
			$("#end_date").val(ed1);

			var imgname1 = ev.show_img1.split("_");
			var imgname2 = ev.show_img2.split("_");

			$("#file_img1UUID").val(imgname1[0]);
			$("#file_img1").val(imgname1[1]);

			$("#file_img2UUID").val(imgname2[0]);
			$("#file_img2").val(imgname2[1]);

		} else {
			//데이터가 없는곳에는....
			$("#show_no").val(day_no);
			$("#ss_no").val(Guid.newGuid());

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
		if ($("#file_img1").val() == "") {
			alert("!!1");
		} else if ($("#file_img2").val() == "") {
			alert("!!2");
		} else if (!$("#show_title").val()) {
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
		$("#ss_no").val("");
		$("#show_title").val("");
		$("#show_content").text("");

		$("#ss_seattype").val("");
		$("#ss_seatpay").val("");
		$("#ss_seatrow").val("");
		$("#ss_seatcol").val("");

		//alert(num_row);
		$("#tbl >tbody >tr").remove();
		var tag = "<tr><td scope='row'><input type='text' readonly='readonly'";
		tag+="class='form-control read_only ind'  id='ss_number' name='ss_number' value='1' /></td>";
		tag+="<td><input type='text' name='ss_seattype' id='ss_seattype' class='form-control'/></td>";
		tag+="<td><input type='text' name='ss_seatpay' id='ss_seatpay' class='form-control' /></td>";
		tag+="<td><input type='text' name='ss_seatrow' id='ss_seatrow' class='form-control' /></td>	";	
		tag+="<td><input type='text' name='ss_seatcol' id='ss_seatcol' class='form-control' /></td>";
		tag+="<td><input type='button' name='add_more' class='add_more' value='add more' /> ";
		tag+="<input type='button' name='remove' class='remove' value='remove' /></td></tr>";
		$('#tbl >tbody').append(tag);

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
</script>

</head>



<body class="hold-transition sidebar-mini" onload="init();">

	<c:choose>
		<c:when test="${sessionScope.SID eq null}">
			<h3>잘못된 접근입니다...</h3>
		</c:when>
		<c:otherwise>
			<jsp:include page="../admintitle.jsp"></jsp:include>
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1>Calendar</h1>
							</div>
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="admin.do">Home</a></li>
									<li class="breadcrumb-item active">Calendar</li>
								</ol>
							</div>
						</div>
					</div>
					<!-- /.container-fluid -->
				</section>


				<div id="scheduler_here" class="dhx_cal_container"
					style="width: 100%; height: 100%;">
					<div class="dhx_cal_navline">
						<div class="dhx_cal_prev_button" style="left: 200px">&nbsp;</div>
						<div class="dhx_cal_next_button" style="left: 250px">&nbsp;</div>
						<div class="dhx_cal_today_button" style="left: 300px"></div>
						<div class="dhx_cal_date"></div>


						<div class="dhx_cal_tab" name="day_tab" style="right: 30px"></div>
						<div class="dhx_cal_tab" name="week_tab" style="right: 80px;"></div>
						<div class="dhx_cal_tab" name="month_tab" style="right: 130px;"></div>
						<div class="dhx_cal_tab" id="timeline_tab" name="timeline_tab"
							style="right: 200px;"></div>

						<select id="show_filter" class="show_filter">
							<option value="0" class="group" selected>All</option>
							<option value="1" class="group1">Main Hell</option>
							<option value="2" class="group1">Hell 1</option>
							<option value="3" class="group1">Hell 2</option>
						</select>

					</div>
					<div class="form-inline">
						<div class="dhx_cal_header"></div>
						<div class="dhx_cal_data"></div>
					</div>
				</div>
			</div>
			<jsp:include page="../adminfooter.jsp"></jsp:include>
			<jsp:include page="adminshowmodel.jsp"></jsp:include>

		</c:otherwise>
	</c:choose>
</body>
</html>
