<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<head>
<meta charset='UTF-8'>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/homeshowseat.css">
<link rel="stylesheet" href="resources/style2.css">
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

</head>

<body style="font-size: 16px;" >


	<div class="container">
		<h3>Step 1 - 정보확인</h3>
		<form action="homeshowseat1.do" method="post" id="stepform">
			<section class="mbr-section content6 cid-r061BHo7mB" id="content6-0"
				style="background-color: #efefef;">
				<div class="container">
					<div class="media-container-row">
						<div class="col">
							<div class="media-container-row">
								<div class="mbr-figure" style="width: 70%;">
									<img src="homeimgtitle.do?show_no=${ssplVO1.show_no}&idx=2"
										alt="Mobirise">
								</div>
								<div class="media-content">
									<div class="mbr-section-text">
										<p class="mbr-text mb-0 mbr-fonts-style display-7">
											<input type="hidden" id="show_no" name="show_no"
												value="${ssplVO1.show_no}"> <strong>공연명:${ssplVO1.show_title}</strong>
											<br /> 장&nbsp;&nbsp;&nbsp;&nbsp;소:0000공연장
											${ssplVO1.show_id_name} <br />
											날&nbsp;&nbsp;&nbsp;&nbsp;짜:${fn:substring(ssplVO1.show_startdate,0,13)}시
											~ ${fn:substring(ssplVO1.show_enddate,0,13)}시 <br />
											<table class="table table-sm table-primary">
											<thead>
												<tr>
													<th scope="col">좌석종류</th>
													<th scope="col">가격</th>
													<th scope="col">남은좌석수</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="item" items="${scVO1}" varStatus="status">

													<tr>
														<td>${item.ss_seattype}석</td>
														<td>${item.ss_seatpay}원</td>
														<td>${item.ss_seatcount}</td>
													</tr>

												</c:forEach>
											</tbody>
										</table>

										</p>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>
			<hr>
			<ul class="list-inline text-center">
				<li><button type="button" class="btn btn-primary col-md-2 next-step1">다음</button></li>
			</ul>
		</form>
	</div>

	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
	<script src="resources/js/sweetalert2.min.js"></script>
	<script src="resources/js/jquery.bpopup.min.js"></script>
	<script>
		$(function() {

	/* window.addEventListener("beforeunload", function (e) {
		  var confirmationMessage = "\o/";

		  (e || window.event).returnValue = confirmationMessage; //Gecko + IE
		  return confirmationMessage;                            //Webkit, Safari, Chrome
	});
 */
 
			

			//다음버튼클릭시
			$(".next-step1").on("click", function() {
				//alert($("#show_seatchoice option:selected").val());
				/* if($("#show_seatchoice option:selected").val() === undefined){
					swal('예약할 좌석을 선택해주세요');
				}else{
					$("#stepform").submit();
				} */
				$("#stepform").submit();
			});
		});
	</script>

</body>
</html>