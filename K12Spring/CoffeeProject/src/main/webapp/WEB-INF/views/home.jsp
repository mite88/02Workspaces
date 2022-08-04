<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<!-- header -->
<%@ include file="/WEB-INF/views/user/layout/header.jsp"%>


<!-- Go Trip -->
<!-- Go Trip CSS  -->

<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/css/main.css">


<!-- Go Trip CSS -->

<meta charset="utf-8">


</head>

<body>


	<!-- Carousel Start -->
	<div class="container-fluid p-0 pb-5">
		<div class="owl-carousel header-carousel position-relative">
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid"
					src="<%=request.getContextPath()%>/resources/img/main커피1.png"
					alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To WooDY</h5>
								<h1 class="display-6 text-white animated slideInDown mb-4">Best
									Carpenter & Craftsman Services</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">무엇을 넣을까?</p>
								<!-- 이거 누르면 회원가입으로 갑니다 -->
								<a href="<%= request.getContextPath() %>/SignUp.do"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
									More</a> <a href=""
									class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
									Quote</a>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="owl-carousel-item position-relative">
				<img class="img-fluid"
					src="<%=request.getContextPath()%>/resources/img/커피2.png" alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To WooDY</h5>
								<h1 class="display-6 text-white animated slideInDown mb-4">카페
									추천1</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">Vero elitr
									justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd
									rebum ipsum et diam justo clita et kasd rebum sea elitr.</p>


								<!-- 이거 누르면 회원가입으로 갑니다 -->
								<a href="<%= request.getContextPath() %>/SignUp.do"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
									More</a> <a href=""
									class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
									Quote</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid"
					src="<%=request.getContextPath()%>/resources/img/커피3.png" alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To WooDY</h5>
								<h1 class="display-6 text-white animated slideInDown mb-4">Best
									Carpenter & Craftsman Services</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">Vero elitr
									justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd
									rebum ipsum et diam justo clita et kasd rebum sea elitr.</p>
								<!-- 이거 누르면 회원가입으로 갑니다 -->
								<a href="<%= request.getContextPath() %>/SignUp.do"
									class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
									More</a> <a href=""
									class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
									Quote</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Carousel End -->


	<!-- 검색창 -->
	<div class="container-xxl py-3">
		<div class="container">
			<!-- <div class="section-title text-center">
				<h1 class="display-6 mb-5">Our Services</h1>
			</div> -->
			<div class="row">
				<div class="col wow fadeInUp" data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">

				</div>

				<div class="col-md-6 wow fadeInUp" data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
					<!-- 검색창 -->

					<div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4"
						data-bs-toggle="offcanvas" data-bs-target="#searchcanvasTop"
						aria-controls="offcanvasTop">
						<div class="input-group">
							<input type="search" placeholder="여기에 카페를 검색하세요"
								aria-describedby="button-addon1"
								class="form-control border-0 bg-light">
							<div class="input-group-append">
								<button id="button-addon1" type="submit"
									class="btn btn-link text-primary">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>

				</div>

				<div class="col wow fadeInUp" data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">

				</div>


			</div>
		</div>
	</div>
	<!-- 검색 end -->


	<!-- 이달의 카페 -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="section-title text-center">
				<h1 class="display-6 mb-5">이달의 카페</h1>
			</div>
			<div class="row g-4">
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/service-1.jpg"
								alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">General Carpentry</h4>
							<p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam
								lorem diam.</p>
							<a class="fw-medium" href="">Read More<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/service-2.jpg"
								alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">Manufacturing</h4>
							<p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam
								lorem diam.</p>
							<a class="fw-medium" href="">Read More<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/service-3.jpg"
								alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">Furniture Remodeling</h4>
							<p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam
								lorem diam.</p>
							<a class="fw-medium" href="">Read More<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/service-4.jpg"
								alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">Wooden Floor</h4>
							<p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam
								lorem diam.</p>
							<a class="fw-medium" href="">Read More<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/service-5.jpg"
								alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">Wooden Furniture</h4>
							<p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam
								lorem diam.</p>
							<a class="fw-medium" href="">Read More<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/resources/img/service-6.jpg"
								alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">Custom Work</h4>
							<p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam
								lorem diam.</p>
							<a class="fw-medium" href="">Read More<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Service End -->


	<style>
#main_story .owl-stage-outer {
	border-radius: 2rem;
}
</style>

	<!-- 중앙 Start -->

	<div class="container-xxl py-5" id="main_story">
		<div class="container">
			<div class="section-title text-center">
				<h1 class="display-6 mb-5">카페 STORY</h1>
			</div>
			<div class="row g-4">
				<div class="col-12">

					<!-- Carousel Start -->
					<div class="container-fluid p-0 pb-5" id='box'>
						<div class="owl-carousel story-carousel position-relative"
							id='box'>
							<div class="owl-carousel-item position-relative" id='box'>
								<img class="img-fluid"
									src="<%=request.getContextPath()%>/resources/img/main커피1.png"
									alt="">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
									style="background: rgba(53, 53, 53, .7);">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-12 col-lg-8 text-center">
												<h5
													class="text-white text-uppercase mb-3 animated slideInDown">Welcome
													To WooDY</h5>
												<h1 class="display-6 text-white animated slideInDown mb-4">Best
													Carpenter & Craftsman Services</h1>
												<p class="fs-5 fw-medium text-white mb-4 pb-2">무엇을 넣을까?
												</p>
												<a href=""
													class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
													More</a> <a href=""
													class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
													Quote</a>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="owl-carousel-item position-relative ">
								<img class="img-fluid"
									src="<%=request.getContextPath()%>/resources/img/커피2.png"
									alt="">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
									style="background: rgba(53, 53, 53, .7);">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-12 col-lg-8 text-center">
												<h5
													class="text-white text-uppercase mb-3 animated slideInDown">Welcome
													To WooDY</h5>
												<h1 class="display-6 text-white animated slideInDown mb-4">카페
													추천1</h1>
												<p class="fs-5 fw-medium text-white mb-4 pb-2">Vero
													elitr justo clita lorem. Ipsum dolor at sed stet sit diam
													no. Kasd rebum ipsum et diam justo clita et kasd rebum sea
													elitr.</p>
												<a href=""
													class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
													More</a> <a href=""
													class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
													Quote</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-carousel-item position-relative">
								<img class="img-fluid"
									src="<%=request.getContextPath()%>/resources/img/커피3.png"
									alt="">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
									style="background: rgba(53, 53, 53, .7);">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-12 col-lg-8 text-center">
												<h5
													class="text-white text-uppercase mb-3 animated slideInDown">Welcome
													To WooDY</h5>
												<h1 class="display-6 text-white animated slideInDown mb-4">Best
													Carpenter & Craftsman Services</h1>
												<p class="fs-5 fw-medium text-white mb-4 pb-2">Vero
													elitr justo clita lorem. Ipsum dolor at sed stet sit diam
													no. Kasd rebum ipsum et diam justo clita et kasd rebum sea
													elitr.</p>
												<a href=""
													class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read
													More</a> <a href=""
													class="btn btn-light py-md-3 px-md-5 animated slideInRight">Free
													Quote</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Carousel End -->

				</div>
			</div>
		</div>
	</div>




	<!-- 중앙 END -->


	<!-- Go Trip start -->


	<!-- Favourite Places Start -->
	<div class="favourite-place place-padding ">
		<div class="container">
			<!-- Section Tittle -->
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title text-center">
						<h1 class="display-6 mb-5">인플루언서 STORY</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="0.6s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services1.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>50</span> </span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									<!-- $1870 -->
									<span>#제주공항근처카페 #감성카페 #디저트카페</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li>기본음료_아메리카노음료</li>
									<li>변경 가능_2천원 할인</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="0.7s">
					<div class="single-place mb-30 wow fadeInUp" data-wow-delay="0.10s">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services2.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="0.8s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services3.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="0.9s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services4.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="1.0s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services5.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 mb-3 wow fadeInUp"
					data-wow-delay="1.1s">
					<div class="single-place mb-30">
						<div class="place-img">
							<img
								src="<%=request.getContextPath()%>/resources/assets/img/service/services6.jpg"
								alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span>
								</span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Favourite Places End -->
	<!-- Go Trip end -->


	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/layout/footer.jsp"%>


	<!-- 검색 확장 -->
	<div class="offcanvas offcanvas-top" tabindex="-1" id="searchcanvasTop"
		aria-labelledby="offcanvasTopLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasTopLabel">카페를 검색하세요</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">

			<!-- 내용 -->
			<form action="">
				<div class="row mb-3">
					<div class="col"></div>

					<div class="col-md-6 ">
						<div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">

							<div class="input-group">
								<input type="search" placeholder="여기에 카페를 검색하세요"
									aria-describedby="button-addon1"
									class="form-control border-0 bg-light">
								<div class="input-group-append">
									<button id="button-addon1" type="submit"
										class="btn btn-link text-primary">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>

						</div>

					</div>
					<div class="col"></div>
				</div>

				<!-- 항목선택 -->
				<div class="container text-center">
					<div class="row">

						<div class="col-md-4 mb-3">
							<h5>테마검색</h5>
							<ul class="projects-tags">
								<button class="btn btn-outline-warning">전통</button>
								<button class="btn btn-outline-warning">레트로</button>
								<button class="btn btn-outline-warning">모던</button>
							</ul>
							
							<ul class="projects-tags">
								<button class="btn btn-outline-warning">네추럴</button>
								<button class="btn btn-outline-warning">개성</button>
								<button class="btn btn-outline-warning">창고형</button>
							</ul>
							
							<ul class="projects-tags">
								<button class="btn btn-outline-warning">이국적</button>
								<button class="btn btn-outline-warning">캐주얼</button>
								<button class="btn btn-outline-warning">아기자기</button>
							</ul>
							
						</div>
						<div class="col-md-4">
							<h5>키워드검색</h5>
							
							<ul class="projects-tags">
								<button class="btn btn-outline-warning">디저트</button>
								<button class="btn btn-outline-warning">브런치</button>
							</ul>
							
							<ul class="projects-tags">
								<button class="btn btn-outline-warning">이색적인음료</button>
								<button class="btn btn-outline-warning">핸드드립 전무</button>
								
							</ul>
							
							<ul class="projects-tags">
								<button class="btn btn-outline-warning">베이커리</button>
								<button class="btn btn-outline-warning">단체석</button>
							</ul>
							
							<ul class="projects-tags">
								<button class="btn btn-outline-warning">반려동물 가능</button>
								<button class="btn btn-outline-warning">야외 공간</button>
								
							</ul>
							
							<ul class="projects-tags">
								<button class="btn btn-outline-warning">독립 공간</button>
								<button class="btn btn-outline-warning">노키즈존</button>
							</ul>
						</div>
						<div class="col-md-4">
							<h5>구독권 해택이 있는 가맹점을 많이 이용해주세요</h5>
						</div>

					</div>

				</div>


			</form>

		</div>
	</div>

</body>

</html>