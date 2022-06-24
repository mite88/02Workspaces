<%--
/**
 * 1. 프로젝트명 : book.jsp
 * 2. 작성일 : 2022. 6. 21. 오후 2:43:14
 * 3. 작성자 : mite88
 * 4. 설명 : 예약확인
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 21.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title_name}</title>
</head>
<body>

	<!-- 로그인 여부에 따른 설정 -->
	<c:choose>
		<c:when test="${empty USER_ID}">
			<script>
				alert("로그인 후 이용 가능합니다");
				window.history.back();
			</script>
		</c:when>
		<c:otherwise>

			<!-- header -->
			<jsp:include page="../layout/header.jsp"></jsp:include>

			<div class="container-xxl project py-5">
				<div class="container-fluid ">
					<div class="text-center mx-auto mb-5 wow fadeInUp"
						data-wow-delay="0.1s"
						style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
						<h4 class="section-title">${title_name}</h4>
						<h1 class="display-5 mb-4">Visit Our Latest Projects And Our
							Innovative Works</h1>
					</div>
					<!-- 안내 -->
					<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s"
						style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

						<div class="col-lg-12">
							<div class="tab-content w-100">


								<div class="row my-5">

									<div class="col-md-12">

										<!-- 목록 테이블 -->
										<table id="contact_list" class="table text-center">
											<tr>
												<th>일련번호</th>
												<th>번호</th>
												<th>제목</th>
												<th>기간</th>
												<th>입금여부</th>
												<th>오피스명</th>
											</tr>
											<!-- 게시물이 없을 때 -->
											<c:choose>
												<c:when test="${empty Lists }">
													<!-- 리스트에 저장된 게시물이 없을 때 출력부분 -->
													<tr>
														<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
													</tr>
												</c:when>
												<c:otherwise>
													
													
													<c:forEach items='${Lists }' var="row" varStatus="loop">
														<tr align="center">
															<td>${row.number }</td>
															<td>${map.totalCount -(((map.pageNum-1) * map.pageSize) + loop.index) }</td>
															
															<td>${row.title }</td>
															<td>
																<fmt:formatDate value="${row.start }" pattern="yyyy-MM-dd"/> ~ 
																<fmt:formatDate value="${row.end }" pattern="yyyy-MM-dd"/>
															</td>
															<td>${row.pay_type }</td>
															<td>
																<!-- 사무실점 찾기용 -->
																
																${row.o_name }
															  		<%--  ${fn:indexOf(row.office_num,fl.code) >= 0 ? ${fl.code }:''} --%>
																
																
															</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</table>

										<nav aria-label="Page navigation example">
											<ul class="pagination">${map.pagingImg }</ul>
										</nav>

									</div>

								</div>

							</div>

						</div>
						<!-- col-lg-12 end -->


					</div>

				</div>

			</div>
			<!-- col-lg-12 end -->



			<!-- footer -->
			<jsp:include page="../layout/footer.jsp"></jsp:include>

		</c:otherwise>

	</c:choose>
</body>
</html>
