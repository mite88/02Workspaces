<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
 
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>책 검색 사이트</title>
</head>
 
<body>
 
    <input type="text" id="query">
    <button id="search">검색</button>
 
    <div></div>
 
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 
    <!-- <script>
    //여러개 https://4urdev.tistory.com/24
        $(document).ready(function () {
            var pageNum = 1;
            var totalpageNum = 0;
 
            $("#search").click(function () {
                $("div").html("");
 
                $.ajax({
                	async	: false, 
                    method: "GET",
                    url: "https://dapi.kakao.com/v2/local/search/keyword.json",
                    data: { query: $("#query").val(),  page: pageNum},
                    headers: {Authorization: "KakaoAK 03a7162be695e592cb6c49670b7bc93d"} // ########부분에 본인의 REST API 키를 넣어주세요.
 			
                })
                .done(function (msg) {
                	totalpageNum = msg.meta.pageable_count; //전체페이지수
                    console.log(msg.meta.pageable_count);
                    for (var i = 0; i < 10; i++){//948781290
                    	$("div").append("<h2><a href='"+ msg.documents[i].place_url +"'>" + msg.documents[i].place_name + "<br>"); 
                    	$("div").append("<strong>번호:</strong> " + msg.documents[i].phone + "<br>");
                    	$("div").append("<strong>url:</strong> " + msg.documents[i].place_url + "<br>");
                    	$("div").append("<strong>좌표:</strong> (" + msg.documents[i].x + ", "+msg.documents[i].y+")<br>");
                    }
                });
            })
 
            $(window).scroll(function(){  
 
                if ( Math.ceil($(window).scrollTop()) + $(window).height() >= $(document).height() ){
                    
                	if(pageNum < totalpageNum){
                		pageNum++;
                		 
                		 
                        $.ajax({
                        	async	: false, 
                            method: "GET",
                            url: "https://dapi.kakao.com/v2/local/search/keyword.json",
                            data: { query: $("#query").val(),  page: pageNum},
                            headers: {Authorization: "KakaoAK 03a7162be695e592cb6c49670b7bc93d"} // ########부분에 본인의 REST API 키를 넣어주세요.
                            
                        })
                        .done(function (msg) {
                            //console.log(msg);
                            for (var i = 0; i < 10; i++){
                            	$("div").append("<h2><a href='"+ msg.documents[i].place_url +"'>" + msg.documents[i].place_name + "<br>"); 
                    			$("div").append("<strong>번호:</strong> " + msg.documents[i].phone + "<br>");
                    			$("div").append("<strong>url:</strong> " + msg.documents[i].place_url + "<br>");
                    			$("div").append("<strong>좌표:</strong> (" + msg.documents[i].x + ", "+msg.documents[i].y+")<br>");
                            }
                        }).fail(function(xhr, textStatus, errorThrown) {
    						//console.log("!!!!");
                        });
                	}
                   
 
                }
                
            });
        })
 
        
    </script>-->
</body>
 <h2> 위지윅(WYSIWYG) 에디터</h2>
<li><a href="naverSmartEditor.do" target="_blank"> 네이버 스마트 에디터
</a></li>

</html>
