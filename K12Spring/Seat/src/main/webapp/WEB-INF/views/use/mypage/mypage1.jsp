<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="">

<link rel="apple-touch-icon" sizes="76x76"
	href="http://ijuju88.cdn3.cafe24.com/img/home.gif">
<link rel="icon" type="image/png" href="resources/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ijujutest</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/now-ui-kit.css?ver=3" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="resources/css/demo.css" rel="stylesheet" />

<link rel="stylesheet" href="resources/home.css">

<!-- glide -->
<link rel="stylesheet" href="resources/css/glide.core.min.css">
<link rel="stylesheet" href="resources/css/glide.theme.min.css">
<link rel="stylesheet" href="resources/s.css">

<script src="resources/js/jquery-3.2.1.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/popper.min.js" type="text/javascript"></script>

<!-- Bootstrap js -->
<script src="resources/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<script>
	$(function() {
		$("#tables").DataTable();
		//결제창가기
		$(".step3") .click( function() {
			var show_no = $(this).attr("show_no");
			var ssr_no = $(this).attr("ssr_no");

			var checkBtn = $(this);

			var tr = checkBtn.parent().parent();
			var td = tr.children();

			console.log("클릭한 Row의 모든 데이터 : " + tr.text());

			var showno = Number(td.eq(1).text());
			var ssrno =  parseInt(td.eq(0).text());


			window.open(
			'homepayseat3.do?show_no='+ showno + '&ssr_no='+ ssrno,
			'_blank',
			'width=800, height=755, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no');
		});
		$(".deleteseat") .click( function() {
		
			var show_no = $(this).attr("show_no");
			var ssr_no = $(this).attr("ssr_no");
			
			var Btn = $(this);

			var tr = Btn.parent().parent();
			var td = tr.children();

			console.log("클릭한 Row의 모든 데이터 : " + tr.text());

			var showno = Number(td.eq(1).text());
			var ssrno =  parseInt(td.eq(0).text());
			
			const swalWithBootstrapButtons = swal.mixin({
				  confirmButtonClass: 'btn btn-success',
				  cancelButtonClass: 'btn btn-danger',
				  buttonsStyling: false,
				})

				swalWithBootstrapButtons({
				  title: '정말 취소하시겠습니까?',
				  text: "이전으로 돌아가면 예약이 취소됩니다.",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonText: 'Yes!',
				  cancelButtonText: 'No!',
				  reverseButtons: true
				}).then((result) => {
					
        		 if (result.value) {
        			 $.ajax({
                         type: "GET",
                         url: "homeshowseatdel.do?ssr_no="+ssrno+"&show_no="+showno,
                         success: function(data) {
                        	window.location.reload();
                         },
                         error: function() {
                             alert('Error occured');
                         }
                     })
                     
                   swal( '취소완료되었습니다' )
	 
				  }
				})
			
		});

	});
	
</script>
</head>

<body>

	<jsp:include page="../home/hometitle.jsp"></jsp:include>

	<jsp:include page="homemypage1.jsp"></jsp:include>

	<jsp:include page="../home/homefooter.jsp"></jsp:include>
	<script src="resources/js/sweetalert2.min.js"></script>

	<!-- DataTables -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

	<script type="text/javascript" src="resources/js/printThis.js"></script>

	<script src="resources/js/jquery-barcode.js"></script>
	<link rel="stylesheet" href="resources/mypage1.css?ver=2">
	<script>
	$(document).ready(function() { 
		
		//티켓출력하기 클릭시
		$(".print").click(function() {
			$(".demo").empty();
			var show_no = $(this).attr("show_no");
			var ssr_no = $(this).attr("ssr_no");

			var checkBtn = $(this);

			var tr = checkBtn.parent().parent();
			var td = tr.children();

			console.log("클릭한 Row의 모든 데이터 : " + tr.text());

			var showno = Number(td.eq(1).text());
			var ssrno =  parseInt(td.eq(0).text());
			var showtitle =  td.eq(2).text();
			var ssrseat =  td.eq(3).text();
			
			//시작일나누기
			var startdate=td.eq(6).text().split('-'); //시작날짜 나누기
			var startdateday=startdate[2].substr(0,2);//일만따로나오게하기
			var startdatetime=startdate[2].substr(3,5);//시간만 나오게하기
			
			var str='<div class="containers">'
			+'<div class="item"'
			+'style="background-image:URL(http://ijuju88.cafe24.com/seat/homeimgtitle.do?show_no='+showno+'&idx=1);">'
			+'<div class="item-right">'
			+'<h2 class="num">'+startdateday+'</h2><p class="day" style="font-weight: bold;">'+startdate[1]+'</p>'
			+'</div> '
			+'<div class="item-left">'
			+'<h2 class="title">'+showtitle+'</h2>'
			+'<div class="sce">  <div class="icon">'
			+'<i class="fa fa-table"></i>  </div>'
			+'<p>'+startdate[0]+'년'+startdate[1]+'월'+startdateday+'일<br/> '+startdatetime+'</p></div>'
			+'<div class="fix"></div>'
			+'<div class="loc"> <div class="icon">'
			+'<i class="fa fa-map-marker"></i> </div>'
			+'<p>North,Soth, United State , Amre <br/> Party Number 16,20</p> </div>'
			+'<div class="fix"></div>'
			+'<div id="bcTarget"></div> </div>'
			+' </div> </div> </div>';
			$(".demo").append(str);

			$("#bcTarget").barcode( String(showno)+ssrseat.replace(/[^0-9]/g,''), 
			"code128",{barWidth:2, barHeight:30, bgColor:"rgba(255, 0, 0, 0.3);", showHRI:false});
	
			
		 	$(".demo").printThis({             
			      importCSS: true,           
			      base: '//' + document.location.host + '/seat/',
			      loadCSS: "resources/mypage1.css"    
			  });  
			}); 
		
		
	});
	</script>

</body>

</html>

