<%--
/**
 * 1. 프로젝트명 : books.jsp
 * 2. 작성일 : 2022. 6. 21. 오후 2:43:14
 * 3. 작성자 : mite88
 * 4. 설명 : 예약확인
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 21.    mite88   
 */
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 Date date= new Date();
 Calendar cal = Calendar.getInstance();
 cal.setTime (date);
 cal.add (Calendar.DATE, 60);
 date = cal.getTime();

 Date date2= new Date();
 Calendar cal2 = Calendar.getInstance();
 cal2.setTime (date);
 cal2.add (Calendar.DATE, 120);
 date2 = cal2.getTime();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title_name}</title>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/user/resources/css/cal.css' rel='stylesheet' />

<style>
#calendar {
	margin: 0 auto;
}
</style>
</head>
<body>
<!-- 현재일 및 두달뒤부터 가능하게 설정 -->

	<!-- 로그인 여부에 따른 설정 -->
	<c:choose>
		<c:when test="${empty USER_ID}">
			<script>
				alert("로그인 후 이용 가능합니다");
				window.history.back();
				
			</script>
		</c:when>
		<c:otherwise>
		
			<!-- header -->
			<jsp:include page="../layout/header.jsp"></jsp:include>
			
			<!-- bootstrap-datepicker -->
			<script src="<%=request.getContextPath()%>/user/resources/lib/bootstrap-datepicker-master/js/bootstrap-datepicker.js"></script>
			<script src="<%=request.getContextPath()%>/user/resources/lib/bootstrap-datepicker-master/js/bootstrap-datepicker.kr.js"></script>
			<link rel="stylesheet" href="<%=request.getContextPath()%>/user/resources/lib/bootstrap-datepicker-master/css/bootstrap-datepicker.css">
		
			<!-- fullcalendar CDN -->
			<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
			<!-- fullcalendar 언어 CDN -->
			<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
		
			<script src='<%=request.getContextPath()%>/user/resources/js/cal.js'></script>
					
				

			<div class="container-xxl project py-5">
				<div class="container">
					<div class="text-center mx-auto mb-5 wow fadeInUp"
						data-wow-delay="0.1s"
						style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
						<h4 class="section-title">${title_name}</h4>
						<h1 class="display-5 mb-4">Visit Our Latest Projects And Our
							Innovative Works</h1>
					</div>
					<!-- 안내 -->
					<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s"
						style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

						<div class="col-lg-12">
							<div class="tab-content w-100">


								<div class="row g-4">
									<div class="col-md-6" style="min-height: 350px;">
										<div class="position-relative h-100">
											<img class="position-absolute img-fluid w-100 h-100"
												src="<%=request.getContextPath()%>/user/resources/img/project-1.jpg"
												style="object-fit: cover;" alt="">
										</div>
									</div>
									<div class="col-md-6">
										<h1 class="mb-3">25 Years Of Experience In Architecture
											Industry</h1>
										<p class="mb-4">Tempor erat elitr rebum at clita. Diam
											dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat
											ipsum et lorem et sit, sed stet lorem sit clita duo justo
											magna dolore erat amet</p>
										<p>
											<i class="fa fa-check text-primary me-3"></i>Design Approach
										</p>
										<p>
											<i class="fa fa-check text-primary me-3"></i>Innovative
											Solutions
										</p>
										<p>
											<i class="fa fa-check text-primary me-3"></i>Project Management
										</p>
										<a href="" class="btn btn-primary py-3 px-5 mt-3">Read More</a>
									</div>
								</div>


								<div class="col-md-12 mt-4">
									<p style="text-align: center;">
										<strong><span style="font-size: 20px;">예약예시</span></strong>
									</p>
									<p style="text-align: center;">
										<span
											style="background-color: rgb(255, 255, 255); color: rgb(122, 146, 165);">회원가입하셔야 작성가능합니다</span>
									</p>
									<p style="text-align: center;">
										<br>
									</p>
									<p style="text-align: center;">아래버튼을 눌러 예약 후 </p>
									<p style="text-align: center;">010 - 000 - 0000으로 문자보내주시면됩니다.</p>
									
									<p style="text-align: center;">
										<button type="button" class="btn btn-primary py-3 px-5 mt-3" id="editBtn">간단 예약</button>
									</p>
								</div>

								<!-- 캘린더 -->
								<div class="row my-5">
									<input type="hidden" name="code" id="code" value="">
									<div id='calendar'></div>
								</div>

							</div>

						</div>
						<!-- col-lg-12 end -->

					</div>
					<!-- row end -->

				</div>
			</div>

			<!-- footer -->
			<jsp:include page="../layout/footer.jsp"></jsp:include>

			<!-- editModal -->
			<div class="modal fade" id="editModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New message</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<!-- 복사넣기 -->
								<div class="mb-3 clone_select"></div>
								<input type="hidden" class="form-control" id="number">
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">title:</label>
									<input type="text" class="form-control" id="title">
								</div>

							
								<%-- <div class="mb-3">
									<label for="startDate">Start</label> 
									<input id="startDate" class="form-control" type="date"  
									min="<fmt:formatDate value="<%=date%>" pattern = "yyyy-MM-dd"/>" /> 
									<span id="startDateSelected"></span> 
									<label for="endDate">End</label>
									<input id="endDate" class="form-control" type="date" 
									min="<fmt:formatDate value="<%=date2%>" pattern = "yyyy-MM-dd"/>" /> 
									<span id="endDateSelected"></span>
								</div> --%>

								<div class="mb-3">
									<div class="input-group has-validation">
										<input class="from_date form-control" placeholder="Select start date" type="text" id="startDate" name="startDate">
										<span class="input-group-text">~</span> 
										<input class="to_date form-control" placeholder="Select end date" type="text" id="endDate" name="endDate">
									</div>
								</div>
								
								<script>
								
								$(".from_date").datepicker({
								    format: 'yyyy-mm-dd',
								    autoclose: true,
								    startDate: '+2m',
								    language : "kr",
								}).on('changeDate', function (selected) {
									var date = new Date(selected.date.valueOf());
									var startDate =   new Date(date.setDate(date.getDate() + 60));

								    $('.to_date').datepicker('setStartDate', startDate);
								}).on('clearDate', function (selected) {
								    $('.to_date').datepicker('setStartDate', null);
								});

								$(".to_date").datepicker({
								    format: 'yyyy-mm-dd',
								    autoclose: true,
								    language : "kr"
								});
								</script>


								<div class="mb-3">
									<label for="message-text" class="col-form-label">Message:</label>
									<textarea class="form-control" id="message-text"></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" id="submitButton">Send message</button>
						</div>
					</div>
				</div>
			</div>


			<!-- viewModal -->
			<div class="modal fade" id="viewModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">예약조회</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<input type="hidden" class="form-control" id="number">
								<div class="mb-3">
									<label for="title" class="col-form-label">title:</label>
									<input type="text" class="form-control" id="title">
								</div>
								
								<div class="mb-3">
									<label for="office_name" class="col-form-label">지점명:</label>
									<input type="text" class="form-control" id="o_name">
								</div>

								<div class="mb-3">
									<label for="startDate">Start</label> 
									<input id="startDate" class="form-control" type="date" /> 
									<span id="startDateSelected"></span> 
									<label for="endDate">End</label>
									<input id="endDate" class="form-control" type="date" /> 
									<span id="endDateSelected"></span>
								</div>


								<div class="mb-3">
									<label for="message-text" class="col-form-label">Message:</label>
									<textarea class="form-control" id="message-text"></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>


		</c:otherwise>

	</c:choose>
</body>
</html>

