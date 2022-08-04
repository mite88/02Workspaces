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

<body>

	<jsp:include page="use/home/hometitle.jsp"></jsp:include>

	<div class="page-header clear-filter" filter-color="orange">
		<div class="page-header-image" data-parallax="true"
			style="background-image: url(http://ijuju88.cdn3.cafe24.com/img/orchestra.jpg); transform: translate3d(0px, 0px, 0px);">
		</div>
		<div class="container">
			<div class="photo-container">
				<h3 class="title">About</h3>
			</div>
		</div>
	</div>


	<div class="section">
		<div class="container">

			<h3 class="title">About me</h3>
			<h5 class="description">An artist of considerable range, Ryan —
				the name taken by Melbourne-raised, Brooklyn-based Nick Murphy —
				writes, performs and records all of his own music, giving it a warm,
				intimate feel with a solid groove structure. An artist of
				considerable range.</h5><br/>
				
			<h5 class="description">An artist of considerable range, Ryan —
				the name taken by Melbourne-raised, Brooklyn-based Nick Murphy —
				writes, performs and records all of his own music, giving it a warm,
				intimate feel with a solid groove structure. An artist of
				considerable range.</h5>
				

			<div class="row">
				
				<div class="section section-tabs">
					<div class="container">
						<div class="row">
							<div class="col-md-10 ml-auto col-xl-6 mr-auto">
								<p class="category">Tabs with Icons on Card</p>
								<!-- Nav tabs -->
								<div class="card">
									<div class="card-header">
										<ul class="nav nav-tabs justify-content-center" role="tablist">
											<li class="nav-item"><a class="nav-link active"
												data-toggle="tab" href="#home" role="tab"> <i
													class="fas fa-align-justify"></i> Home
											</a></li>
											<li class="nav-item"><a class="nav-link"
												data-toggle="tab" href="#profile" role="tab"> <i
													class="fas fa-align-justify"></i> Profile
											</a></li>
											<li class="nav-item"><a class="nav-link"
												data-toggle="tab" href="#messages" role="tab"> <i
													class="fas fa-align-justify"></i> Messages
											</a></li>
											<li class="nav-item"><a class="nav-link"
												data-toggle="tab" href="#settings" role="tab"> <i
													class="fas fa-align-justify"></i> Settings
											</a></li>
										</ul>
									</div>
									<div class="card-body">
										<!-- Tab panes -->
										<div class="tab-content text-center">
											<div class="tab-pane active" id="home" role="tabpanel">
												<p>I think that’s a responsibility that I have, to push
													possibilities, to show people, this is the level that
													things could be at. So when you get something that has the
													name Kanye West on it, it’s supposed to be pushing the
													furthest possibilities. I will be the leader of a company
													that ends up being worth billions of dollars, because I got
													the answers. I understand culture. I am the nucleus.</p>
											</div>
											<div class="tab-pane" id="profile" role="tabpanel">
												<p>I will be the leader of a company that ends up being
													worth billions of dollars, because I got the answers. I
													understand culture. I am the nucleus. I think that’s a
													responsibility that I have, to push possibilities, to show
													people, this is the level that things could be at. I think
													that’s a responsibility that I have, to push possibilities,
													to show people, this is the level that things could be at.
												</p>
											</div>
											<div class="tab-pane" id="messages" role="tabpanel">
												<p>I think that’s a responsibility that I have, to push
													possibilities, to show people, this is the level that
													things could be at. So when you get something that has the
													name Kanye West on it, it’s supposed to be pushing the
													furthest possibilities. I will be the leader of a company
													that ends up being worth billions of dollars, because I got
													the answers. I understand culture. I am the nucleus.</p>
											</div>
											<div class="tab-pane" id="settings" role="tabpanel">
												<p>"I will be the leader of a company that ends up being
													worth billions of dollars, because I got the answers. I
													understand culture. I am the nucleus. I think that’s a
													responsibility that I have, to push possibilities, to show
													people, this is the level that things could be at."</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-10 ml-auto col-xl-6 mr-auto">
								<p class="category">위치</p>

								<!-- Tabs with Background on Card -->

								<div id="map" style="width: 450px; height: 400px;"></div>
								<!--카카오지도-->
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd676cffe7540606620914f1d7b7726c"></script>
								<!--services와 clusterer, drawing 라이브러리 불러오기-->
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd676cffe7540606620914f1d7b7726c
						&libraries=services,clusterer,drawing"></script>
								<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new daum.maps.LatLng(33.450701,
										126.570667), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							var map = new daum.maps.Map(mapContainer, mapOption);

							// 마커가 표시될 위치입니다 
							var markerPosition = new daum.maps.LatLng(
									33.450701, 126.570667);

							// 마커를 생성합니다
							var marker = new daum.maps.Marker({
								position : markerPosition
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
							var iwContent = '<div class="card text-white bg-secondary" style=width:220px;"><div class="card-header">'
									+ ' <img class="card-img-top" src="http://ijuju88.cdn3.cafe24.com/img/home.png" alt="Card image" style="width:70%">'
									+ '</div> <div class="card-body">'
									+ ' <h5 class="card-title">0000공연장</h5>'
									+ ' <p class="card-text">공연장 표시 샘플입니다.</p><hr/>'
									+ '<a href="home.do" class="btn btn-outline-light btn-sm" s>See Profile</a>'
									+ '</div></div>';
							iwPosition = new daum.maps.LatLng(33.450701,
									126.570667); //인포윈도우 표시 위치입니다

							// 인포윈도우를 생성합니다
							var infowindow = new daum.maps.InfoWindow({
								position : iwPosition,
								content : iwContent
							});

							// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
							infowindow.open(map, marker);
						</script>

							</div>
							<!-- End Tabs on plain Card -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="use/home/homefooter.jsp"></jsp:include>

</body>
</html>