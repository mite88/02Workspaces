<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title_name}</title>

<style>
.entry-meta li {
    display: inline-block;
    font-size: 13px;
    color: #919191;
    margin-bottom: 15px;
    white-space: nowrap;
}
/*정보 아래 선*/
.bottom-line:after {
    content: "";
    display: block;
    width: 48px;
    border-bottom: 3px solid #e8e8e8;
    margin: 15px auto 15px;
}
/*정보구분선*/
.blog-content .entry-meta li:first-child:before {
    margin: 0 0 0 -3px;
}
.entry-meta li:first-child:before {
    content: "";
    margin: 0;
}
.entry-meta li:before {
    content: "|";
    opacity: 0.5;
    margin: 0 7px;
}
</style>
</head>
<body>
<!-- header -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div class="container-xxl project py-5">
		<div class="container-fluid ">
			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
				<!-- 상단정보 -->
				<h4 class="section-title">${title_name}</h4>
				<h1 class="display-5 mb-4">${dto.title }</h1>
				
				<ul class="entry-meta bottom-line">
                    <li class="entry-date">
                      <a href="#">${ dto.postdate}</a>
                    </li>
                    
                    <li class="entry-author">
                      by <a href="#">${dto.name}</a>
                    </li>
          
                    <li>
                      <a href="blog-single.html" class="entry-comments">${ dto.visitcount} 조회수</a>
                    </li>               
                </ul>
                  
                
                <c:if test="${ not empty dto.ofile}">
					${ dto.ofile}
					<a href="<%= request.getContextPath() %>/contact.do/download?ofile=${ dto.ofile}&sfile=${ dto.sfile}&idx=${ dto.idx}">
						[다운로드]
					</a>
					(다운로드수 : ${dto.downcount })
				</c:if>  


			</div>
			
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

				<div class="col-lg-12">
				
					<div class="row">
		               <div class="col-lg-12 text-center">
		                   <img class="img-fluid  mt-5 mb-3 " src="https://technext.github.io/mark/images/project-details-large.jpg" alt="alternative">
		               </div> <!-- end of col -->
		           </div>

            		<!-- 내용 -->
					<div class="tab-content w-100">

						<div class="row my-5">
							<div class="col-lg-12 text-center">
							${ dto.content}
							</div>
						</div>

					</div>
					
					<!-- 버튼 -->
					<div class="d-grid gap-1">
						<button class="btn btn-secondary btn-pill w-100" type="button" onclick="location.href='<%= request.getContextPath() %>/contact.do/list/${dto.type}';">
			                목록
			            </button>
		            </div>
					
				</div>
				<!-- col-lg-12 end -->
				
			</div>
			<!-- row end -->
			
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>
