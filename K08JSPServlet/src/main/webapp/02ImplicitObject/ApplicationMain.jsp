<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - application</title>
</head>
<body>
	<h2>web.xml에 설정한 내용 읽어오기</h2>
	<!-- <context-param>으로 설정한 값을 내장객체를 통해 읽어옴 -->
	초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM")%>
	
	
	<!-- 
	이클립스에서는 직접 작성한 파일이 아닌 metadata폴더의 하위에
	프로젝트와 동일한 환경을 만들어 복사본파일이 실행됨
	그래서 물리적경로가 다름
	 -->
	<h2>서버의 물리적 경로 얻어오기</h2>
	application 내장 객체 : <%= application.getRealPath("/02ImplicitObject")%>
	
	<h2>선언부에서 application 내장 객체 사용하기</h2>
	<%!
		/*
		선언부에서 내장객체를 바로 사용할수 없음 
		내장객체는 _jspService() 메서드내에생성된 지역변수라서
		선언부에서 사용시 매개변수로 전달받아야함
		*/
		public String useImplicitObject(){
		//getServletContext() 메서드를 통해선언부에서 application내장객체 얻어오기
			return this.getServletContext().getRealPath("/02ImplicitObject");
		}
	
		public String useImplicitObject(ServletContext app){
			//스크립트렛에서 메서드 호출시 application내장객체를 매개변수로 전달
			return app.getRealPath("/02ImplicitObject");
		}
		
	%>
	
	<ul>
		<li>this사용 : <%= useImplicitObject()%></li>
		<li>내장 객체를 인수로 전달 : <%= useImplicitObject(application)%></li>
	</ul>
</body>
</html>