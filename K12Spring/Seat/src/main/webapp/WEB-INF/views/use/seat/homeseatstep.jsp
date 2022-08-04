<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<html>
</head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/home.css">
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap3.3.4.min.css">
<style>
.m-progress-bar {
	min-height: 1em;
	background: #c12d2d;
	width: 5%;
}

h1 {
	margin-top: 100px;
	text-align: center;
}
</style>
<title>jQuery Multi-Step Modal Demos</title>
</head>
<body>
	<div class="jquery-script-ads" style="margin: 30px auto;"
		align="center">
		<!-- button class="btn btn-default" data-toggle="modal" data-target="#demo-modal-3">Show</button> -->

		<script type="text/javascript"
			src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
	</div>
	<form class="modal multi-step" id="demo-modal-3">
		<input type="hidden" id="show_no" name="show_no" required
			value="${show_no}">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title step-1" data-step="1">Step 1</h4>
					<h4 class="modal-title step-2" data-step="2">Step 2</h4>
					<h4 class="modal-title step-3" data-step="3">Final Step</h4>
					<div class="m-progress">
						<div class="m-progress-bar-wrapper">
							<div class="m-progress-bar"></div>
						</div>
						<div class="m-progress-stats">
							<span class="m-progress-current"> </span> / <span
								class="m-progress-total"> </span>
						</div>
						<div class="m-progress-complete">Completed</div>
					</div>
				</div>
				<div class="modal-body step-1" data-step="1" id="step1">
					<jsp:include page="step1.jsp" flush="true">
						<jsp:param name="step" value="1" />
					</jsp:include>
				</div>
				<div class="modal-body step-2" data-step="2" id="step2">
					<jsp:include page="step2.jsp">
						<jsp:param name="step" value="2" />
					</jsp:include>
				</div>
				<div class="modal-body step-3" data-step="3" id="step3">
					<jsp:include page="step3.jsp">
						<jsp:param name="step" value="3" />
					</jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary step step-2"
						data-step="2" onclick="sendEvent('#demo-modal-3', 1)">Back</button>
					<button type="button" class="btn btn-primary step step-1"
						data-step="1" onclick="sendEvent('#demo-modal-3', 2)">Continue</button>
					<button type="button" class="btn btn-primary step step-3"
						data-step="3" onclick="sendEvent('#demo-modal-3', 2)">Back</button>
					<button type="button" class="btn btn-primary step step-2"
						data-step="2" onclick="sendEvent('#demo-modal-3', 3)">Continue</button>
				</div>
			</div>
		</div>
	</form>
	<script src="resources/js/multi-step-modal.js"></script>
	<script>
	$(function () {
		 $('#demo-modal-3').modal('show');
		 //$("#step1").load('homeseatstep.do?show_no=2018813145649&step='+1);
		 //$("#step2").load('homeseatstep.do?show_no=2018813145649&step='+2);
		// $("#step3").load('homeseatstep.do?show_no=2018813145649&step='+3);
	});
sendEvent = function(sel, step) {
	//location.href="homeseatstep.do?show_no=2018813145649&step="+step;

	/* //현재 주소를 가져온다.
	var renewURL = location.href;
	//현재 주소 중 page 부분이 있다면 날려버린다.
	renewURL = renewURL.replace(/\&step=([0-9]+)/ig,'');
 
	//새로 부여될 페이지 번호를 할당한다.
	// page는 ajax에서 넘기는 page 번호를 변수로 할당해주거나 할당된 변수로 변경
	renewURL += '&step='+step;
	
	//alert(url);
 
	//페이지 갱신 실행!
	history.pushState(null, null, renewURL); */

	 $(sel).trigger('next.m.' + step);
}
</script>
</html>



