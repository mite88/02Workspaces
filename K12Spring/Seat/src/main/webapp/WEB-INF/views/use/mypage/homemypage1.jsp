<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<div class="page-header clear-filter" filter-color="orange">
		<div class="page-header-image" data-parallax="true"
			style="background-image: url(http://ijuju88.cdn3.cafe24.com/img/orchestra.jpg); transform: translate3d(0px, 0px, 0px);">
		</div>
		<div class="container">
			<div class="photo-container">
				<h3 class="title">예약현황</h3>
			</div>
		</div>
	</div>


	<div class="section">
		<div class="container">
		<form action="homepayseat3.do" method="get" id="step3Form">
			<table class="table table-hover" id="tables" >
				<thead>
					<tr>
						<th style="display: none;">정보</th>
						<th style="display: none;">정보</th>
						<th>공연명</th>
						<th>공연좌석</th>
						<th>가격</th>
						<th>예약일</th>
						<th>결제완료상태</th>
						<th style="display:none;">결제완료상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td style="display: none;">${vo.ssr_no}</td>
							<td style="display: none;">${vo.show_no}</td>
							<td><a href="#">${vo.show_title}</a></td>

							<td>
								<c:choose>
									<c:when test="${fn:length(vo.ssr_seat) > 20}">
										<c:out value="${fn:substring(vo.ssr_seat,0,19)}" />....
          							 </c:when>
									<c:otherwise>
										<c:out value="${vo.ssr_seat}" />
									</c:otherwise>
								</c:choose>
							</td>
							<td>${vo.ssr_price}</td>
							<td>${vo.ssr_date}</td>
							<td style="display:none;">${vo.show_startdate}</td>
							<c:choose>

								<c:when test="${vo.ssr_payset eq 'Y'}">
									<td>${vo.ssr_payset}
									<button type="button" class="btn btn-outline-info print">티켓출력</button>
									</td>
								</c:when>

								<c:otherwise>
									<td>${vo.ssr_payset}
										<button type="button" class="btn btn-outline-info step3">결제하기</button>
										<button type="button" class="btn btn-outline-info deleteseat">취소하기</button>
									</td>
								</c:otherwise>
							</c:choose>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
</div></div>
<div class="row justify-content-center">
<div class="col-lg-8 col-md-4 demo twelve columns">
</div>
</div>
</body>
</html>