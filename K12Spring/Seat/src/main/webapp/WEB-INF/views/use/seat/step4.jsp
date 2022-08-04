<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<head>
<meta charset='UTF-8'>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/homeshowseat.css">
<link rel="stylesheet" href="resources/style2.css">
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

</head>
<body style="font-size: 16px;">


	<div class="container">
		<h3>Step 4 - 결제완료</h3>
		<p>결제가 완료되었습니다.</p>
			<hr>
			<ul class="list-inline pull-right">
				<li><button type="button" class="btn btn-primary close">창닫기</button></li>
			</ul>

	</div>

	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
	<script src="resources/js/sweetalert2.min.js"></script>

	<script>
		$(function() {

			//다음버튼클릭시
			$(".close").on("click", function() {
				 self.close();  
				 location.reload();
			});
		});
	</script>

</body>
</html>