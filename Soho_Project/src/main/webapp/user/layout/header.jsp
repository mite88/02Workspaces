<%--
/**
 * 1. 프로젝트명 : header.jsp
 * 2. 작성일 : 2022. 6. 21. 오후 12:54:17
 * 3. 작성자 : mite88
 * 4. 설명 : header
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 21.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon -->

<!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600&family=Teko:wght@400;500;600&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<%=request.getContextPath()%>/user/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/user/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/user/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<%=request.getContextPath()%>/user/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<%=request.getContextPath()%>/user/resources/css/style.css" rel="stylesheet">
    
    
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/user/resources/lib/wow/wow.min.js"></script>
	<script src="<%=request.getContextPath()%>/user/resources/lib/easing/easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/user/resources/lib/waypoints/waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/user/resources/lib/counterup/counterup.min.js"></script>
	<script src="<%=request.getContextPath()%>/user/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/user/resources/lib/tempusdominus/js/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/user/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="<%=request.getContextPath()%>/user/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
	
	<!-- Template Javascript -->
	<script src="<%=request.getContextPath()%>/user/resources/js/main.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment-with-locales.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/locale/ko.min.js"></script>
</head>
<body>
	<!-- session정보 -->
	<input type="hidden" name="user_id" id="user_id" value="${USER_ID}" />
	<input type="hidden" name="user_name" id="user_name" value="${USER_NAME}" />
<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border position-relative text-primary" style="width: 6rem; height: 6rem;" role="status"></div>
        <img class="position-absolute top-50 start-50 translate-middle" src="<%=request.getContextPath()%>/user/resources/img/icons/icon-1.png" alt="Icon">
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-dark p-0 wow fadeIn" data-wow-delay="0.1s">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center py-3 me-3">
                    <a class="text-body px-2" href="tel:+0123456789"><i class="fa fa-phone-alt text-primary me-2"></i>+012 345 6789</a>
                    <a class="text-body px-2" href="mailto:info@example.com"><i class="fa fa-envelope-open text-primary me-2"></i>info@example.com</a>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <!--  
                <div class="h-100 d-inline-flex align-items-center py-3 me-2">
                    <a class="text-body px-2" href="">Terms</a>
                    <a class="text-body px-2" href="">Privacy</a>
                </div>
                -->
                <div class="h-100 d-inline-flex align-items-center">
                    <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-sm-square btn-outline-body me-0" href=""><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-xl bg-white navbar-light sticky-top py-xl-0 px-xl-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="<%=request.getContextPath()%>/" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="text-primary m-0"><img class="me-3" src="<%=request.getContextPath()%>/user/resources/img/icons/icon-1.png" alt="Icon">Soho Office</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0" style="align-items: center;">
            
            	<a href="<%=request.getContextPath()%>" class="nav-item nav-link active" >home</a>
            
            	<!-- about -->
            	<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">About</a>
                    <div class="dropdown-menu border-0 m-0">
                        <a href="<%=request.getContextPath()%>/about.do/ceo" class="dropdown-item">인사말</a>
                        <a href="<%=request.getContextPath()%>/about.do/about" class="dropdown-item">소개</a>
                        <a href="<%=request.getContextPath()%>/about.do/term" class="dropdown-item">팀원</a>
                        <a href="<%=request.getContextPath()%>/about.do/location" class="dropdown-item">지점찾기</a>
                    </div>
                </div>
                
                <!-- 사무실 홍보용 페이지 -->
                <a href="<%=request.getContextPath()%>/office.do/office" class="nav-item nav-link">사무실</a>
                
                <!-- 예약페이지 -->
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Books</a>
                    <div class="dropdown-menu border-0 m-0">
                        <a href="<%=request.getContextPath()%>/books.do/books" class="dropdown-item">예약하기</a>
                        <c:choose>
							<c:when test="${not empty USER_ID}">
								 <a href="<%=request.getContextPath()%>/books.do/confirm" class="dropdown-item">예약확인</a>
							</c:when>
						
						</c:choose>
                       
                    </div>
                </div>
               
                
                <!-- 고객센터 -->
                <div class="nav-item dropdown">
                    <a href="/contact.do" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Contact</a>
                    <div class="dropdown-menu border-0 m-0">
                        <a href="<%=request.getContextPath()%>/contact.do/list/1" class="dropdown-item">공지</a>
                        <a href="<%=request.getContextPath()%>/contact.do/list/2" class="dropdown-item">홍보</a>
                        <a href="<%=request.getContextPath()%>/contact.do/inquiry" class="dropdown-item">문의</a>
                        <a href="<%=request.getContextPath()%>/contact.do/faq" class="dropdown-item">faq</a>
                        <a href="<%=request.getContextPath()%>/contact.do/franchise" class="dropdown-item">제휴문의</a>
                       
                    </div>
                </div>

				<div class="btn_div d-grid gap-2 d-md-block">
				<c:choose>
					<c:when test="${empty USER_ID}">
						<a href="<%=request.getContextPath()%>/member.do/register" class="btn btn-primary py-2 px-4">join</a>
                	<a href="<%=request.getContextPath()%>/member.do/login" class="btn btn-primary py-2 px-4">login</a>
					</c:when>
					<c:otherwise>	
						<a href="<%=request.getContextPath()%>/member.do/modify" class="btn btn-primary py-2 px-4">modify</a>
                		<a href="<%=request.getContextPath()%>/member.do/logout" class="btn btn-primary py-2 px-4">logout</a>
					</c:otherwise>

				</c:choose>
				</div>

                
            </div>
        </div>
    </nav>
    <!-- Navbar End -->


</body>
</html>