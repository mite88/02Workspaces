<%--
/**
 * 1. 프로젝트명 : about
 * 2. 작성일 : 2022. 6. 21. 오후 2:43:14
 * 3. 작성자 : mite88
 * 4. 설명 : 소개
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 21.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title_name}</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="about-img">
                        <img class="img-fluid" src="<%=request.getContextPath()%>/user/resources/img/about-1.jpg" alt="">
                        <img class="img-fluid" src="<%=request.getContextPath()%>/user/resources/img/about-2.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h4 class="section-title">Way Soho Office?</h4>
                    <h1 class="display-5 mb-4">business partner for the office</h1>
                    <p>
                    	저희 소호사무실 00은 소호사무실 예약사이트입니다.
                    	합리적인 비용과 서비스로 당신의 든든한 파트너가 되어드립니다.
                    </p>
                    <p class="mb-4">
                    	1인실 부터 다인실까지 다양한 사무실을 제공하고 있습니다.
                    </p>
                    
                    <div class="d-flex align-items-center mb-5">
                        <div class="d-flex flex-shrink-0 align-items-center justify-content-center border border-5 border-primary" style="width: 120px; height: 120px;">
                            <h1 class="display-1 mb-n2" data-toggle="counter-up">25</h1>
                        </div>
                        <div class="ps-4">
                            <h3>Soho Office </h3>
                            <h3 class="mb-0">Number of Branches</h3>
                        </div>
                    </div>
                    <a class="btn btn-primary py-3 px-5" href="">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
    
	<!-- footer -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>