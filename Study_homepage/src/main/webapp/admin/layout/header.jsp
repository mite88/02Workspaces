<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS files -->
<link href="./dist/css/tabler.min.css" rel="stylesheet" />
<link href="./dist/css/tabler-flags.min.css" rel="stylesheet" />
<link href="./dist/css/tabler-payments.min.css" rel="stylesheet" />
<link href="./dist/css/tabler-vendors.min.css" rel="stylesheet" />
<link href="./dist/css/demo.min.css" rel="stylesheet" />
<link rel="stylesheet" href="./dist/css/tabler-icons.min.css">

<link rel="stylesheet" href="./dist/css/style.css">

<style type="text/css">
nav .navbar-nav a.nav-link {
	font-weight: bold;
	color: #2c3e50 !important;
}

nav .navbar-nav  a.nav-link.active {
	color: #42b983 !important;
}
</style>
</head>
<body>

	<!-- Navigation -->
	<header class="navbar navbar-expand-md navbar-light d-print-none" >
		<div class="container-xl">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbar-menu">
				<span class="navbar-toggler-icon"></span>
			</button>
			<h1
				class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
				<a href="."> <img src="./static/logo.svg" width="110"
					height="32" alt="Tabler" class="navbar-brand-image">
				</a>
			</h1>
			<div class="navbar-nav flex-row order-md-last">

				<div class="d-none d-md-flex">
					<!-- 다크모드 / 일반모드 변경 -->
					<a href="?theme=dark" class="nav-link px-0 hide-theme-dark"
						title="Enable dark mode" data-bs-toggle="tooltip"
						data-bs-placement="bottom">
						<i class="ti ti-moon icon-demo-size-1_5"></i>
					</a> 
					<a href="?theme=light" class="nav-link px-0 hide-theme-light"
						title="Enable light mode" data-bs-toggle="tooltip"
						data-bs-placement="bottom"> 
						<i class="ti ti-sun icon-demo-size-1_5"></i>
					</a>

					<!-- 알림 -->
					<div class="nav-item dropdown d-none d-md-flex me-3">
						<a href="#" class="nav-link px-0" data-bs-toggle="dropdown"
							tabindex="-1" aria-label="Show notifications"> 
							<i class="ti ti-bell icon-demo-size-1_5" ></i>
							<span class="badge bg-red"></span>
						</a>
						
					</div>
				</div>
				
				<div class="nav-item dropdown">
					<a href="#" class="nav-link d-flex lh-1 text-reset p-0"
						data-bs-toggle="dropdown" aria-label="Open user menu"> <span
						class="avatar avatar-sm"
						style="background-image: url(//placeimg.com/48/48/any)"></span>
						<div class="d-none d-xl-block ps-2">
							<div>admin</div>
							<div class="mt-1 small text-muted">UI Designer</div>
						</div>
					</a>
					<div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
						<a href="#" class="dropdown-item">Set status</a> <a href="#"
							class="dropdown-item">Profile & account</a> <a href="#"
							class="dropdown-item">Feedback</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">Settings</a> <a href="#"
							class="dropdown-item">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header end -->

	<!-- menu -->
	<div class="navbar-expand-md" >
		<div class="collapse navbar-collapse" id="navbar-menu">
			<div class="navbar navbar-dark d-print-none" style="background: #7952b3">
				<div class="container-xl">
					<!-- menu start -->
					<ul class="navbar-nav">
						<!-- home -->
						<li class="nav-item active">
							<a class="nav-link" href="./index.html"> 
								<i class="ti ti-home"></i>
								<span class="nav-link-title"> 대시보드 </span>
							</a>
						</li>
						
						
							
						<!--  사용자관리 (확인수정삭제) -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#navbar1"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false" href="./form-elements.html"> 
								<i class="ti ti-checkbox"></i>
								<span class="nav-link-title"> 사용자관리 </span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./activity.html"> 회원관리</a> 
										<a class="dropdown-item" href="./activity.html"> 메일 발송 설정</a> 
									</div>
									
								</div>
							</div>
						</li>
						
						<!-- 예약관리 -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#navbar2"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false" href="./form-elements.html"> 
								<i class="ti ti-checkbox"></i>
								<span class="nav-link-title"> 예약관리 </span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
									
										<a class="dropdown-item" href="./activity.html"> 사무실관리 </a> 
										<a class="dropdown-item" href="./activity.html"> 예약캘린더 </a> 
										
									</div>
									
								</div>
							</div>
						</li>
						
						<!-- 게시판관리-->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#navbar3"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false" href="./form-elements.html"> 
								<i class="ti ti-checkbox"></i>
								<span class="nav-link-title"> 게시판관리 </span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./activity.html"> 게시판관리</a> 
										<a class="dropdown-item" href="./activity.html"> 게시물관리</a> 
									</div>
									
								</div>
							</div>
						</li>
						
						<!-- 기본설정-->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#navbar4"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false" href="./form-elements.html"> 
								<i class="ti ti-checkbox"></i>
								<span class="nav-link-title"> 기본설정 </span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./activity.html"> 기본관리</a> 
										<a class="dropdown-item" href="./activity.html"> 팝업/베너관리</a> 
										<a class="dropdown-item" href="./activity.html"> 기본관리</a> 
									</div>
									
								</div>
							</div>
						</li>
						
					</ul>
					<!-- menu end -->
					
					<!-- 검색 -->
					<div class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">
						<form action="." method="get">
							<div class="input-icon">
								<span class="input-icon-addon"> 
								<!-- Download SVG icon from http://tabler-icons.io/i/search -->
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<circle cx="10" cy="10" r="7" />
										<line x1="21" y1="21" x2="15" y2="15" /></svg>
								</span> 
								<input type="text" value="" class="form-control" placeholder="검색" aria-label="Search in website">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- menu end -->

</body>
</html>