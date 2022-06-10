<%--
/**
 * 1. 프로젝트명 : 14MVCBoard/Pass.jsp
 * 2. 작성일 : 2022. 6. 8. 오후 5:03:14
 * 3. 작성자 : mite88
 * 4. 설명 : 비번검증 및 처리
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
<title>14MVCBoard/Pass.jsp</title>
<script type="text/javascript">
	function validateForm(form) {
		if(form.pass.value == ""){
			alert("비번입력");
			form.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>파일 첨부형 게시판 - 비밀번호 인증(Pass)</h2>

	<form action="../mvcboard/pass.do" name="writeFrm" method="post" onsubmit="return validateForm(this);">
		<!-- 
		해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은후 request영역에 저장하여
		View에서 확인되나 EL을 이용하여 그과정없이 param내장객체로 값을 받을 수 있음
		
		※hidden의 경우 웹브라우저에 숨김처리 되기때문에 테스트를 위해선
		 개발자 모드를 사용하거나 type를 잠깐 수정하여확인해야함
		 -->
		<input type="hid den" name="idx" value="${param.idx}"/>
		<input type="hid den" name="mode" value="${mode}"/>
		<table border="1" width="90%">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" style="width: 100px;"/></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit">검증하기</button>
					<button type="reset">reset</button>
					<button type="button" onclick="location.href='../mvcboard/list.do'">목록</button>
				</td>
			
			</tr>
		</table>
	</form>
</body>
</html>