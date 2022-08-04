<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<head>
<meta charset='UTF-8'>
<link rel='stylesheet'
	href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
<link rel="stylesheet" href="resources/homeshowseat.css">
<link rel="stylesheet" href="resources/style2.css">
<style>
.no-border {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}
</style>
<!-- https://sweetalert2.github.io/ -->
<script src="resources/js/sweetalert2.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<script
	src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

	<div id="tabs-3">
		<h3>확인 및 결제하기</h3>

		<p>
		<div class="container">
			<div class="media-container-row">
				<div class="col">
					<div class="media-container-row">
						<div class="mbr-figure" style="width: 70%;">
							<img src="homeimgtitle.do?show_no=${ssplVO.show_no}&idx=2"
								alt="Mobirise" width="30%;"> <strong>공연명: <input
								class="no-border" id="show_title" name="show_title"
								value="${ssplVO.show_title}" readonly>

							</strong> <br /> 장&nbsp;&nbsp;&nbsp;&nbsp;소:0000공연장
							${ssplVO.show_id_name} <br />
							날&nbsp;&nbsp;&nbsp;&nbsp;짜:${fn:substring(ssplVO.show_startdate,0,13)}시
							~ ${fn:substring(ssplVO.show_enddate,0,13)}시 <br />

						</div>
						<div class="media-content">
							<div class="mbr-section-text">
								<p class="mbr-text mb-0 mbr-fonts-style display-7">
									<input type="hidden" id="ssr_no" name="ssr_no"
										value="${seat3map.SSR_NO}" />
								<table class="table table-sm table-primary">
									<tbody>
										<tr>
											<td>사용자명</td>
											<td><input class="no-border" id="m_name" name="m_name"
												value="${smVO.m_name}" readonly></td>
										</tr>
										<tr>
											<td>이메일</td>
											<td><input class="no-border" id="m_email" name="m_email"
												value="${smVO.m_email}" readonly></td>
										</tr>
										<tr>
											<td>주소</td>
											<td><input class="no-border" id="m_addrs" name="m_addrs"
												value="${smVO.m_addr1}${smVO.m_addr2}" readonly></td>
										</tr>
										<tr style="display: none;">
											<td>우편번호</td>
											<td><input class="no-border" id="m_zip" name="m_zip"
												value="${smVO.m_zip}" readonly></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td><input class="no-border" id="m_tel" name="m_tel"
												value="${smVO.m_tel}" readonly></td>
										</tr>
									</tbody>
								</table>
								<table class="table table-sm table-primary">
									<thead>
										<tr>
											<th scope="col">예약좌석</th>
											<th scope="col">좌석가격</th>
										</tr>
									</thead>
									<tbody>

										<%-- <c:forTokens items="${seat3map.SSR_SEAT}" delims=","
											var="item">
											<tr>

												<td>${item}석</td>
												
										</c:forTokens> --%>

										<c:forEach var="item"
											items="${fn:split(seat3map.SSR_SEAT, ',')}"
											varStatus="status">
											<tr>
												<td>${item}석</td>
												<td>${mappay[status.index]}원</td>
											</tr>
										</c:forEach>

										<tr>
											<td colspan="2">총가격 : <input class="no-border"
												id="ssr_price" name="ssr_price"
												value="${seat3map.SSR_PRICE}" readonly>원
											</td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" id="show_no" name="show_no"
									value="${ssplVO.show_no}"> <input type="hidden"
									id="show_no" name="ssr_no" id="ssr_no"
									value="${seat3map.SSR_NO}">
								</p>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<ul class="list-inline text-center">
			<li><button type="button" class="btn btn-default col-md-2 prev-step">취소하기</button></li>
			<c:choose>

				<c:when test="${seat3map.SSR_PRICE==0}">
					<li><button type="button" class="btn btn-primary col-md-2b chk">예약하기</button></li>
				</c:when>

				<c:otherwise>
					<li><button type="button" class="btn btn-primary col-md-2 cardchk">결제하기</button></li>
				</c:otherwise>

			</c:choose>
		</ul>
		</p>
		<p class="text-center">
		5분동안 결제를 하지 않으면 예약이 취소됩니다. 결제취소시 mypage에서 결제 가능합니다.
		</p>
	</div>

	<script>
	$(function() {

		var ssr_no=$("#ssr_no").val();
		 //버튼클릭시(이전, 다음)
		$(".prev-step").click(function() {
			deleteswal();
		});	
		 
		 //예약하기 클릭시(금액없음)
		$(".chk").click(function() {
			  jQuery.ajax({
		            url: "homeshowseatok.do?ssr_no="+ssr_no+"&ssr_payset=Y", 
		            method: "GET"
		        }).done(function (data) {
					alert("정상결제");
					 window.location.href = "homeshowseat4.do";
		        })
		});	
		 
		//결제하기 클릭시
		 $(".cardchk").click(function() {

			var name=$("#show_title").val();
			var amount=$("#ssr_price").val();
			var email=$("#m_email").val();
			var name=$("#m_name").val();
			var tel=$("#m_tel").val();
			var addr=$("#m_addrs").val();
			var postcode=$("#m_zip").val();
			
			
			//아임포트 결제창용
			var IMP = window.IMP; // 생략가능
			IMP.init('imp85946757');
			
			IMP.request_pay({ // param
			    pg: "danal_tpay",
			    pay_method: "card",
			    merchant_uid: 'merchant_' + new Date().getTime(),
			    name: name,
			    amount: amount,
			    buyer_email: email,
			    buyer_name: name,
			    buyer_tel: tel,
			    buyer_addr: addr,
			    buyer_postcode: postcode
			}, function (rsp) { // callback
			    if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
			        // jQuery로 HTTP 요청
			        jQuery.ajax({
			            url: "homeshowseatok.do?ssr_no="+ssr_no+"&ssr_payset=Y", // 가맹점 서버
			            method: "GET",
			            headers: { "Content-Type": "application/json" },
			            data: {
			                imp_uid: rsp.imp_uid,
			                merchant_uid: rsp.merchant_uid
			            }
			        }).done(function (data) {
						alert("정상결제");
						 window.location.href = "homeshowseat4.do";
			        })
			    } else {
			        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
			    }
 
			});	
	});	
	//예약정보 삭제
	function deleteswal() {
		var ssr_no=$("#ssr_no").val();
		var show_no=$("#show_no").val();
		
		const swalWithBootstrapButtons = swal.mixin({
			  confirmButtonClass: 'btn btn-success',
			  cancelButtonClass: 'btn btn-danger',
			  buttonsStyling: false,
			})

			swalWithBootstrapButtons({
			  title: '정말 취소하시겠습니까?',
			  text: "이전으로 돌아가면 예약이 취소됩니다.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonText: 'Yes!',
			  cancelButtonText: 'No!',
			  reverseButtons: true
			}).then((result) => {
				
        		 if (result.value) {
        			 $.ajax({
                         type: "GET",
                         url: "homeshowseatdel.do?ssr_no="+ssr_no+"&show_no="+show_no,
                         success: function(data) {
                        	 self.close();   //자기자신창을 닫습니다
                         },
                         error: function() {
                             alert('Error occured');
                         }
                     })
                     
                   swal(
             		'Cancelled'
             	)
 
			  }
			})
		}

		 });
	
	</script>
</body>
</html>