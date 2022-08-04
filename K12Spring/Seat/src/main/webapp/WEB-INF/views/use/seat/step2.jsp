<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
/* 지정석구분용 */
table.w3ls-table td {
	background-color: #fff;
}

/*ui, li 지정*/
.seat_w3ls {
	list-style: none;
	margin: 5px;
	padding: 0;
}

.selected {
	background: green;
	color: white;
	margin: 5px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

.selectednopay {
	background: pink;
	color: white;
	margin: 5px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

.empty {
	background: #e6e6e6;
	margin: 5px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

/*checkbox 지정*/
input[type=checkbox] {
	width: 13px;
	margin-right: 14px;
	cursor: pointer;
}

#nopay:checked:before {
	background-color: Pink;
	font-size: 15px;
}

#pay:checked:before {
	background-color: Green;
	font-size: 15px;
}

#sel:checked:before {
	background-color: blue;
	font-size: 15px;
}

input[type=checkbox]:before {
	content: "";
	width: 25px;
	height: 18px;
	border-radius: 5px;
	/* Safari 3-4, iOS 1-3.2, Android 1.6- */
	-webkit-border-radius: 5px;
	/* Firefox 1-3.6 */
	-moz-border-radius: 5px;
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	border: 3px solid #372F2C;
	box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
	-moz-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
		0px rgba(255, 255, 255, .8);
	-webkit-box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px
		0px rgba(255, 255, 255, .8);
	background-color: #e6e6e6;
}
</style>
<meta charset='UTF-8'>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/homeshowseat.css">

</head>
<body onload="onLoaderFunc()">
	<div class="container">

		<h3>Step 2</h3>
		<p>좌석선택</p>
		<div class="inputForm">
			<input type="hidden" id="Username" required value="${show_no}">
			<input type="hidden" id="Numseats" required min="0"
				value="${show_seatchoice}"> <input type="hidden" id="sc"
				required value="${scVOseatscVO1}"> <input type="hidden"
				id="row" required value="${scVOseatRow}"> <input
				type="hidden" id="col" required value="${scVOseatCol}">
		</div>

		<!-- seat layout -->
		<div id="seatsBlock" class="container"
			style="display: inline-block; text-align: center;">
			<p id="notification"></p>
			<div class="screen">

				<h2 class="alert alert-warning" style="text-align: center;">Screen</h2>
			</div>
			<c:forEach var="movie" items="${scVOseatCol}" varStatus="status">
				<c:set var="data" value="${fn:substring(movie,0,1)}${status.index+1}" />
				<c:if test="${status.index%5==0 && status.index!=0}">
					&emsp; &emsp;
				</c:if>

				<%-- <c:if test="${0 eq movie && status.index!=0}">
					</tr>
					<tr>
						</c:if> --%>

				<c:if test="${fn:substring(movie,1,4) eq '0' && status.index!=0 }">
					<br />
						${fn:substring(movie,0,1)}
					</c:if>

				<c:if test="${status.first}">
						${fn:substring(movie,0,1)}
					</c:if>
				<input type="checkbox" class="seats"
					name="${fn:substring(movie,0,1)}${status.index+1}"
					value="${fn:substring(movie,0,1)}${status.index+1}"
					<c:forEach var="array" items="${seatArray}" step="1">
								<c:if test="${data eq array}">checked="checked" id="pay"</c:if></c:forEach>
					<c:forEach var="arrayno" items="${seatArrayno}" step="1">
								<c:if test="${data eq arrayno}">checked="checked" id="nopay"</c:if></c:forEach>
					id="sel">

				<%--  <td>${fn:substring(movie,0,1)}${status.index+1}</td> --%>
			</c:forEach>
			&emsp; &emsp;
			<br />

		</div>
		<br /> <br />
		<div>
			<button onclick="updateTextArea()">좌석선택하기</button>
			<button onclick="clearTextArea()">다시선택하기</button>
			<ul class="seat_w3ls">
				<li class="selected">예약완료좌석</li>

				<li class="selectednopay">예약중인좌석(주의 : 예약후 5분동안 미결제시 취소됨)</li>

				<li class="empty">빈좌석</li>
			</ul>
		</div>
	</div>
	<!-- //seat layout -->
	<!-- details after booking displayed here -->
	<form action="homeshowseat2.do" method="post" id="step2form">
		<div class="container">
			<input type="hidden" id="show_id" name="show_no" required
				value="${show_no}">
			<table class="Displaytable w3ls-table" width="100%">
				<tr>
					<th>Number of Seats</th>
					<th>Seats</th>
				</tr>
				<tr>
					<td><textarea id="NumberDisplay" name="NumberDisplay"></textarea></td>
					<td><textarea id="seatsDisplay" name="seatsDisplay"></textarea></td>
				</tr>
			</table>
		</div>
	</form>
	<!-- //details after booking displayed here -->
	<ul class="list-inline text-center">
		<li><button type="button" class="btn btn-default col-md-2 prev-step">이전</button></li>
		<li><button type="button" class="btn btn-primary col-md-2 next-step">세이브 및 다음</button></li>
	</ul>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>

	<script>
		$(function() {
			var col = $("#col").val();
			var row = $("#row").val();
			var colsplit = col.substring(1, col.length - 1).split(",");
			var rowsplit = row.substring(1, row.length - 1).split(",");

			//버튼클릭시(이전, 다음)
			$(".prev-step").click(function() {
				history.back();
			});

			$(".next-step").click(function() {
				$("#step2form").submit();
			});

			//초기설정
			$(".inputForm").prop("disabled", true);
			$(".seatStructure").prop("disabled", false);
			document.getElementById("notification").innerHTML = "<b style='margin-bottom:0px;background:#ff9800;letter-spacing:1px;'>"
					+ " 좌석을 선택하여 주십시요!!</b> ";

			$('#nameDisplay').attr("readonly", true);
			$('#NumberDisplay').attr("readonly", true);
			$('#seatsDisplay').attr("readonly", true);

			$('#seatsBlock :checked').each(function() {
				$("#seatsBlock :checked").prop("disabled", true);
			});

			//다음버튼숨기기
			$(".next-step").hide();
		});

		//처음설정 숨김글자 수정불가
		function onLoaderFunc() {
			$(".seatStructure").prop("disabled", true);
			$(".displayerBoxes").prop("disabled", true);
		}

		//다시선택하기 버튼클릭시
		function clearTextArea() {
			window.location.reload();
			//밑에 결과나오는 부분(text) 지우기
			//$('#nameDisplay').val("");
			//$('#NumberDisplay').val("");
			//$('#seatsDisplay').val("");

			//다음버튼비활성화
			//$(".next-step").hide();

			//$('.seats').prop("disabled", false);
			//$('.seats').prop('checked', false);
			onLoaderFunc();

		}

		//좌석선택하기 버튼클릭시
		function updateTextArea() {
			var allNameVals = [];
			var allNumberVals = [];
			var allSeatsVals = [];

			if ($("input:checked").length > 0) {
				$(".seatStructure").prop("disabled", true);

				$('.seats').prop("disabled", true);

				$('#seatsBlock :checked').each(function() {

					allSeatsVals.push($(this).val());
				});

				<c:forEach var="array" items="${seatArray}" varStatus="i">
				//allSeatsVals[${i.index}] = '${array}';
				allSeatsVals.splice(allSeatsVals.indexOf("${array}"), 1);
				</c:forEach>

				//alert(allSeatsVals);
				//Storing in Array
				allNumberVals.push(allSeatsVals.length);

				if (allNumberVals == 0) {
					alert("Please select 0 seats");
					window.location.reload();
				}
				//밑에 결과나오는 부분(text)
				$('#NumberDisplay').val(allNumberVals);
				$('#seatsDisplay').val(allSeatsVals);

				//다음버튼보이기
				$(".next-step").show();

			} else {
				alert("Please select 0 seats");
				window.location.reload();
			}
		}
	</script>
	<!-- //script for seat selection -->
</body>
</html>