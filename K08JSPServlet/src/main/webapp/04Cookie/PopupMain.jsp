<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String popupMode = "on"; 

Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        String cookieName = c.getName();
        String cookieValue = c.getValue();
        if (cookieName.equals("PopupClose")) {
            popupMode = cookieValue; 
        }
    }
} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>
<style>
    div#popup{
        position: absolute; top:100px; left:100px; color:yellow;  
        width:300px; height:100px; background-color:gray;
    }
    div#popup>div{
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function() {
	//닫기 버튼 클릭시
    $('#closeBtn').click(function() {
        $('#popup').hide(); //팝업창 숨김
        //하루동안 열지 않음 체크박세에 체크된 경우만 value 얻음
        var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
        
        //ajax 요청
        $.ajax({
            url : './PopupCookie.jsp',
            type : 'get', //전송방식
            data : {inactiveToday : chkVal},//파라미터값
            dataType : "text", //콜백데이터 형식
            success : function(resData) {
            	//성공시 콜백함수
            	if(resData){
            		console.log('있다');
            	}
            	else{
            		console.log('없다');	
            	}
            	//콜백데이터 존재시 새로고침함
                if (resData != '') location.reload();
            }
        });
    });
});
</script>
</head>
<body>
<h2>팝업 메인 페이지</h2>
<%
    //단순 텍스트출력
	for (int i = 1; i <= 10; i++) {
        out.println("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
    }
    if (popupMode.equals("on")) {
%>
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right"><form name="popFrm">
            <input type="checkbox" id="inactiveToday" value="1" />
            하루 동안 열지 않음
            <input type="button" value="닫기" id="closeBtn" />
        </form></div>
    </div>
<%
    }
%>
</body>
</html>

