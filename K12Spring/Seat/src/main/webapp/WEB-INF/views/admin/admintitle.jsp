<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
  <title>관리자</title>
   <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/admin/plugins/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">  <!-- Theme style -->
  <link rel="stylesheet" href="resources/admin/dist/css/adminlte.min.css">

  <!-- Date Picker -->
  <link rel="stylesheet" href="resources/admin/plugins/datepicker/datepicker3.css">

  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  
  
</head>
<body class="hold-transition sidebar-mini">

<!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="admin.do" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="home.do" class="nav-link">사용자페이지</a>
      </li>
    </ul>

  </nav>
  <!-- /.navbar -->
  
  
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="admin.do" class="brand-link">
      <img src="http://ijuju88.cdn3.cafe24.com/img/mainhall1.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">관리자 페이지</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <!-- <div class="image">
          <img src="resources/admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div> -->
        <div class="info">
          <a href="#" class="d-block">${SID}님 환영합니다.</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fa fa-table"></i>
              <p>
                	관리
                <i class="fa fa-angle-left right"></i>
              </p>
            </a>
            
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="adminshowseat.do" class="nav-link">
                  <i class="fa fa-circle-o nav-icon"></i>
                  <p>공연관리</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="adminmember.do" class="nav-link">
                  <i class="fa fa-circle-o nav-icon"></i>
                  <p>회원관리</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="notice_list.do" class="nav-link">
                  <i class="fa fa-circle-o nav-icon"></i>
                  <p>공지사항</p>
                </a>
              </li>
              
               <li class="nav-item">
                <a href="home_questionlist.do" class="nav-link">
                  <i class="fa fa-circle-o nav-icon"></i>
                  <p>문의게시판답변하기</p>
                </a>
              </li>
              
            </ul>
            
          </li>
          
          
          <li class="nav-header">설정</li>
          
          <li class="nav-item">
            <a href="https://admin.iamport.kr/payments" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-warning"></i>
              <p>결제정보(아임포트)</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="adminlogout.do" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-danger"></i>
              <p class="text">로그아웃</p>
            </a>
          </li> 
         
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  
  
<script src="resources/js/holder.min.js"></script>

<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="resources/js/bootstrap.bundle.min.js"></script>

<!-- datepicker -->
<script src="resources/admin/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="resources/admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="resources/admin/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources/admin/dist/js/adminlte.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="resources/admin/dist/js/demo.js"></script>
</body>
</html>
  
