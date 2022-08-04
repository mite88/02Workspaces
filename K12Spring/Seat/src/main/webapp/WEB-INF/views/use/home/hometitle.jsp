<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<%
/* 현재 url 주소 가지고 오기(로그인시 필요) */
String url=String.valueOf(request.getAttribute("javax.servlet.forward.request_uri"));
String[] directoryName = url.split("/"); 
String fileName=null;

String param=String.valueOf(request.getQueryString());
if(param!=null){
	fileName = directoryName[directoryName.length -1]+"?"+param;
}else{
	fileName = directoryName[directoryName.length -1];
}

%>
<body class="sidebar-collapse">
<!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-primary fixed-top" color-on-scroll="400" style="background-color: #2CA8FF !important;">
        <div class="container">
            <div class="navbar-translate">
         <a class="navbar-brand" href="home.do">
                    <img alt="" src="http://ijuju88.cdn3.cafe24.com/img/home.png">
                </a>
                <button class="navbar-toggler navbar-toggler" type="button" 
                data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" 
                aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar bar1"></span>
                    <span class="navbar-toggler-bar bar2"></span>
                    <span class="navbar-toggler-bar bar3"></span>
                </button>
            </div>
          <div class="collapse navbar-collapse justify-content-end" id="navigation" 
          data-nav-image="https://static.pexels.com/photos/1526/dark-blur-blurred-gradient.jpg">
                <ul class="navbar-nav">
          <!-- 로그인 안되면 -->
			<c:choose>

			<c:when test="${sessionScope.USESID eq null}">
			
			<form action="homelogin.do" method="post" id="loginForm">
			<input type="hidden" name="backpage" value="<%=fileName%>">
			<div class="container-fluid">
	   			 <div class="row">
			<div class="col-sm-4">
		
				<input type="text" class="form-control input" id="id" name="id" placeholder="id">
			</div>
			<div class="col-sm-4">
				<input type="password" class="form-control input" id="pw" name="pw" placeholder="pw">
			</div>
			
				<button type="submit" class="btn btn-sm" id="Uselogin"
				title="Login">Login</button>
			
				<button type="button" class="btn btn-sm" onclick="location.href='homejoin.do'">
				Join</button>
				
			</div>
			</div>
		</form>
		
          </c:when>
          <c:otherwise>
		<div class="form-row">
			<div class="col" style="margin-left: 20px; width: 200px;">
				<input type="hidden" id="userid" value="${sessionScope.USESID}">
			<span style="color: #fff;" >${sessionScope.USESID}님<br/> 환영합니다</span>
			</div>

			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-right: 20px;">
				<button type="button" class="btn btn-secondary"
					data-toggle="tooltip" data-placement="bottom" id="UsePage"
					title="MyPage">MyPage</button>
				<form action="homelogout.do" method="GET" id="logoutForm">

					<button type="submit" class="btn btn-secondary"
						data-toggle="tooltip" data-placement="bottom" id="Uselogout"
						title="LogOut">LogOut</button>

				</form>
			</div></div>
			
			<li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="Link1" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false" style="width: 100px; ">My page</a>
			
			<div class="dropdown-menu" aria-labelledby="Link1">
				<a class="dropdown-item" href="homeMyPage1.do">예약현황</a>
				<a class="dropdown-item" href="homeMyPage2.do">회원수정</a>
			</div>
			</li>
          </c:otherwise></c:choose>
  		<li class="nav-item">
            <a class="nav-link" href="home.do" style="width: 50px;">Home</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="about.do" style="width: 50px;">About</a>
          </li>
          
          <li class="nav-item" style="width: 115px; ">
          	<a class="nav-link" href="homelist.do">공연검색 </a>
          </li>
          
           <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="Link2" data-toggle="dropdown" 
           aria-haspopup="true" aria-expanded="false" style="width: 100px; ">
			게시판</a>
			
			<div class="dropdown-menu" aria-labelledby="Link2">
				<a class="dropdown-item" href="home_noticelist.do">공지게시판</a> 
				<a class="dropdown-item" href="home_questionlist.do">문의게시판</a>
			</div>
		</li>
		
            <li class="nav-item">
          	<a class="nav-link" href="adminlogin.do" style="width: 100px;" >관리자(임시)</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="portfolio" 
            data-placement="bottom" href="https://oxju5382.wixsite.com/ijuju88" target="_blank">
              <i class="fas fa-address-card fa-2x"></i>
              <p class="d-lg-none d-xl-none">개인포트폴리오</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="naver blog" data-placement="bottom" 
            href="https://blog.naver.com/ijuju88" target="_blank">
              <i class="fab fa-blogger-b"></i>
              <p class="d-lg-none d-xl-none">개인블로그</p>
            </a>
          </li>
        </ul>
      </div>
    </div></div>
  </nav>
  <!-- End Navbar -->
</header>
<!-- ##### Header Area End ##### -->

