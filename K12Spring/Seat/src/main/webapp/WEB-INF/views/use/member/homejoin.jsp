<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="">

<link rel="apple-touch-icon" sizes="76x76" href="http://ijuju88.cdn3.cafe24.com/img/home.gif">
  <link rel="icon" type="image/png" href="resources/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    ijujutest
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
  <link href="resources/css/now-ui-kit.css?ver=3" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="resources/css/demo.css" rel="stylesheet" />
  
<link rel="stylesheet" href="resources/home.css">
<link href="resources/admin/plugins/datepicker/datepicker3.css"rel="stylesheet">


<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<!-- glide -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="resources/css/glide.core.min.css">
<link rel="stylesheet" href="resources/css/glide.theme.min.css">
<link rel="stylesheet" href="resources/s.css">

<script src="resources/js/jquery-3.2.1.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/popper.min.js" type="text/javascript"></script>
	
<!-- Bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>

</head>

<body>

	<jsp:include page="../home/hometitle.jsp"></jsp:include>
	
	<!-- 배경제목 -->
	<div class="page-header clear-filter" filter-color="orange">
		<div class="page-header-image" data-parallax="true"
			style="background-image: url(http://ijuju88.cdn3.cafe24.com/img/orchestra.jpg); transform: translate3d(0px, 0px, 0px);">
		</div>
		<div class="container">
			<div class="photo-container">
				<h3 class="title">회원가입</h3>
			</div>
		</div>
	</div>
	
	
	<div class="section section-pagination">
			<div class="container">
				<div class="row justify-content-center">
					<!-- Contact Form Area -->
					<div class="col-12 col-md-10 col-lg-9">
						<div class="contact-form">
							<jsp:include page="join.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
</div>
		
		<jsp:include page="../home/homefooter.jsp"></jsp:include>

</body>

</html>

