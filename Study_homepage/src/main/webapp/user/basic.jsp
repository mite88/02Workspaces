<%--
/**
 * 1. 프로젝트명 : basic.jsp
 * 2. 작성일 : 2022. 6. 21. 오후 2:43:14
 * 3. 작성자 : mite88
 * 4. 설명 : 기본
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
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<div class="container-xxl project py-5">
		<div class="container">
			<div class="text-center mx-auto mb-5 wow fadeInUp"
				data-wow-delay="0.1s"
				style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
				<h4 class="section-title">${title_name}</h4>
				<h1 class="display-5 mb-4">Visit Our Latest Projects And Our
					Innovative Works</h1>
			</div>
			<!-- 안내 -->
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

				<div class="col-lg-12">
					<div class="tab-content w-100">

						<div class="row my-5">
							
						</div>

					</div>
					
				</div>
				<!-- col-lg-12 end -->
				
			</div>
			<!-- row end -->
			
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>