<%--
/**
 * 1. 프로젝트명 : 14MVCBoard/Edit.jsp
 * 2. 작성일 : 2022. 6. 8. 오전 10:05:19
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>14MVCBoard/Edit.jsp</title>
<script type="text/javascript">
	//글쓰기 누락확인
	function validateForm(form) {
		if (form.name.value == "") {
			alert("작성자 입력");
			form.name.focus();
			return false;
		}if (form.title.value == "") {
			alert("제목 입력");
			form.title.focus();
			return false;
		}if (form.content.value == "") {
			alert("내용 입력");
			form.content.focus();
			return false;
		}if (form.pass.value == "") {
			alert("비밀번호 입력");
			form.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2>
	<!-- 
	파일전송시 <form>
	1. post 전송
	2. 인코딩 방식 : multipart/form-data
	 -->
	<form action="../mvcboard/edit.do" name="writeFrm" method="post"
	enctype="multipart/form-data" onsubmit="return validateForm(this);">
		<input type="hidden" name="idx" value="${dto.idx}"/>
		<input type="hidden" name="prevOfile" value="${dto.ofile}"/>
		<input type="hidden" name="prevSfile" value="${dto.sfile}"/>
		
		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" style="width: 150px;" value="${dto.name}"/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%;"  value="${dto.title}"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td> <textarea name="content" style="width: 90%; height: 100px;">${dto.content}</textarea> </td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="ofile"/></td>
			</tr>
			<!-- 패스워드 검증 마친 후 수정페이지 진입해서 아냏도되고 해도되고 ㅇㅊㅇ -->
			<!-- <tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" style="width: 100px;"/></td>
			</tr> -->
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">reset</button>
					<button type="button" onclick="location.href='../mvcboard/list.do'">목록</button>
				</td>
			
			</tr>
		</table>
	</form>
</body>
</html>