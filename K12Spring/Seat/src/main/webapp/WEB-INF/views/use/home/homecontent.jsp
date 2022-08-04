<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link href="resources/admin/plugins/datepicker/datepicker3.css"
	rel="stylesheet">

<script src="resources/admin/plugins/datepicker/bootstrap-datepicker.js"
	type="text/javascript"></script>


<script type="text/javascript">
	$(function() {

		//날짜 공연검색
		$('#selectdate').click(
				function() {
					var show_startdate = $("#start_date").val();
					var show_enddate = $("#end_date").val();

					window.location.href = "homelistselect.do?show_startdate="
							+ show_startdate + "&show_enddate=" + show_enddate;
				});

	});
</script>
<html>
</head>

<body>
<!-- 게시판 및 이벤트?소식넣기 -->
<div class="section section-tabs">
	<div class="container">
		<div class="row">
			<div class="col" >
				<div class="row align-items-center">
					<div class="input-daterange input-group" id="datepicker">
						<input type="text" class="form-control input-sm" 
							id="start_date" name="start_date" placeholder="From date" style="height: 40px;"/> 
							
							<span class="input-group-addon"  style="height: 40px;">to</span> 
							
							<input type="text" class="form-control input-sm" id="end_date" name="end_date"
							placeholder="To date"  style="height: 40px;"/>
							<button class="btn btn-primary btn-sm" id="selectdate">조회</button>
					</div>
					<script type="text/javascript">
						$('.input-daterange').datepicker({
							autoclose : true,
							format : 'yyyy-mm-dd',
						});
					</script>

				</div>

			</div>
		</div>

	</div>
</div>

  <!-- End .section-navbars  -->
      <div class="section section-tabs">
        <div class="container">
          <div class="row">
            <div class="col-md-10 ml-auto col-xl-6 mr-auto">
             <h4 class="title">공지사항 </h4>
               
               <table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${noticelist}" varStatus="status">
						<tr>
							<th scope="row">${vo.nb_no}</th>
							<td><a href="home_noticeview.do?nb_no=${vo.nb_no}">${vo.nb_title}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="home_noticelist.do" class="btn original-btn">더보기</a>  
            </div>
            
             <div class="col-md-10 ml-auto col-xl-6 mr-auto">
             
          
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
               
               <ol class="carousel-indicators">
					<c:forEach var="list" items="${ssplList}" varStatus="status">
						<li data-target="#myCarousel" data-slide-to="${status.index}"
							<c:if test='${status.index == 0}'>class="active"</c:if>>
						</li>
					</c:forEach>
				</ol>
	
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<c:forEach var="list" items="${ssplList}" varStatus="status">
						<div
							class="carousel-item <c:if test='${status.first}'>active</c:if>">
							<img src="homeimgtitle.do?show_no=${list.show_no}&idx=1" />
							<div class="carousel-caption d-none d-md-block">
								<h5>${list.show_title}</h5>
							</div>
						</div>
					</c:forEach>
				</div>
            
            </div>  
          </div>
        </div>
  </div></div>
</body>
</html>

