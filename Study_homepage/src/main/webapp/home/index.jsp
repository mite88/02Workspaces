<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
<script src="resources/jQuery/jquery-3.6.0.min.js"></script>

<link href="resources/bootstrap-5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="resources/bootstrap-5.1.3/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
#se2{
	width: 100vw;
    margin-left: calc(-50vw + 50%);
}
</style>
</head>
<body>

	<header>
		<jsp:include page="/layout/header.jsp" />
		<jsp:include page="carousel1.jsp" />
	</header>

	<div class="container">

		<!--  여기에 내용을 넣어봅시다 -->
		<section class="py-5" id="photo_gallery">

			<!-- For demo purpose -->
			<div class="row py-5">
				<div class="col-lg-12 mx-auto">
					<div class=" p-5 shadow-sm rounded banner">
						<h1 class="display-4">Bootstrap 4 photo gallery</h1>
						<p class="lead">Bootstrap photogallery snippet.</p>
						<p class="lead">
							Snippet by <a href="https://bootstrapious.com/snippets"
								class="text-reset"> Bootstrapious</a>, Images by <a
								href="https://unsplash.com" class="text-reset">Unsplash</a>.
						</p>
					</div>
				</div>
			</div>
			<!-- End -->

			<div class="row">
				<!-- Gallery item -->
				<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="bg-white rounded shadow-sm">
						<img
							src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
							alt="" class="img-fluid card-img-top">
						<div class="p-4">
							<h5>
								<a href="#" class="text-dark">Red paint cup</a>
							</h5>
							<p class="small text-muted mb-0">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</p>

						</div>
					</div>
				</div>
				<!-- End -->

				<!-- Gallery item -->
				<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="bg-white rounded shadow-sm">
						<img
							src="https://bootstrapious.com/i/snippets/sn-gallery/img-2.jpg"
							alt="" class="img-fluid card-img-top">
						<div class="p-4">
							<h5>
								<a href="#" class="text-dark">Blorange</a>
							</h5>
							<p class="small text-muted mb-0">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</p>

						</div>
					</div>
				</div>
				<!-- End -->

				<!-- Gallery item -->
				<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="bg-white rounded shadow-sm">
						<img
							src="https://bootstrapious.com/i/snippets/sn-gallery/img-3.jpg"
							alt="" class="img-fluid card-img-top">
						<div class="p-4">
							<h5>
								<a href="#" class="text-dark">And She Realized</a>
							</h5>
							<p class="small text-muted mb-0">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</p>

						</div>
					</div>
				</div>
				<!-- End -->

				<!-- Gallery item -->
				<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="bg-white rounded shadow-sm">
						<img
							src="https://bootstrapious.com/i/snippets/sn-gallery/img-4.jpg"
							alt="" class="img-fluid card-img-top">
						<div class="p-4">
							<h5>
								<a href="#" class="text-dark">DOSE Juice</a>
							</h5>
							<p class="small text-muted mb-0">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</p>

						</div>
					</div>
				</div>
				<!-- End -->

				<!-- Gallery item -->
				<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="bg-white rounded shadow-sm">
						<img
							src="https://bootstrapious.com/i/snippets/sn-gallery/img-5.jpg"
							alt="" class="img-fluid card-img-top">
						<div class="p-4">
							<h5>
								<a href="#" class="text-dark">Pineapple</a>
							</h5>
							<p class="small text-muted mb-0">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</p>

						</div>
					</div>
				</div>
				<!-- End -->

				<!-- Gallery item -->
				<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="bg-white rounded shadow-sm">
						<img
							src="https://bootstrapious.com/i/snippets/sn-gallery/img-6.jpg"
							alt="" class="img-fluid card-img-top">
						<div class="p-4">
							<h5>
								<a href="#" class="text-dark">Yellow banana</a>
							</h5>
							<p class="small text-muted mb-0">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</p>

						</div>
					</div>
				</div>
				<!-- End -->

				<!-- Gallery item -->
				<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="bg-white rounded shadow-sm">
						<img
							src="https://bootstrapious.com/i/snippets/sn-gallery/img-7.jpg"
							alt="" class="img-fluid card-img-top">
						<div class="p-4">
							<h5>
								<a href="#" class="text-dark">Teal Gameboy</a>
							</h5>
							<p class="small text-muted mb-0">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</p>

						</div>
					</div>
				</div>
				<!-- End -->

				<!-- Gallery item -->
				<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="bg-white rounded shadow-sm">
						<img
							src="https://bootstrapious.com/i/snippets/sn-gallery/img-8.jpg"
							alt="" class="img-fluid card-img-top">
						<div class="p-4">
							<h5>
								<a href="#" class="text-dark">Color in Guatemala.</a>
							</h5>
							<p class="small text-muted mb-0">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</p>

						</div>
					</div>
				</div>
				<!-- End -->

			</div>

			<div class="py-5 text-right">
				<a href="#" class="btn btn-dark px-5 py-3 text-uppercase">Show
					me more</a>
			</div>

		</section>

		
		<section class="bg-light py-5" id="se2">
			<div class="feature-work container my-4">
				<div class="row d-flex d-flex align-items-center">
					<div class="col-lg-5">
						<h3 class="feature-work-title h4 text-muted light-300">Featured
							Work</h3>
						<h1 class="feature-work-heading h2 py-3 semi-bold-600">Transform
							with us</h1>
						<p class="feature-work-body text-muted light-300">Lorem ipsum
							dolor sit amet, consectetur adipiscing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua. Quis ipsum
							suspendisse ultrices gravida. Risus commodo viverra maecenas
							accumsan lacus vel facilisis.</p>
						<p class="feature-work-footer text-muted light-300">Consectetur
							adipiscing elit, sed do eiusmod tempor incididunt ut labore et
							dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.
							Risus commodo viverra maecenas. Duis aute irure dolor in
							reprehenderit in voluptate velit esse cillum dolore eu fugiat
							nulla pariatur.</p>
					</div>
					
					<div class="col-lg-6 offset-lg-1 align-left">
						<div class="row">
							<a class="col" data-type="image" data-fslightbox="gallery"
								href="#"> <img
								class="img-fluid" src="resources/img/feature-work.jpg">
							</a> 
							
							<a class="col" data-type="image" data-fslightbox="gallery"
								href="#"> <img
								class="img-fluid" src="resources/img/feature-work.jpg">
							</a> 
						</div>
						<div class="row pt-4">
							<a class="col" data-type="image" data-fslightbox="gallery"
								href="#"> <img
								class="img-fluid" src="resources/img/feature-work.jpg">
							</a> 
							
							<a class="col" data-type="image" data-fslightbox="gallery"
								href="#"> <img
								class="img-fluid" src="resources/img/feature-work.jpg">
							</a> 
						</div>
					</div>
				</div>
			</div>
		</section>



	</div>


	<jsp:include page="/layout/footer.jsp" />

</body>
</html>