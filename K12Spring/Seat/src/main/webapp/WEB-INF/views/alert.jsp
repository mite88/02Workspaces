<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>넘어가는중...</title>
</head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<!-- 알림창용 sweetalert2 -->
<!-- https://sweetalert2.github.io/ -->
<script src="resources/js/sweetalert2.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<body>
	<script src="resources/js/jquery-3.2.1.js"></script>



	<script>
		$(function() {

			swal({
				title : ".......",
				text : '${msg}',
				showConfirmButton : false,
				timer : 1000,
				 type: 'success'
			}).then(function() {
				window.location.href = '${url}';
			});
		});
	</script>
</body>
</html>