<%--
/**
 * 1. 프로젝트명 : /14MVCBoard/View.jsp
 * 2. 작성일 : 2022. 6. 8. 오후 12:40:38
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 8.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/14MVCBoard/View.jsp</title>


</head>
<body>
	<h2>파일 첨부형 게시판 - 상세보기(view)</h2>

	<table border="1" width="90%">
		<colgroup>
			<col width="15%"/><col width="35%"/>
			<col width="15%"/><col width="*"/>
		</colgroup>
		
		<tr>
			<td>번  호</td><td>${dto.idx}</td>
			<td>작성자</td><td>${dto.name}</td>
		</tr>
		<tr>
			<td>작성일</td><td>${dto.postdate}</td>
			<td>조회수</td><td>${dto.visitcount}</td>
		</tr>
		<tr>
			<td>제목</td><td colspan="3">${dto.title}</td>
		</tr>
		<tr>
			<td>내용</td><td colspan="3" height="100">${dto.content}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<!-- 
				첨부된 파일이 있을 경우 파일명과 다운로드 링크 출력
				완료시 카운터를 위해 일련번호를 파라미터로 받음
				 -->
				<c:set var="filetype" value="${fn:split(dto.ofile, '.')}" />
				<c:set var="filetype_img" 
				value="${(filetype[fn:length(filetype)-1] eq 'jpg')  
				or (filetype[fn:length(filetype)-1] eq 'png') 
				or (filetype[fn:length(filetype)-1] eq 'jpeg') 
				or filetype[fn:length(filetype)-1] eq 'gif'}" />
				
				<c:if test="${not empty dto.ofile and filetype_img}">
				
					${dto.ofile}
					<a href="../mvcboard/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">
					[다운로드]</a>
				</c:if>
			</td>
			<td>다운로드수</td><td>${dto.downcount}</td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="button" 
					onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${param.idx}'">
					수정하기
				</button>
				
				<button type="button" 
					onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${param.idx}'">
					삭제하기
				</button>
				
				<button type="button" 
					onclick="location.href='../mvcboard/list.do'">
					목록가기
				</button>
			</td>
		</tr>
	
	</table>
</body>
</html>