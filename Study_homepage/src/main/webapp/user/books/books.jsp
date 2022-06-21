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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title_name}</title>

<!-- fullcalendar CDN -->  
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>  
<!-- fullcalendar 언어 CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<link href='<%=request.getContextPath()%>/user/resources/css/cal.css' rel='stylesheet' />  
<script src='<%=request.getContextPath()%>/user/resources/js/cal.js'></script>

<style>

  #calendar {
    margin: 0 auto;
  }

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header.jsp"></jsp:include>


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
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

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
								<p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor
									diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum
									et lorem et sit, sed stet lorem sit clita duo justo magna
									dolore erat amet</p>
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


						<!-- 캘린더 -->
						<div class="row my-5">
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

	<!-- model -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">Recipient:</label>
							<input type="text" class="form-control" id="title">
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
					<button type="button" class="btn btn-primary" id="submitButton">Send message</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

