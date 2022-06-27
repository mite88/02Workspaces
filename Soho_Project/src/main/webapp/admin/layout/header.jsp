<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS files -->
<link href="<%=request.getContextPath()%>/admin/dist/css/tabler.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/dist/css/tabler-flags.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/dist/css/tabler-payments.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/dist/css/tabler-vendors.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/dist/css/demo.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/dist/css/tabler-icons.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/dist/css/style.css">


<!-- Libs JS -->
<script src="<%=request.getContextPath()%>/admin/dist/libs/apexcharts/dist/apexcharts.min.js" defer></script>
<script src="<%=request.getContextPath()%>/admin/dist/libs/jsvectormap/dist/js/jsvectormap.min.js" defer></script>
<script src="<%=request.getContextPath()%>/admin/dist/libs/jsvectormap/dist/maps/world.js" defer></script>
<script src="<%=request.getContextPath()%>/admin/dist/libs/jsvectormap/dist/maps/world-merc.js" defer></script>
<!-- Tabler Core -->
<script src="<%=request.getContextPath()%>/admin/dist/js/tabler.min.js" defer></script>
<script src="<%=request.getContextPath()%>/admin/dist/js/demo.min.js" defer></script>
<script  src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>

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
				<a href="<%=request.getContextPath()%>/admin.do"> <img src="<%=request.getContextPath()%>/user/resources/img/icons/icon-1.png" width="110"
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

				</div>
				
				<a href="<%=request.getContextPath()%>/admin.do/login" class="dropdown-item">Logout</a>
				
				
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
							<a class="nav-link" href="<%=request.getContextPath()%>/admin.do"> 
								<i class="ti ti-home"></i>
								<span class="nav-link-title"> 대시보드 </span>
							</a>
						</li>
						
						
							
						<!--  사용자관리 (확인수정삭제) -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#navbar1"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false" href="<%=request.getContextPath()%>/form-elements.html"> 
								<i class="ti ti-checkbox"></i>
								<span class="nav-link-title"> 사용자관리 </span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="<%=request.getContextPath()%>/admin.do/member/list"> 회원관리</a>
										<a class="dropdown-item" href="<%=request.getContextPath()%>/admin.do/office/list"> 제휴관리</a>  
									</div>
									
								</div>
							</div>
						</li>
						
						<!-- 예약관리 -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#navbar2"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false" href="<%=request.getContextPath()%>/form-elements.html"> 
								<i class="ti ti-checkbox"></i>
								<span class="nav-link-title"> 예약관리 </span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">	
										<a class="dropdown-item" href="<%=request.getContextPath()%>/admin.do/books/list"> 예약관리 </a> 
										
									</div>
									
								</div>
							</div>
						</li>
						
						<!-- 게시판관리-->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#navbar3"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false" href="<%=request.getContextPath()%>/form-elements.html"> 
								<i class="ti ti-checkbox"></i>
								<span class="nav-link-title"> 게시판관리 </span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="<%=request.getContextPath()%>/admin.do/contact/list/?type=all"> 게시판관리</a> 
									</div>
									
								</div>
							</div>
						</li>
						
						<!-- 기본설정-->
						<%-- <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#navbar4"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false" href="<%=request.getContextPath()%>/form-elements.html"> 
								<i class="ti ti-checkbox"></i>
								<span class="nav-link-title"> 기본설정 </span>
							</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="<%=request.getContextPath()%>/activity.html"> 팝업/베너관리</a> 
									</div>
									
								</div>
							</div>
						</li> --%>
						
					</ul>
					<!-- menu end -->
					
					
				</div>
			</div>
		</div>
	</div>
	<!-- menu end -->

</body>
</html>