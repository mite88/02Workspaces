<%--
/**
 * 1. 프로젝트명 : contact.jsp
 * 2. 작성일 : 2022. 6. 14. 오후 3:48:57
 * 3. 작성자 : mite88
 * 4. 설명 : 제휴게시판(이메일형)
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 14.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="<%=request.getContextPath()%>/resources/jQuery/jquery-3.6.0.min.js"></script>

<link
	href="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/resources/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<jsp:include page="../layout/header.jsp" />

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

						<div class="row my-5">

							<!-- Bootstrap 5 starter form -->
							<form id="contactForm" action="../contact.do/franchise" method="post"
								enctype="multipart/form-data">

								<!-- Name input -->
								<div class="mb-3">
									<label class="form-label" for="name">Name</label> <input
										class="form-control" id="name" name="name" type="text"
										placeholder="Name" />
									<div class="invalid-feedback" data-sb-feedback="name:required">Name
										is required.</div>
								</div>

								<!-- Email address input -->
								<div class="mb-3">
									<label class="form-label" for="emailAddress">Email
										Address</label> <input class="form-control" id="emailAddress"
										name="emailAddress" type="email" placeholder="Email Address" />

									<div class="invalid-feedback"
										data-sb-feedback="emailAddress:required">Email Address
										isrequired.</div>
									<div class="invalid-feedback"
										data-sb-feedback="emailAddress:email">Email Address
										Email is not valid.</div>
								</div>

								<!-- Message input -->
								<div class="mb-3">
									<label class="form-label" for="message">Message</label>
									<textarea class="form-control" id="message" name="message"
										type="text" placeholder="Message" style="height: 10rem;"></textarea>
									<div class="invalid-feedback"
										data-sb-feedback="message:required">Message is required.</div>
								</div>

								<!-- Form submissions success message -->
								<div class="d-none" id="submitSuccessMessage">
									<div class="text-center mb-3">Form submission successful!</div>
								</div>
								<!-- Form submissions error message -->
								<div class="d-none" id="submitErrorMessage">
									<div class="text-center text-danger mb-3">Error sending
										message!</div>
								</div>

								<div class="mb-3">
									<label class="form-label" for="file">file</label> <input
										class="form-control" type="file" name="file" id="file" />
								</div>



								<!-- Form submit button -->
								<div class="d-grid">
									<button class="btn btn-primary btn-lg " id="submitButton"
										type="submit">Submit</button>
								</div>

							</form>

						</div>

					</div>

				</div>
				<!-- col-lg-12 end -->

			</div>
			<!-- row end -->

		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" />


</body>
</html>