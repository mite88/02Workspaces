<%--
/**
 * 1. 프로젝트명 : ceo
 * 2. 작성일 : 2022. 6. 21. 오후 2:43:14
 * 3. 작성자 : mite88
 * 4. 설명 : 인사말
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
	
	
	<div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                <h4 class="section-title">${title_name}</h4>
                <h1 class="display-5 mb-4">${title_name}</h1>
            </div>
            <p class="fs-5">
            Clita clita tempor justo dolor ipsum amet kasd amet duo justo duo duo labore sed sed. 
            Magna ut diam sit et amet stet eos sed clita erat magna elitr erat sit sit erat at rebum justo sea clita.
            <br><br>
            
            Clita clita tempor justo dolor ipsum amet kasd amet duo justo duo duo labore sed sed. 
            Magna ut diam sit et amet stet eos sed clita erat magna elitr erat sit sit erat at rebum justo sea clita.
            <br><br>
            
            Clita clita tempor justo dolor ipsum amet kasd amet duo justo duo duo labore sed sed. 
            Magna ut diam sit et amet stet eos sed clita erat magna elitr erat sit sit erat at rebum justo sea clita.
            <br><br>
            
            Clita clita tempor justo dolor ipsum amet kasd amet duo justo duo duo labore sed sed. 
            Magna ut diam sit et amet stet eos sed clita erat magna elitr erat sit sit erat at rebum justo sea clita.
            </p>
            <h3>Client Name</h3>
            <span class="text-primary">Profession</span>
      	</div>
    </div>
	
	<!-- footer -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>