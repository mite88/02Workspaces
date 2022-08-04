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

<!-- glide -->
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
			style="background-image: url(homeimgtitle.do?show_no=${ssplVO.show_no}&idx=1); transform: translate3d(0px, 0px, 0px);">
		</div>
		<div class="container">
			<div class="photo-container">
				<h3 class="title">공연정보</h3>
			</div>
		</div>
	</div>

	<!-- 내용 -->
	<div class="section section-pagination">
		<div class="container">
			<div class="row">
				<div class="col">
					<h2 class="title">${ssplVO.show_id_name}</h2>
					
					<div class="post-date">

						<p class="text-info" style="font-weight: bold">
							${fn:substring(ssplVO.show_startdate,5,7)}월&nbsp;${fn:substring(ssplVO.show_startdate,8,10)}일
							${fn:substring(ssplVO.show_startdate,10,16)} ~ 

						
							${fn:substring(ssplVO.show_enddate,5,7)}월&nbsp;${fn:substring(ssplVO.show_enddate,8,10)}일
							${fn:substring(ssplVO.show_enddate,10,16)}</p>

					</div>
					
					<h5 class="description">${fn:replace(ssplVO.show_content, newLineChar, "<br />")}</h5>
					
				
				</div>
			
			</div>
			
			<img src="homeimgtitle.do?show_no=${ssplVO.show_no}&idx=2" alt="" style="wi">
		</div>
	</div>


	<jsp:include page="../home/homefooter.jsp"></jsp:include>

</body>
</html>

