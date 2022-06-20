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
	<header class="navbar navbar-expand-md navbar-light d-print-none">
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
						<!-- <div
							class="dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Last updates</h3>
								</div>
								<div class="list-group list-group-flush list-group-hoverable">
									<div class="list-group-item">
										<div class="row align-items-center">
											<div class="col-auto">
												<span class="status-dot status-dot-animated bg-red d-block"></span>
											</div>
											<div class="col text-truncate">
												<a href="#" class="text-body d-block">Example 1</a>
												<div class="d-block text-muted text-truncate mt-n1">
													Change deprecated html tags to text decoration classes
													(#29604)</div>
											</div>
											<div class="col-auto">
												<a href="#" class="list-group-item-actions"> Download SVG icon from http://tabler-icons.io/i/star
													<svg xmlns="http://www.w3.org/2000/svg"
														class="icon text-muted" width="24" height="24"
														viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
														fill="none" stroke-linecap="round" stroke-linejoin="round">
														<path stroke="none" d="M0 0h24v24H0z" fill="none" />
														<path
															d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" /></svg>
												</a>
											</div>
										</div>
									</div>
									<div class="list-group-item">
										<div class="row align-items-center">
											<div class="col-auto">
												<span class="status-dot d-block"></span>
											</div>
											<div class="col text-truncate">
												<a href="#" class="text-body d-block">Example 2</a>
												<div class="d-block text-muted text-truncate mt-n1">
													justify-content:between â justify-content:space-between
													(#29734)</div>
											</div>
											<div class="col-auto">
												<a href="#" class="list-group-item-actions show"> Download SVG icon from http://tabler-icons.io/i/star
													<svg xmlns="http://www.w3.org/2000/svg"
														class="icon text-yellow" width="24" height="24"
														viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
														fill="none" stroke-linecap="round" stroke-linejoin="round">
														<path stroke="none" d="M0 0h24v24H0z" fill="none" />
														<path
															d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" /></svg>
												</a>
											</div>
										</div>
									</div>
									<div class="list-group-item">
										<div class="row align-items-center">
											<div class="col-auto">
												<span class="status-dot d-block"></span>
											</div>
											<div class="col text-truncate">
												<a href="#" class="text-body d-block">Example 3</a>
												<div class="d-block text-muted text-truncate mt-n1">
													Update change-version.js (#29736)</div>
											</div>
											<div class="col-auto">
												<a href="#" class="list-group-item-actions"> Download SVG icon from http://tabler-icons.io/i/star
													<svg xmlns="http://www.w3.org/2000/svg"
														class="icon text-muted" width="24" height="24"
														viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
														fill="none" stroke-linecap="round" stroke-linejoin="round">
														<path stroke="none" d="M0 0h24v24H0z" fill="none" />
														<path
															d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" /></svg>
												</a>
											</div>
										</div>
									</div>
									<div class="list-group-item">
										<div class="row align-items-center">
											<div class="col-auto">
												<span
													class="status-dot status-dot-animated bg-green d-block"></span>
											</div>
											<div class="col text-truncate">
												<a href="#" class="text-body d-block">Example 4</a>
												<div class="d-block text-muted text-truncate mt-n1">
													Regenerate package-lock.json (#29730)</div>
											</div>
											<div class="col-auto">
												<a href="#" class="list-group-item-actions"> Download SVG icon from http://tabler-icons.io/i/star
													<svg xmlns="http://www.w3.org/2000/svg"
														class="icon text-muted" width="24" height="24"
														viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
														fill="none" stroke-linecap="round" stroke-linejoin="round">
														<path stroke="none" d="M0 0h24v24H0z" fill="none" />
														<path
															d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" /></svg>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> -->
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
	<div class="navbar-expand-md">
		<div class="collapse navbar-collapse" id="navbar-menu">
			<div class="navbar navbar-light">
				<div class="container-xl">
					<ul class="navbar-nav">
						<!-- home -->
						<li class="nav-item active">
							<a class="nav-link" href="./index.html"> 
								<i class="ti ti-home"></i>
								<span class="nav-link-title"> Home </span>
							</a>
						</li>
						
						<!-- 사이트설정 -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#navbar-base"
								data-bs-toggle="dropdown" data-bs-auto-close="outside"
								role="button" aria-expanded="false"> 
								<i class="ti ti-package"></i>
								 <span class="nav-link-title"> 사이트설정 </span>
							</a>
							
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./empty.html"> Empty page </a>
										<a class="dropdown-item" href="./accordion.html">
											Accordion </a> <a class="dropdown-item" href="./blank.html">
											Blank page </a> <a class="dropdown-item" href="./buttons.html">
											Buttons </a>
										<div class="dropend">
											<a class="dropdown-item dropdown-toggle"
												href="#sidebar-cards" data-bs-toggle="dropdown"
												data-bs-auto-close="outside" role="button"
												aria-expanded="false"> Cards <span
												class="badge badge-sm bg-green text-uppercase ms-2">New</span>
											</a>
											<div class="dropdown-menu">
												<a href="./cards.html" class="dropdown-item"> Sample
													cards </a> <a href="./card-actions.html" class="dropdown-item">
													Card actions <span
													class="badge badge-sm bg-green text-uppercase ms-2">New</span>
												</a> <a href="./cards-masonry.html" class="dropdown-item">
													Cards Masonry </a>
											</div>
										</div>
										<a class="dropdown-item" href="./colors.html"> Colors </a> <a
											class="dropdown-item" href="./datatables.html">
											Datatables <span
											class="badge badge-sm bg-green text-uppercase ms-2">New</span>
										</a> <a class="dropdown-item" href="./dropdowns.html">
											Dropdowns </a> <a class="dropdown-item" href="./modals.html">
											Modals </a> <a class="dropdown-item" href="./maps.html"> Maps
										</a> <a class="dropdown-item" href="./map-fullsize.html"> Map
											fullsize </a> <a class="dropdown-item" href="./maps-vector.html">
											Vector maps <span
											class="badge badge-sm bg-green text-uppercase ms-2">New</span>
										</a> <a class="dropdown-item" href="./navigation.html">
											Navigation </a>
									</div>
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./charts.html"> Charts </a> <a
											class="dropdown-item" href="./pagination.html"> <!-- Download SVG icon from http://tabler-icons.io/i/pie-chart -->
											Pagination
										</a> <a class="dropdown-item" href="./placeholder.html">
											Placeholder </a> <a class="dropdown-item" href="./tabs.html">
											Tabs </a> <a class="dropdown-item" href="./tables.html">
											Tables </a> <a class="dropdown-item" href="./carousel.html">
											Carousel <span
											class="badge badge-sm bg-green text-uppercase ms-2">New</span>
										</a> <a class="dropdown-item" href="./lists.html"> Lists </a> <a
											class="dropdown-item" href="./typography.html">
											Typography </a> <a class="dropdown-item" href="./offcanvas.html">
											Offcanvas </a> <a class="dropdown-item" href="./markdown.html">
											Markdown </a>
										<div class="dropend">
											<a class="dropdown-item dropdown-toggle"
												href="#sidebar-authentication" data-bs-toggle="dropdown"
												data-bs-auto-close="outside" role="button"
												aria-expanded="false"> Authentication </a>
											<div class="dropdown-menu">
												<a href="./sign-in.html" class="dropdown-item"> Sign in
												</a> <a href="./sign-up.html" class="dropdown-item"> Sign up
												</a> <a href="./forgot-password.html" class="dropdown-item">
													Forgot password </a> <a href="./terms-of-service.html"
													class="dropdown-item"> Terms of service </a> <a
													href="./auth-lock.html" class="dropdown-item"> Lock
													screen </a>
											</div>
										</div>
										<div class="dropend">
											<a class="dropdown-item dropdown-toggle"
												href="#sidebar-error" data-bs-toggle="dropdown"
												data-bs-auto-close="outside" role="button"
												aria-expanded="false"> <!-- Download SVG icon from http://tabler-icons.io/i/file-minus -->
												<svg xmlns="http://www.w3.org/2000/svg"
													class="icon icon-inline me-1" width="24" height="24"
													viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
													fill="none" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none" />
													<path d="M14 3v4a1 1 0 0 0 1 1h4" />
													<path
														d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
													<line x1="9" y1="14" x2="15" y2="14" /></svg> Error pages
											</a>
											<div class="dropdown-menu">
												<a href="./error-404.html" class="dropdown-item"> 404
													page </a> <a href="./error-500.html" class="dropdown-item">
													500 page </a> <a href="./error-maintenance.html"
													class="dropdown-item"> Maintenance page </a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
							
						<!-- 회원관리(확인수정삭제) -->
						<li class="nav-item">
							<a class="nav-link" href="./form-elements.html"> 
							<i class="ti ti-checkbox"></i
							><span class="nav-link-title"> 회원관리 </span>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#navbar-extra"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false"> 
							<span class="nav-link-icon d-md-none d-lg-inline-block">
									<!-- Download SVG icon from http://tabler-icons.io/i/star --> <svg
										xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<path
											d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z" /></svg>
							</span> <span class="nav-link-title"> Extra </span>
						</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./activity.html"> Activity
										</a> <a class="dropdown-item" href="./gallery.html"> Gallery </a>
										<a class="dropdown-item" href="./invoice.html"> Invoice </a> <a
											class="dropdown-item" href="./search-results.html">
											Search results </a> <a class="dropdown-item"
											href="./pricing.html"> Pricing cards </a> <a
											class="dropdown-item" href="./faq.html"> FAQ <span
											class="badge badge-sm bg-green text-uppercase ms-2">New</span>
										</a> <a class="dropdown-item" href="./users.html"> Users </a>
									</div>
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./license.html"> License </a> <a
											class="dropdown-item" href="./music.html"> Music </a> <a
											class="dropdown-item" href="./tasks.html"> Tasks <span
											class="badge badge-sm bg-green text-uppercase ms-2">New</span>
										</a> <a class="dropdown-item" href="./uptime.html"> Uptime
											monitor </a> <a class="dropdown-item" href="./widgets.html">
											Widgets </a> <a class="dropdown-item" href="./wizard.html">
											Wizard </a>
									</div>
								</div>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#navbar-layout"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false"> <span
								class="nav-link-icon d-md-none d-lg-inline-block">
									<!-- Download SVG icon from http://tabler-icons.io/i/layout-2 -->
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<rect x="4" y="4" width="6" height="5" rx="2" />
										<rect x="4" y="13" width="6" height="7" rx="2" />
										<rect x="14" y="4" width="6" height="7" rx="2" />
										<rect x="14" y="15" width="6" height="5" rx="2" /></svg>
							</span> <span class="nav-link-title"> Layout </span>
						</a>
							<div class="dropdown-menu">
								<div class="dropdown-menu-columns">
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./layout-horizontal.html">
											Horizontal </a> <a class="dropdown-item"
											href="./layout-boxed.html"> Boxed <span
											class="badge badge-sm bg-green text-uppercase ms-2">New</span>
										</a> <a class="dropdown-item" href="./layout-vertical.html">
											Vertical </a> <a class="dropdown-item"
											href="./layout-vertical-transparent.html"> Vertical
											transparent </a> <a class="dropdown-item"
											href="./layout-vertical-right.html"> Right vertical </a> <a
											class="dropdown-item" href="./layout-condensed.html">
											Condensed </a> <a class="dropdown-item"
											href="./layout-combo.html"> Combined </a>
									</div>
									<div class="dropdown-menu-column">
										<a class="dropdown-item" href="./layout-navbar-dark.html">
											Navbar dark </a> <a class="dropdown-item"
											href="./layout-navbar-sticky.html"> Navbar sticky </a> <a
											class="dropdown-item" href="./layout-navbar-overlap.html">
											Navbar overlap </a> <a class="dropdown-item"
											href="./layout-rtl.html"> RTL mode </a> <a
											class="dropdown-item" href="./layout-fluid.html"> Fluid </a>
										<a class="dropdown-item" href="./layout-fluid-vertical.html">
											Fluid vertical </a>
									</div>
								</div>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="./icons.html">
								<span class="nav-link-icon d-md-none d-lg-inline-block">
									<!-- Download SVG icon from http://tabler-icons.io/i/ghost -->
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<path
											d="M5 11a7 7 0 0 1 14 0v7a1.78 1.78 0 0 1 -3.1 1.4a1.65 1.65 0 0 0 -2.6 0a1.65 1.65 0 0 1 -2.6 0a1.65 1.65 0 0 0 -2.6 0a1.78 1.78 0 0 1 -3.1 -1.4v-7" />
										<line x1="10" y1="10" x2="10.01" y2="10" />
										<line x1="14" y1="10" x2="14.01" y2="10" />
										<path d="M10 14a3.5 3.5 0 0 0 4 0" /></svg>
							</span> <span class="nav-link-title"> 1960 icons </span>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#navbar-help"
							data-bs-toggle="dropdown" data-bs-auto-close="outside"
							role="button" aria-expanded="false"> <span
								class="nav-link-icon d-md-none d-lg-inline-block">
									<!-- Download SVG icon from http://tabler-icons.io/i/lifebuoy -->
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<circle cx="12" cy="12" r="4" />
										<circle cx="12" cy="12" r="9" />
										<line x1="15" y1="15" x2="18.35" y2="18.35" />
										<line x1="9" y1="15" x2="5.65" y2="18.35" />
										<line x1="5.65" y1="5.65" x2="9" y2="9" />
										<line x1="18.35" y1="5.65" x2="15" y2="9" /></svg>
							</span> <span class="nav-link-title"> Help </span>
						</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="./docs/index.html">
									Documentation </a> <a class="dropdown-item" href="./changelog.html">
									Changelog </a> <a class="dropdown-item"
									href="https://github.com/tabler/tabler" target="_blank"
									rel="noopener"> Source code </a> <a
									class="dropdown-item text-pink"
									href="https://github.com/sponsors/codecalm" target="_blank"
									rel="noopener"> <!-- Download SVG icon from http://tabler-icons.io/i/heart -->
									<svg xmlns="http://www.w3.org/2000/svg"
										class="icon icon-inline me-1" width="24" height="24"
										viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
										fill="none" stroke-linecap="round" stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<path
											d="M19.5 13.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" /></svg>
									Sponsor project!
								</a>
							</div></li>
					</ul>
					<div
						class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">
						<form action="." method="get">
							<div class="input-icon">
								<span class="input-icon-addon"> <!-- Download SVG icon from http://tabler-icons.io/i/search -->
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<circle cx="10" cy="10" r="7" />
										<line x1="21" y1="21" x2="15" y2="15" /></svg>
								</span> <input type="text" value="" class="form-control"
									placeholder="Searchâ¦" aria-label="Search in website">
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