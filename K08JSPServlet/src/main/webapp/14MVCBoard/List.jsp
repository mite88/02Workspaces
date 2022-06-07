<%--
/**
 * 1. 프로젝트명 : List.jsp
 * 2. 작성일 : 2022. 6. 7. 오후 4:45:45
 * 3. 작성자 : mite88
 * 4. 설명 : 
 * ========================================================
 * 수정일         작성자             내용      
 * ========================================================
 *  
 * ========================================================
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>14MVCBoard/List.jsp</title>
<style>
a {
	text-decoration: none;
}

.page {
	margin-top: 20px;
	white-space: nowrap;
	text-align: center;
	height: 37px;
	line-height: 37px;
}
.page li {
	display:inline-block;
}
.page a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:auto;
	min-width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
</style>
</head>
<body>
	<h2></h2>

	<!-- form태그에 action속성이 존재하지 않을 시 폼값이 현재페이지로 전송됨 -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField" id="">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> 
				<input style="flex: 4;" type="text" name="searchWord" /> 
				<input type="submit" value="검색하기" /></td>
			</tr>
		</table>
	</form>

	<!-- 게시물 목록 테이블 -->
	<table border="1" width="90%">
		<!-- 칼럼명 -->
		<tr align="center">
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
		<c:choose>
			<c:when test="${empty boardLists}">
				<tr>
					<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- 출력할 게시물 존재시 게시물 갯수만큼 반복하여 목록출력 -->
				<c:forEach items="${boardLists}" var="row" varStatus="loop">
					<tr align="center">
						<!-- 
						가상번호 계산
						게시물수 - ((( 페이지 번호 -1) * 페이지당 게시물수) + 해당 loop.index)
						 -->
						<td>${map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}</td>
						<td align="left"><a href="../mvcboard/view.do?num=${row.idx}">${row.title}</a>
						</td>
						<td align="center">${row.name}</td>
						<td align="center">${row.visitcount}</td>
						<td align="center">${row.postdate}</td>
						<td>
							<c:if test="${ not empty row.ofile }">
								<a
									href="../mvcboard/download.do?ofile=${row.ofile}&sfile=${row.sfile}&idx=${row.idx}">[Down]</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>


			</c:otherwise>
		</c:choose>
	</table>

	<table border="1" width="90%">
		<tr align="center">
			<td class="page">${map.pagingImg}</td>
			<td width="100"><button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button></td>
		</tr>
	</table>



</body>
</html>