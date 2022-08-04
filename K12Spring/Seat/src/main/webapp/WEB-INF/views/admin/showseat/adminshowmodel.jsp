<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>

<head>
<style>
#my_form {
	position: absolute;
	top: 100px;
	left: 200px;
	z-index: 10001;
	display: none;
	background-color: white;
	border: 2px outset gray;
	padding: 20px;
	font-family: Tahoma;
	font-size: 12pt;
	width: 60%;
	height: 80%;
	overflow: auto;
}

.labels {
	width: 30%;
}

.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/admin/plugins/timepicker/bootstrap-datetimepicker.css" rel="stylesheet">
<title>Touch support</title>


<script src="resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script
	src="resources/admin/plugins/timepicker/bootstrap-datetimepicker.js"
	type="text/javascript"></script>
</head>
<script type="text/javascript" src="resources/js_jsp/adminshowmodel.js"></script>

<script type="text/javascript" src="resources/js_jsp/Tabullet.js"></script>
_

<script>
	$(function() {
		var source = [ {
			id : 1,
			ss_seattype : "A",
			ss_seatpay : 0,
			ss_row : 5,
			ss_col : 10
		}, ];

		function resetTabullet() {
			$("#table").tabullet({
				data : source,
				action : function(mode, data) {
					console.dir(mode);
					if (mode === 'save') {
						source.push(data);
					}
					if (mode == 'delete') {
						for (var i = 0; i < source.length; i++) {
							if (source[i].id == data) {
								source.splice(i, 1);
								break;
							}
						}
					}
					resetTabullet();
				}
			});
		}

		resetTabullet();
	});
</script>

<body>

	<div id="my_form">

		<form action="adminshowseatedit.do" id="realForm" method="POST"
			enctype="multipart/form-data" style="text-align: center;">

			<div class="form-group row">
				<label for="show_no" class="col-sm-2 col-form-label labels">공연장</label>
				<div class="col">
					<select class="custom-select" name="show_id" id="show_id">
						<option value="1">Main Hell</option>
						<option value="2">Hell 1</option>
						<option value="3">Hell 2</option>
					</select>
				</div>

				<div class="col">
					<input type="hidden" readonly class="form-control" id="show_no"
						name="show_no" style="display: none;"> 
					<input type="hidden" readonly class="form-control" id="ss_no"
						name="ss_no" style="display: none;">
				</div>
			</div>

			<div class="form-group row">
				<label for="show_title" class="col-sm-2 col-form-label labels">공연명</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="show_title"
						name="show_title" placeholder="공연명입력">
				</div>
			</div>

			<div class="form-group row">
				<label for="show_title" class="col-sm-2 col-form-label labels">좌석가격</label>

				<div class="col-sm-10">

					<table id="tbl" class="table table-sm">
						<thead>
							<tr>
								<th>번호</th>
								<th>좌석명(예:R,B)</th>
								<th>좌석가격</th>
								<th>좌석줄수</th>
								<th>좌석칸수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td scope="row"><input type="text" readonly="readonly"
									class="form-control read_only ind" 
									id="ss_number" name="ss_number" value="1" /></td>
								<td><input type="text" name="ss_seattype" id="ss_seattype"
									class="form-control" /></td>
								<td><input type="text" name="ss_seatpay" id="ss_seatpay"
									class="form-control" /></td>
								<td><input type="text" name="ss_seatrow" id="ss_seatrow"
									class="form-control" /></td>
								<td><input type="text" name="ss_seatcol" id="ss_seatcol"
									class="form-control" /></td>
								<td><input type="button" name="add_more" class="add_more"
									value="add more" /> <input type="button" name="remove"
									class="remove" value="remove" /></td>
							</tr>
						</tbody>
					</table>


				</div>

			</div>


			<div class="form-group row">
				<label for="show_content" class="col-sm-2 col-form-label labels">공연설명</label>
				<div class="col-sm-10">
					<textarea rows="5" class="form-control" id="show_content"
						name="show_content"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label for="start_date" class="col-sm-2 col-form-label labels">시간</label>
				<div class="col">
					<input type='text' class="form-control" id='start_date'
						name="start_date" />
					<script type="text/javascript">
						$(function() {
							$('#start_date').datetimepicker();
						});
					</script>
				</div>
				~
				<div class="col">
					<input type='text' class="form-control" id='end_date'
						name="end_date" />
					<script type="text/javascript">
						$(function() {
							$('#end_date').datetimepicker();
						});
					</script>
				</div>
			</div>


			<div class="form-group row">
				<label for="show_img1" class="col-sm-2 col-form-label labels">파일</label>
				<div class="col">
					<label class="btn btn-primary btn-file"> 파일추가 <input
						type="file" class="form-control" id="show_img1" name="show_img1" />
					</label> <input type="hidden" class="form-control" id='file_img1UUID'
						name="file_img1UUID" /> <input type='text' class="form-control"
						id='file_img1' name="file_img1" readonly />
				</div>
				<div class="col">
					<label class="btn btn-primary btn-file"> 파일추가 <input
						type="file" class="form-control" id="show_img2" name="show_img2" />
					</label> <input type="hidden" class="form-control" id='file_img2UUID'
						name="file_img2UUID" /> <input type='text' class="form-control"
						id='file_img2' name="file_img2" readonly />
				</div>
			</div>

			<input type="button" class="btn btn-dark" name="savei" value="Save"
				id="savei" style='width: 100px;' onclick="save_form()"> <input
				type="button" class="btn btn-dark" name="close" value="Close"
				id="close" style='width: 100px;' onclick="close_form()"> <input
				type="button" class="btn btn-dark" name="delete" value="Delete"
				id="delete" style='width: 100px;' onclick="delete_event()">

		</form>
	</div>
</body>
</html>