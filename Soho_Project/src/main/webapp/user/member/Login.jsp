<%--
/**
 * 1. 프로젝트명 : Login.jsp
 * 2. 작성일 : 2022. 6. 4. 오후 7:06:47
 * 3. 작성자 : mite88
 * 4. 설명 : 로그인
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/jQuery/jquery-3.6.0.min.js"></script>


<style type="text/css">
.login,
.image {
  min-height: 80vh;
}

.bg-image {
  background-image: url('https://bootstrapious.com/i/snippets/sn-page-split/bg.jpg');
  background-size: cover;
  background-position: center center;
}
</style>

<script type="text/javascript">
//아이디 비번 입력체크
function loginCheck(form) {
	//${pageContext.request.contextPath}/member/register.do
		if (form.user_id.value == "") {
			alert("아이디 입력");
			form.user_id.focus();
			return false;
		}if (form.user_pw.value == "") {
			alert("비밀번호 입력");
			form.user_pw.focus();
			return false;
		}	
}


</script>
</head>
<body>
	 <header>
		<jsp:include page="../layout/header.jsp" />
	</header>

	<div class="container-fluid">
		<div class="row no-gutter">
			<!-- The image half -->
			<div class="col-md-6 d-none d-md-flex bg-image"></div>


			<!-- The content half -->
			<div class="col-md-6 bg-light">
				<div class="login d-flex align-items-center py-5">

					<!-- Demo content-->
					<div class="container">
						<div class="row">
							<div class="col-lg-10 col-xl-7 mx-auto">
								<h3 >로그인페이지</h3>
								<p class="text-muted mb-4">로그인페이지입니다.</p>
								
								<form onsubmit="return loginCheck(this);" method="post">
									<div class="form-group mb-3">
										<input name="user_id" type="text" placeholder="id입력" class="form-control rounded-pill border-0 shadow-sm px-4">
									</div>
									<div class="form-group mb-3">
										<input name="user_pw" type="password" placeholder="Password" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary">
									</div>
									<div class="custom-control custom-checkbox mb-3">
										<input id="id_check" type="checkbox" checked class="custom-control-input"> 
										<label for="customCheck1" class="custom-control-label">Remember Id</label>
									</div>
									
									<div class="d-flex ">
										<button type="submit" class="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm">
										Login</button>
										
										<button type="button" class="btn  btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm"
										 onclick="location.href='${pageContext.request.contextPath}/member/register.do'">
										Join</button>
									</div>

								</form>
							</div>
						</div>
					</div>
					<!-- End -->

				</div>
			</div>
			<!-- End -->

		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" /> 
</body>
</html>