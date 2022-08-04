<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="UTF-8">
  <title>Login/Logout animation concept</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
  
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'>
  <link rel="stylesheet" href="resources/css/adminlogin.css?ver=4">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">

<script src="resources/js/jquery-3.2.1.js"></script>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.slides.js"></script>
<script src="resources/js/holder.min.js"></script>

<script src="resources/js/sweetalert2.min.js"></script>


<link rel="stylesheet" href="resources/css/sweetalert2.min.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  
</head>

<body>

  <div class="log-form">
  <h2>관리자페이지 로그인</h2>
   <form action="adminlogin.do" method="post">
      <input type="text" class="login__input name" name="admin_id" placeholder="Username"/>
    <input type="password" class="login__input pass" name="admin_pw" placeholder="Password"/>
    <button type="submit" class="btn">Login</button>
  </form>
</div><!--end log form -->


</body>

</html>
