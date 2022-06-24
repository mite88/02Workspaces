<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>소호사무실예약</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

</head>

<body>

	<!-- header -->
	<jsp:include page="layout/header.jsp"></jsp:include>

	<!-- carousel -->
	<jsp:include page="layout/carousel2.jsp"></jsp:include>


	<div class="container-xxl py-5">
		<!-- Facts Start -->
		<!--  서비스 -->
		<div class="container-xxl py-5">
			<div class="container pt-5">
				<div class="row g-4">
					<div class="col-xxl-3 col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="fact-item text-center bg-light h-100 p-5 pt-0">
							<div class="fact-icon">
								<img
									src="<%=request.getContextPath()%>/user/resources/img/icons/icon-2.png"
									alt="Icon">
							</div>
							<h3 class="mb-3">합리적비용</h3>
							<p class="mb-0">최소비용으로 최대 이윤</p>
						</div>
					</div>
					<div class="col-xxl-3 col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
						<div class="fact-item text-center bg-light h-100 p-5 pt-0">
							<div class="fact-icon">
								<img
									src="<%=request.getContextPath()%>/user/resources/img/icons/icon-3.png"
									alt="Icon">
							</div>
							<h3 class="mb-3">비용</h3>
							<p class="mb-0">사무실 임래료 비용부담 감소</p>
						</div>
					</div>
					<div class="col-xxl-3 col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
						<div class="fact-item text-center bg-light h-100 p-5 pt-0">
							<div class="fact-icon">
								<img
									src="<%=request.getContextPath()%>/user/resources/img/icons/icon-4.png"
									alt="Icon">
							</div>
							<h3 class="mb-3">부가 서비스</h3>
							<p class="mb-0">팩스, 복합기, 사무용품, 기타용품 제공</p>
						</div>
					</div>
					<div class="col-xxl-3 col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
						<div class="fact-item text-center bg-light h-100 p-5 pt-0">
							<div class="fact-icon">
								<img
									src="<%=request.getContextPath()%>/user/resources/img/icons/icon-4.png"
									alt="Icon">
							</div>
							<h3 class="mb-3">다양성</h3>
							<p class="mb-0">인원수에 따른 장소제공</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Facts End -->


		<!-- About Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="row g-5">
					<div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
						<div class="about-img">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/user/resources/img/about-1.jpg"
								alt=""> <img class="img-fluid"
								src="<%=request.getContextPath()%>/user/resources/img/about-2.jpg"
								alt="">
						</div>
					</div>
					<div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
						<h4 class="section-title">Way Soho Office?</h4>
						<h1 class="display-5 mb-4">business partner for the office</h1>
						<p>저희 소호사무실 00은 소호사무실 예약사이트입니다. 합리적인 비용과 서비스로 당신의 든든한 파트너가
							되어드립니다.</p>
						<p class="mb-4">1인실 부터 다인실까지 다양한 사무실을 제공하고 있습니다.</p>

						<div class="d-flex align-items-center mb-5">
							<div
								class="d-flex flex-shrink-0 align-items-center justify-content-center border border-5 border-primary"
								style="width: 120px; height: 120px;">
								<h1 class="display-1 mb-n2" data-toggle="counter-up">25</h1>
							</div>
							<div class="ps-4">
								<h3>Soho Office</h3>
								<h3 class="mb-0">Number of Branches</h3>
							</div>
						</div>
						<a class="btn btn-primary py-3 px-5" href="">Read More</a>
					</div>
				</div>
			</div>
		</div>
		<!-- About End -->


		<!-- 지점소개 Start -->
		<div class="container-xxl py-5" id="office_info">
			<div class="container">
				<div class="text-center mx-auto mb-5 wow fadeInUp"
					data-wow-delay="0.1s" style="max-width: 600px;">
					<h4 class="section-title">지점소개</h4>
					<h1 class="display-5 mb-4">Introducing our affiliated branches</h1>
				</div>
				<div class="row g-4" >
			
					<nav>
					  <div class="nav nav-tabs nav-pills flex-column flex-sm-row text-center bg-light border-0 rounded-nav" id="nav-tab" role="tablist">
					    <c:forEach items='${office_list }' var="row" varStatus="loop">

						    <c:if test="${loop.first}">
						    	<!-- 첫번째만추가 -->
								<button class="nav-link flex-sm-fill active" id="${row.code}" data-bs-toggle="tab" data-bs-target="#nav-${row.code}" 
								type="button" role="tab" aria-controls="nav-${row.code}" aria-selected="true">${row.o_name}</button>
							</c:if>
							<c:if test="${ not loop.first}">
							 	<button class="nav-link flex-sm-fill" id="${row.code}" data-bs-toggle="tab" data-bs-target="#nav-${row.code}" 
							 	type="button" role="tab" aria-controls="nav-${row.code}" aria-selected="true">${row.o_name}</button>
							</c:if>

						</c:forEach>
					  </div>
					</nav>
				
					<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
					
						 <c:forEach items='${office_list }' var="row2" varStatus="loop">
						 
							 <c:if test="${loop.first}">
						    	<!-- 첫번째만추가 -->
						    	 <div class="tab-pane fade show active" id="nav-${row2.code}" role="tabpanel" aria-labelledby="${row2.code}">
								
							</c:if>
							<c:if test="${ not loop.first}">
							 	 <div class="tab-pane fade show" id="nav-${row2.code}" role="tabpanel" aria-labelledby="${row2.code}">
							</c:if>
							
								<div class="row g-4">
								
								
									<div class="col-lg-6 col-md-12 " >
					                    
					                    <img class="img-fluid" src="<%=request.getContextPath()%>/Uploads/office/${row2.o_img1}" alt="">
					                    
					                </div>
					                <div class="col-lg-6 col-md-12 " >
					                    
					                    <img class="img-fluid" src="<%=request.getContextPath()%>/Uploads/office/${row2.o_img2}" alt="">
					                   
					                </div>
								
								</div>
	
							</div>

						</c:forEach>

						
					</div>
					
					
				</div>

			</div>
		</div>
		<!-- Service End -->



		<!-- Project Start -->
		<div class="container-xxl project py-5">
			<div class="container">
				<div class="text-center mx-auto mb-5 wow fadeInUp"
					data-wow-delay="0.1s" style="max-width: 600px;">
					<h4 class="section-title">Our Projects</h4>
					<h1 class="display-5 mb-4">Visit Our Latest Projects And Our
						Innovative Works</h1>
				</div>
				<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
					<div class="col-lg-4">
						<div
							class="nav nav-pills d-flex justify-content-between w-100 h-100 me-4">
							<button
								class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4 active"
								data-bs-toggle="pill" data-bs-target="#tab-pane-1" type="button">
								<h3 class="m-0">01. Modern Complex</h3>
							</button>
							<button
								class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4"
								data-bs-toggle="pill" data-bs-target="#tab-pane-2" type="button">
								<h3 class="m-0">02. Royal Hotel</h3>
							</button>
							<button
								class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4"
								data-bs-toggle="pill" data-bs-target="#tab-pane-3" type="button">
								<h3 class="m-0">03. Mexwel Buiding</h3>
							</button>
							<button
								class="nav-link w-100 d-flex align-items-center text-start p-4 mb-0"
								data-bs-toggle="pill" data-bs-target="#tab-pane-4" type="button">
								<h3 class="m-0">04. Shopping Complex</h3>
							</button>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="tab-content w-100">
							<div class="tab-pane fade show active" id="tab-pane-1">
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
											<i class="fa fa-check text-primary me-3"></i>Project
											Management
										</p>
										<a href="" class="btn btn-primary py-3 px-5 mt-3">Read
											More</a>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-pane-2">
								<div class="row g-4">
									<div class="col-md-6" style="min-height: 350px;">
										<div class="position-relative h-100">
											<img class="position-absolute img-fluid w-100 h-100"
												src="<%=request.getContextPath()%>/user/resources/img/project-2.jpg"
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
											<i class="fa fa-check text-primary me-3"></i>Project
											Management
										</p>
										<a href="" class="btn btn-primary py-3 px-5 mt-3">Read
											More</a>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-pane-3">
								<div class="row g-4">
									<div class="col-md-6" style="min-height: 350px;">
										<div class="position-relative h-100">
											<img class="position-absolute img-fluid w-100 h-100"
												src="<%=request.getContextPath()%>/user/resources/img/project-3.jpg"
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
											<i class="fa fa-check text-primary me-3"></i>Project
											Management
										</p>
										<a href="" class="btn btn-primary py-3 px-5 mt-3">Read
											More</a>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-pane-4">
								<div class="row g-4">
									<div class="col-md-6" style="min-height: 350px;">
										<div class="position-relative h-100">
											<img class="position-absolute img-fluid w-100 h-100"
												src="<%=request.getContextPath()%>/user/resources/img/project-4.jpg"
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
											<i class="fa fa-check text-primary me-3"></i>Project
											Management
										</p>
										<a href="" class="btn btn-primary py-3 px-5 mt-3">Read
											More</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Project End -->

	</div>


	<!-- footer -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>

</html>