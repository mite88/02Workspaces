<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./commons/header.jsp"%>

<script type="text/javascript">
	function validateForm(form) {
		if(form.pass.value == ""){
			alert("비번입력");
			form.pass.focus();
			return false;
		}
	}
</script>

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
					파일 첨부형 게시판 - 비밀번호 인증(Pass)
				</h3>
				<!-- pass -->
				
				<form action="../BoardSkin/pass.do" name="writeFrm" method="post" onsubmit="return validateForm(this);">
					<!-- 
					해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은후 request영역에 저장하여
					View에서 확인되나 EL을 이용하여 그과정없이 param내장객체로 값을 받을 수 있음
					
					※hidden의 경우 웹브라우저에 숨김처리 되기때문에 테스트를 위해선
					 개발자 모드를 사용하거나 type를 잠깐 수정하여확인해야함
					 -->
					<input type="hidden" name="idx" value="${param.idx}"/>
					<input type="hidden" name="mode" value="${mode}"/>
					<table class="table">
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pass" style="width: 100px;" class="form-control" /></td>
						</tr>
						
						<tr>
							<td colspan="2" align="center">
								<button type="submit" class="btn btn-primary">검증하기</button>
								<button type="reset" class="btn btn-secondary">reset</button>
								<button type="button" class="btn btn-secondary" onclick="location.href='../BoardSkin/list.do'">목록</button>
							</td>
						
						</tr>
					</table>
				</form>
						
			</div>
		</div>
		<!-- Copyright영역 -->
		<%@ include file="./commons/copyright.jsp"%>
	</div>
</body>
</html>