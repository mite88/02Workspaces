<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="/springlegacy/static/bootstrap-5.1.3/css/bootstrap.css" />
<script type="text/javascript"
	src="./resources/jquery/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="./resources/bootstrap-5.1.3/js/bootstrap.bundle.js"></script>
</head>
<body>
	<div class="container">
		<h2>Spring Framework 시작하기</h2>

		<h3>resources 폴더 사용하기</h3>
		<img src="./img_avatar1.png" alt="부트스트랩 아바타1" /> <img
			src="./resources/images/img_avatar2.png" alt="아바타2" width="200" /> <img
			src="./static/images/1.png" alt="스펀지밥" width="100" />

	</div>
	<div class="container">
		<h3>첫번째 컨트롤러 만들기</h3>
		<ul>
			<li><a href="./home/helloString" target="_blank">첫번째 컨트롤로
					바로가기</a></li>
		</ul>
	</div>

	<h3>form값 처리하기</h3>
	<ul>
		<!-- 요청명 뒤에 쿼리스트링으로 파라미터 전달 -->
		<li><a href="./form/servletRequest?id=kosmo&pw=1234"
			target="_blank"> HtteServletRequest로 폼값받기</a></li>

		<li><a
			href="./form/requestParam.do?id=kosmo&pw=1234
			&name=홍길동&email=hong@gildong.com"
			target="_blank"> @requestParam 어노테이션으로 폼값받기</a></li>

		<li><a
			href="./form/commandObjGet.do?id=kosmo&pw=1234
			&name=홍길동&email=hong@gildong.com"
			target="_blank"> Command 객체로 한번에 폼값받기</a></li>

		<li><a href="./form/gildong99/코스모" target="_blank">
				pathVariable 어노테이션으로 폼값받기</a></li>

	</ul>

	<h3>@RequestMapping어노테이션 활용</h3>
	<ul>
		<li><a href="./requestMapping/index.do" target="_blank">
				requestMapping시작페이지 바로가기</a></li>
	</ul>


	<h3>폼 데이터 검증하기 - validator</h3>
	<ul>
		<li><a href="validate/memberRegist.do" target="_blank"> 회원가입
				바로가기</a></li>
	</ul>
	
	<h3>DI(Dependency Injection) :  의존성주입</h3>
	<ul>
		<li><a href="di/mydi1.do" target="_blank"> XML설정파일을 통한 빈
				생성1(생성자와 setter)</a></li>

		<li><a href="di/mydi2.do" target="_blank"> XML 설정파일을 통한 빈
				생성2(다양한 멤버변수) </a></li>

		<li><a href="di/mydi3.do" target="_blank"> 어노테이션을 통한 빈 생성 </a></li>
	</ul>
	
	<h3>Environment객체를 이용한 외부파일 참조하기</h3>
	<ul>
		<li><a href="environment/main1" target="_blank"> 
		외부파일 참조하기1(Environment객체 사용)</a></li>
	</ul>
	
	<h3>파일업로드</h3>
	<ul>
		<li><a href="./fileUpload/uploadPath.do" target="_blank"> 
		upload폴더의 물리적 경로 확인하기</a></li>
		
		<li><a href="./fileUpload/uploadForm.do" target="_blank"> 
		파일업로드 폼</a></li>
	</ul>


</body>
</html>
