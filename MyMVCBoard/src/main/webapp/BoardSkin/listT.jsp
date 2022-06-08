<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./commons/header.jsp"%>
<body>
	<div class="container">
		<!-- Top영역 -->
		<%@ include file="./commons/top.jsp"%>
		<!-- Body영역 -->
		<div class="row">
			<!-- Left메뉴영역 -->
			<%@ include file="./commons/left.jsp"%>
			<!-- Contents영역 -->
			<div class="col-9 pt-3">
				<h3>
					게시판 목록 - <small>자유게시판</small>
				</h3>
				<!-- 검색 -->
				<div class="row">
					<form method="get">
						<div class="input-group ms-auto" style="width: 400px;">
							<select  name="searchField"  class="form-control">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="name">작성자</option>
							</select>
							 <input type="text" name="searchWord" class="form-control" placeholder="Search"
								style="width: 200px;">
							<button class="btn btn-success" type="submit">
								<i class="bi-search" style="font-size: 1rem; color: white;"></i>
							</button>
						</div>
					</form>
				</div>
				<!-- 게시판 리스트 -->
				<div class="row mt-3 mx-1">
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr class="text-center">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>첨부</th>
							</tr>
						</thead>
						<tbody>

							<c:choose>
								<c:when test="${empty boardLists}">
									<tr>
										<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<!-- 출력할 게시물 존재시 게시물 갯수만큼 반복하여 목록출력 -->
									<c:forEach items="${boardLists}" var="row" varStatus="loop">
										<tr class="text-center">
											<!-- 
						가상번호 계산
						게시물수 - ((( 페이지 번호 -1) * 페이지당 게시물수) + 해당 loop.index)
						 -->
											<td>${map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}</td>
											<td align="left"><a
												href="../BoardSkin/view.do?idx=${row.idx}">${row.title}</a></td>
											<td align="center">${row.name}</td>
											<td align="center">${row.postdate}</td>
											<td align="center">${row.visitcount}</td>
											<td><c:if test="${ not empty row.ofile }">
													<a
														href="../BoardSkin/download.do?ofile=${row.ofile}&sfile=${row.sfile}&idx=${row.idx}">
														<i class="bi-pin-angle-fill" style="font-size: 1rem;"></i>
													</a>
												</c:if></td>
										</tr>
									</c:forEach>


								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
				</div>
				<!-- 각종버튼 -->
				<div class="row">
					<div class="col d-flex justify-content-end">
						<button type="button" class="btn btn-primary" onclick="location.href='../BoardSkin/write.do';">글쓰기</button>
						<!--  
						<button type="button" class="btn btn-secondary">수정하기</button>
						<button type="button" class="btn btn-success">삭제하기</button>
						<button type="button" class="btn btn-info">답글쓰기</button>
						-->
						<button type="button" class="btn btn-warning" onclick="location.href='../BoardSkin/list.do';">목록보기</button>
						<!--  
						<button type="button" class="btn btn-danger">전송하기</button>
						<button type="button" class="btn btn-dark">다시쓰기</button>
						-->
					</div>
				</div>
				<!-- 페이지 번호 -->
				
				
				<div class="row mt-3">
					<div class="col">
						<ul class="pagination justify-content-center">
							${map.pagingImg}
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Copyright영역 -->
		<%@ include file="./commons/copyright.jsp"%>
	</div>
</body>
</html>