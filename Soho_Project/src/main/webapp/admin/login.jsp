<%--
/**
 * 1. 프로젝트명 : login.jsp
 * 2. 작성일 : 2022. 6. 27. 오후 4:48:54
 * 3. 작성자 : mite88
 * 4. 설명 : 로그인페이지
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 27.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title_name}</title>

<!-- CSS files -->
<link href="<%=request.getContextPath()%>/admin/dist/css/tabler.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/dist/css/tabler-flags.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/dist/css/tabler-payments.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/dist/css/tabler-vendors.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/dist/css/demo.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/dist/css/tabler-icons.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/dist/css/style.css">


<!-- Libs JS -->
<script src="<%=request.getContextPath()%>/admin/dist/libs/apexcharts/dist/apexcharts.min.js" defer></script>
<script src="<%=request.getContextPath()%>/admin/dist/libs/jsvectormap/dist/js/jsvectormap.min.js" defer></script>
<script src="<%=request.getContextPath()%>/admin/dist/libs/jsvectormap/dist/maps/world.js" defer></script>
<script src="<%=request.getContextPath()%>/admin/dist/libs/jsvectormap/dist/maps/world-merc.js" defer></script>
<!-- Tabler Core -->
<script src="<%=request.getContextPath()%>/admin/dist/js/tabler.min.js" defer></script>
<script src="<%=request.getContextPath()%>/admin/dist/js/demo.min.js" defer></script>
<script  src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
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
<body class=" border-top-wide border-primary d-flex flex-column">
	<div class="page page-center">
		<div class="container-tight py-4">
			<div class="text-center mb-4">
				<div class="navbar-brand navbar-brand-autodark">
				<img src="<%=request.getContextPath()%>/user/resources/img/icons/icon-1.png" 
				width="110" height="32" alt="Tabler" class="navbar-brand-image">
				관리자페이지
				</div>

			</div>


			<form onsubmit="return loginCheck(this);" method="post" class="card card-md">
				<div class="card-body">
					<div class="form-group mb-3">
						<input name="user_id" type="text" placeholder="id입력"
							class="form-control">
					</div>
					<div class="form-group mb-3">
						<input name="user_pw" type="password" placeholder="Password"
							class="form-control">
					</div>


					<div class="d-flex ">
						<button type="submit"
							class="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm">
							Login</button>


					</div>

				</div>
			</form>

		</div>
	</div>

</body>
</html>