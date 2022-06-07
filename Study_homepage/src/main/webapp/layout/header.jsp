<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


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
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="z-index: 2000;">
		<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath}"> <img alt="Vue logo"
				src="resources/img/logo.png" style="height: 35px;" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>


			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto ">
					<li class="nav-item "><a class="nav-link active" href="${pageContext.request.contextPath}">홈
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/member/register.do">회원가입</a></li>
				</ul>

				<form class="d-flex">
					<input class="form-control me-2" type="text" placeholder="Search">
					<button class="btn btn-primary" type="button">Search</button>
				</form>
			</div>
		</div>
	</nav>
	
</body>
</html>