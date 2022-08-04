<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<meta charset="UTF-8">

<!-- chart.js charts -->
<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/admin/plugins/chart.js/Chart.js"></script>
<!-- <script src="http://192.168.0.239:1004/socket.io/socket.io.js"></script> -->
<!--<script>
 $(function () {
    
    //객체생성
    var socket=io.connect("http://192.168.0.239:1004");
    var chatindex=0;
    id="admin";
    
    //서버접속시
    socket.on('connect', function () {
         //최초전송할 아이디 -> 세션시 ${sessionScope.ID}
         socket.emit('init', {"id": id, "msg" : "불고기버거"});
         
         //메세지를 보내면 밑에 적히도록
         socket.on('subscribe', function(data) {
        	 //alert(data.id=="admin");
             
        	 if(data.id=="admin"){
        		 $(".chatmessage").append("<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'>");
                 $(".chatmessage").append("<span class='direct-chat-name float-right' id='chatid"+chatindex+"'>");
                 $(".chatmessage").append("</span><span class='direct-chat-timestamp float-left'>23Jan 2:05 pm</span></div><br/>");
                 $(".chatmessage").append("<img class='direct-chat-img' src='dist/img/user1-128x128.jpg' alt='message user image'>");
                 $(".chatmessage").append("<div class='direct-chat-text' id='chattext"+chatindex+"'> </div></div>");	
                 $('#chatid'+chatindex).prepend(data.id);
                 $('#chattext'+chatindex).prepend(data.msg+"<br/>");

        	 }else if(!(data.id=="admin")){
        		  $(".chatmessage").append("<div class='direct-chat-msg'><div class='direct-chat-info clearfix'>");
                  $(".chatmessage").append("<span class='direct-chat-name float-left' id='chatid"+chatindex+"'>");
                  $(".chatmessage").append("</span> <span class='direct-chat-timestamp float-right'>23Jan 2:05 pm</span></div><br/>");
                  $(".chatmessage").append("<img class='direct-chat-img' src='dist/img/user1-128x128.jpg' alt='message user image'>");
                  $(".chatmessage").append("<div class='direct-chat-text' id='chattext"+chatindex+"'> </div></div>");	
                  $('#chatid'+chatindex).prepend(data.id);
                  $('#chattext'+chatindex).prepend(data.msg+"<br/>");
        	 }
					
             chatindex++;
         });
    });
    
    //버튼누를때 보내기
    $('.charSend').click(function () {
         var txt=$("#message").val();
         
         socket.emit('publish', {"id": id, "msg" : txt});
    });
});
 
</script> -->
<body class="hold-transition sidebar-mini">
	<%@ page session="true"%>
	<c:choose>
		<c:when test="${sessionScope.SID eq null}">
			<h3>잘못된 접근입니다...</h3>
			<!-- <script type="text/javascript">
			alert("잘못된접근입니다. 로그인해주세요^^*");
			window.location.href="adminlogin.do";
			</script> -->
		</c:when>
		<c:otherwise>
			<div class="wrapper">

				<jsp:include page="admintitle.jsp"></jsp:include>
				<!-- Content Wrapper. Contains page content -->
				<div class="content-wrapper">
					<!-- Content Header (Page header) -->
					<div class="content-header">
						<div class="container-fluid">
							<div class="row mb-2">
								<div class="col-sm-6">
									<h1 class="m-0 text-dark">Dashboard</h1>
								</div>
								<!-- /.col -->
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right">
										<li class="breadcrumb-item"><a href="#">Home</a></li>
										<li class="breadcrumb-item active">Dashboard v2</li>
									</ol>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.container-fluid -->
					</div>
					<!-- /.content-header -->

					<!-- Main content -->
					<section class="content">
						<div class="container-fluid">

							<!-- 윗상자 -->
							<div class="row">
								<!-- ./col -->
								<div class="col-lg-3 col-6">
									<!-- small box -->
									<div class="small-box bg-warning">
										<div class="inner">
											<h3>${member_num}</h3>

											<p>최근일주일간회원수</p>
										</div>
										<div class="icon">
											<i class="ion ion-person-add"></i>
										</div>
										<a href="adminmember.do" class="small-box-footer">자세히보기<i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
								<div class="col-lg-3 col-6">
									<!-- small box -->
									<div class="small-box bg-info">
										<div class="inner">
											<h3>${show_num}</h3>
											<p>공연등록수</p>
										</div>
										<div class="icon">
											<i class="ion ion-bag"></i>
										</div>
										<a href="adminshowseat.do" class="small-box-footer">들어가기<i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
								<!-- ./col -->
								<div class="col-lg-3 col-6">
									<!-- small box -->
									<div class="small-box bg-success">
										<div class="inner">
											<h3>기타</h3>
											<p>문의게시판</p>
										</div>
										<div class="icon">
											<i class="ion ion-stats-bars"></i>
										</div>
										<a href="home_questionlist.do" class="small-box-footer">들어가기<i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>

								<!-- ./col -->
								<div class="col-lg-3 col-6">
									<!-- small box -->
									<div class="small-box bg-danger">
										<div class="inner">
											<h3>기타</h3>
											<p>공지게시판</p>
										</div>
										<div class="icon">
											<i class="fa fa-list-alt"></i>
										</div>
										<a href="notice_list.do" class="small-box-footer">공지게시판보기<i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
								<!-- ./col -->
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="card-header">
											<h5 class="card-title">예약현황표</h5>

											<div class="card-tools">
												<button type="button" class="btn btn-tool"
													data-widget="collapse">
													<i class="fa fa-minus"></i>
												</button>
												<div class="btn-group">
													<button type="button" class="btn btn-tool dropdown-toggle"
														data-toggle="dropdown">
														<i class="fa fa-wrench"></i>
													</button>
													<div class="dropdown-menu dropdown-menu-right" role="menu">
														<a href="#" class="dropdown-item">Action</a> <a href="#"
															class="dropdown-item">Another action</a> <a href="#"
															class="dropdown-item">Something else here</a> <a
															class="dropdown-divider"></a> <a href="#"
															class="dropdown-item">Separated link</a>
													</div>
												</div>
												<button type="button" class="btn btn-tool"
													data-widget="remove">
													<i class="fa fa-times"></i>
												</button>
											</div>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<div class="row">
												<div class="col-md-8">
													<p class="text-center">
														<strong>공연 예약현황</strong>
													</p>

													<div class="chart">
														<!-- Sales Chart Canvas -->
														<canvas id="myChart" height="180" style="height: 180px;"></canvas>
													</div>
													<script type="text/javascript">
													//tooltip
													$('[data-toggle="tooltip"]').tooltip();
													
													
													//데이터 배열 설정
													var chartLabels = [];
													var chartData1 = []; //남은좌석수
													var chartData2 = []; //전체좌석수
													var chartDatatotal = [];

													//차트만들기 - 데이터값넣기
											
													function createChart() {
														//퍼센트로 나타내기 위해 계산해서 저장함
														for (var i = 0; i < chartData1.length; i++) {
															chartDatatotal[i]=(chartData1[i]/chartData2[i])*100;
															//alert(Math.round(chartDatatotal[i]));
														}
														
														var ctx = document.getElementById("myChart").getContext("2d");
														var myChart = new Chart(ctx, {
														    type: 'polarArea',
														    data: {
														        labels:chartLabels,
														        datasets: [{
														            label: '# of Votes',
														            data: chartDatatotal,
														            backgroundColor: [
														                'rgba(255, 99, 132, 0.2)',
														                'rgba(54, 162, 235, 0.2)',
														                'rgba(255, 206, 86, 0.2)'
														               
														            ],
														            borderColor: [
														                'rgba(255,99,132,1)',
														                'rgba(54, 162, 235, 1)',
														                'rgba(255, 206, 86, 1)'
														                
														            ],
														            borderWidth: 1
														        }]
														    },
														    options: {
														        responsive: true,
														        scale: {
														          reverse: false,
														          ticks: {
														            min: 0,
														            stepSize: 20,
														            max: 100
														          },
														        }
														      }
														
													});
													}
													try {
													    $.ajax({
													        type : 'POST',
													        url :"ajax_reservationchat.do" ,
													        dataType : 'json',
													        data : {
													            showid : 'chart',
													            subcmd : 'line',
													            showid : 1
													        },
													        success : function(result) {
													 			$.each(result, function(idx, val) {
													 				console.log(idx + " " + val.seatcount);
													 				chartLabels.push(val.show_id_name);
													                chartData1.push(val.seatsumcount);
													                chartData2.push(val.seatcount);
													 			});
													 
													            createChart();
													 
													        },
													        error : function(XMLHttpRequest, textStatus, errorThrown) {
													            alert('There is an error : method(group)에 에러가 있습니다.');
													        }
													    });
													 
													} catch (e) {
													    alert(e);
													}

													</script>
													<!-- /.chart-responsive -->

												</div>
												<!-- /.col -->
												<div class="col-md-4">
												<table id="noticetable" class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>순번</th>
													</tr>
												</thead>
												<tbody id="datatable">
													<c:forEach items="${list}" var="vo" varStatus="result">
														<tr>
															<td>
															
																${vo.title}/${vo.show_id_name}<span class="float-right">
																<b>${vo.seatsumcount}</b>/${vo.seatcount}</span>
																<div class="progress progress-sm">
	
																<c:set var="count" value="${(vo.seatsumcount/vo.seatcount)*100}"></c:set>
																<div class="progress-bar bg-primary" style="width: ${count}%"
																data-toggle="tooltip" data-placement="top" title="${vo.title}/${count}%"></div>
															</div>
															
															</td>
															
														</tr>
													</c:forEach>
												</tbody>
	
												</table>
													
												</div>
												
											
												<script type="text/javascript">
												$(function () {
												    $('#myTable').DataTable();
												});
												</script>
												
												<!-- /.col -->
											</div>
											<!-- /.row -->
										</div>
										<!-- ./card-body -->
										<!-- <div class="card-footer">
											<div class="row">
												<div class="col-sm-3 col-6">
													<div class="description-block border-right">
														<span class="description-percentage text-success"><i
															class="fa fa-caret-up"></i> 17%</span>
														<h5 class="description-header">$35,210.43</h5>
														<span class="description-text">TOTAL REVENUE</span>
													</div>
													/.description-block
												</div>
												/.col
												<div class="col-sm-3 col-6">
													<div class="description-block border-right">
														<span class="description-percentage text-warning"><i
															class="fa fa-caret-left"></i> 0%</span>
														<h5 class="description-header">$10,390.90</h5>
														<span class="description-text">TOTAL COST</span>
													</div>
													/.description-block
												</div>
												/.col
												<div class="col-sm-3 col-6">
													<div class="description-block border-right">
														<span class="description-percentage text-success"><i
															class="fa fa-caret-up"></i> 20%</span>
														<h5 class="description-header">$24,813.53</h5>
														<span class="description-text">TOTAL PROFIT</span>
													</div>
													/.description-block
												</div>
												/.col
												<div class="col-sm-3 col-6">
													<div class="description-block">
														<span class="description-percentage text-danger"><i
															class="fa fa-caret-down"></i> 18%</span>
														<h5 class="description-header">1200</h5>
														<span class="description-text">GOAL COMPLETIONS</span>
													</div>
													/.description-block
												</div>
											</div>
											/.row
										</div> -->
										<!-- /.card-footer -->
									</div>
									<!-- /.card -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
					</section>
				</div>
			</div>


			<!-- /.Left col -->
			<!-- right col (We are only adding the ID to make the widgets sortable)-->


			<!-- <section class="col-lg-5 connectedSortable">

									<div class="card direct-chat direct-chat-primary">
										<div class="card-header">
											<h3 class="card-title">Direct Chat</h3>

											<div class="card-tools">
												<button type="button" class="btn btn-tool"
													data-widget="collapse">
													<i class="fa fa-minus"></i>
												</button>
												<button type="button" class="btn btn-tool"
													data-widget="remove">
													<i class="fa fa-times"></i>
												</button>
											</div>
										</div>

												Message. Default to the left
												<div class="direct-chat-msg">
													<div class="direct-chat-info clearfix">
														<span class="direct-chat-name float-left">Alexander
															Pierce</span> <span class="direct-chat-timestamp float-right">23
															Jan 5:37 pm</span>
													</div>
													/.direct-chat-info
													<img class="direct-chat-img"
														src="dist/img/user1-128x128.jpg" alt="message user image">
													/.direct-chat-img
													<div class="direct-chat-text">Working with AdminLTE
														on a great new app! Wanna join?</div>
													/.direct-chat-text
												</div>
												/.direct-chat-msg

										/.card-header
										<div class="card-body">
											Conversations are loaded here
											<div class="direct-chat-messages chatmessage">

													채팅입력부분

											</div>
											/.direct-chat-messages

											</div>
											/.card-body
											<div class="card-footer">
												<form action="#" method="post">
													<div class="input-group">
														<input type="text" name="message" id="message"
															placeholder="Type Message ..." class="form-control">
														<span class="input-group-append">
															<button type="button" class="btn btn-primary charSend">Send</button>
														</span>
													</div>
												</form>
											</div>
											/.card-footer
										</div></div>
										/.direct-chat
								</section>
								/.content -->


			<jsp:include page="adminfooter.jsp"></jsp:include>
			<!-- ./wrapper -->
		</c:otherwise>
	</c:choose>
<!-- DataTables -->
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<script src="resources/js_jsp/baselist.js"></script>
</body>

</html>
