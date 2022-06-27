<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
/*carousel 높이조절*/
.carousel-item {
	min-height: 350px;
	max-height: 500px;
}

#carouselExampleDark, .carousel-inner, .carousel-item, .carousel-item.active
	{
	
}

.carousel-item {
	background-image: url(resources/img/c.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

/* Height for devices larger than 576px */
@media ( min-width : 992px) {
	#carouselExampleDark, .carousel-inner, .carousel-item, .carousel-item.active
		{
		height: 50vh;
	}
}

.mask {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
	background-attachment: fixed;
}
</style>


<!-- Carousel wrapper -->
<div id="carouselExampleDark" class="carousel slide carousel-fade shadow-2-strong" data-mdb-ride="carousel">
	<!-- Indicators -->
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleDark"
			data-bs-slide-to="0" class="active" aria-current="true"
			aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleDark"
			data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleDark"
			data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>

	<!-- Inner -->
	<div class="carousel-inner">
		<!-- Single item -->
		<div class="carousel-item active">
			<div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-white text-center">
						<h1 class="mb-3">Learn Bootstrap 5 with MDB</h1>
						<h5 class="mb-4">Best & free guide of responsive web design</h5>
						<a class="btn btn-outline-light btn-lg m-2"
							href="https://www.youtube.com/watch?v=c9B4TPnak1A" role="button"
							rel="nofollow" target="_blank">Start tutorial</a> <a
							class="btn btn-outline-light btn-lg m-2"
							href="https://mdbootstrap.com/docs/standard/" target="_blank"
							role="button">Download MDB UI KIT</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Single item -->
		<div class="carousel-item">
			<div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-white text-center">
						<h2>You can place here any content</h2>
					</div>
				</div>
			</div>
		</div>

		<!-- Single item -->
		<div class="carousel-item">
			<div class="mask"
				style="background: linear-gradient(45deg, rgba(29, 236, 197, 0.7), rgba(91, 14, 214, 0.7) 100%);">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-white text-center">
						<h2>And cover it with any mask</h2>
						<a class="btn btn-outline-light btn-lg m-2"
							href="https://mdbootstrap.com/docs/standard/content-styles/masks/"
							target="_blank" role="button">Learn about masks</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Inner -->

	<!-- Controls -->
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleDark" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>

</div>
<!-- Carousel wrapper -->