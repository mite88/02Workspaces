<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link rel='stylesheet'
	href='https://cdn.rawgit.com/jedrzejchalubek/glidejs/8eabfbb9/dist/css/glide.core.min.css'> 
<link rel='stylesheet'
	href='https://cdn.rawgit.com/jedrzejchalubek/glidejs/8eabfbb9/dist/css/glide.theme.min.css'>

<link rel="stylesheet" href="resources/s.css">

<style type="text/css">
.thumb-post img {
	object-fit: none; /* Do not scale the image */
	object-position: center; /* Center the image within the element */
	width /***/: 100%; /* only IE8 */
	height: auto;
	vertical-align: bottom;
	max-height: 50vh;
	margin-bottom: 1rem;
	background-size: cover;
}
</style>
</head>

<body>


	<div class="glide" id="Glide">
		<div class="glide__wrapper">
			<ul class="glide__track">
				<c:forEach var="list" items="${ssplList}" varStatus="status">
					<li class="glide__slide">
						<div class="box" style="background-color: #a6a6a6;">


							<div class="thumb-post">
								<img src="homeimgtitle.do?show_no=${list.show_no}&idx=1"
									onload="resize(this)" />
							</div>

							<div class="card__content card__padding"
								style="position: relative; z-index: 2;">
								<div class="card__share">
									<div class="card__social">
										<a class="share-icon facebook intro"
											href="homeseatintro.do?show_no=${list.show_no}">자세히</a>
										<button class="share-icon twitter seatshow"
											id="${list.show_no}">예약</button>
									</div>

									<a id="share" class="share-toggle share-icon order-first"
										href="#"></a>
								</div>

								<div class="card__meta">
									${list.show_id_name} <a href="#"><time>${list.show_title}</time></a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${fn:substring(list.show_startdate,0,16)}
									~${fn:substring(list.show_enddate,0,16)}
								</div>

							</div>
						</div>

					</li>
				</c:forEach>
			</ul>
		</div>
		<ul class="glide__bullets"></ul>
	</div>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script
		src='https://cdn.rawgit.com/jedrzejchalubek/glidejs/8eabfbb9/dist/glide.min.js'></script>


	<script src="resources/js_jsp/homeside.js"></script>
</body>
</html>