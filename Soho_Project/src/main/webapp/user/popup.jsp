<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/*#pop_2, #day_div{display:none;}*/
.popup_div table {
	background: #fff;
}

td {
	padding: 0;
	margin: 0;
}

.popup_div {
	z-index: 9999;
	background-color: #fff;
	width: 100%;
	min-width: 270px;
	max-width: 500px;
	text-align: center;
	position: absolute;
	left: 10px;
	top: 10px;
} /* 팝업DIV */
.popup_div td { /*border:3px solid #595959;*/
	padding-left: 0px;
	padding-right: 0px
} /* [3px - 테두리의 크기] [색상 - #595959] 수정가능 */
.popup_div thead td {
	height: auto;
}

.popup_div tbody td {
	height: auto;
}

.mainImg {
	width: 500px;
	min-width: 270px;
	height: 650px;
	overflow: hidden;
} /* 상단 큰 이미지 DIV */
.mainImg img {
	width: 500px;
	min-width: 270px;
	height: auto;
}

.mainContent {
	width: 1500px;
	height: 350px;
	left: 0px;
} /* 상단 큰 이미지를 감싸는 DIV */
td:first-child:nth-last-child(1) .menuImg {
	width: 100%;
}

td:first-child:nth-last-child(2) .menuImg, td:first-child:nth-last-child(2) .menuImg 
	~ td .menuImg {
	width: 100%
}

td:first-child:nth-last-child(3) .menuImg, td:first-child:nth-last-child(3) .menuImg 
	~ td .menuImg {
	width: 100%
}

.menuImg {
	height: 100px;
	overflow: hidden;
} /* 하단 작은이미지 DIV */
.menuImg img {
	height: auto;
	width: 100%;
}

/*#menuTd_1{border:3px solid orange;}*/ /* 하단메뉴에 먼저 표시될 TD의 BORDER*/
.popup_div tbody td {
	height: 80px;
}

.popup_div tbody td {
	margin: 0 -1px -1px 0;
	border: 1px solid #ddd;
	background: #eee;
	cursor: pointer;
	color: #999;
	font-size: 1rem;
	line-height: 1.25rem;
	text-align: center;
	transition: all .5s ease;
	-webkit-transition: all .5s ease;
}

/*#menuTd_1{ background: #fff; color: #333; font-weight: bold;}*/
.popup_div tbody td p {
	margin: 15px 10px;
}

.popup_div tbody td.popup_select {
	background: #fff;
	color: #333;
	font-weight: bold;
}

.xans-popup-footer>div {
	text-align: right;
	font-size: 12px;
	padding: 0px 5px;
	color: #ffffff;
	width: 502px;
	height: 35px;
	background-color: #313031;
}

@media all and (max-width:479px) {
	.popup_div {
		width: 270px;
		max-width: 270px;
		left: 0px;
		top: 0px;
	} /* 팝업DIV */
	.mainImg {
		width: 270px;
		max-width: 270px;
		height: 350px;
		overflow: hidden;
	} /* 상단 큰 이미지 DIV */
	.mainImg img {
		width: 270px;
		max-width: 270px;
		height: auto;
	}
	.mainContent {
		width: 810px;
		height: 230px;
		left: 0px;
	} /* 상단 큰 이미지를 감싸는 DIV */
	td:first-child:nth-last-child(1) .menuImg {
		width: 100%;
	}
	td:first-child:nth-last-child(2) .menuImg, td:first-child:nth-last-child(2) .menuImg 
		~ td .menuImg {
		width: 100%
	}
	td:first-child:nth-last-child(3) .menuImg, td:first-child:nth-last-child(3) .menuImg 
		~ td .menuImg {
		width: 100%
	}
	.popup_div tbody td {
		height: 70px;
		font-size: 0.825rem;
		line-height: 1rem;
	}
	.menuImg {
		height: 60px;
		overflow: hidden;
	} /* 하단 작은이미지 DIV */
	.menuImg img {
		height: auto;
		width: 100%;
	}
	.xans-popup-footer>div {
		width: 271px;
	}
}

/* 상단 큰 이미지를 2개의 DIV가 감싸는건 이미지 슬라이드 효과를 주기위해 position을 relative와absolute 주기위해..*/
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
</head>
<body>
	<div class="popup_div" onmouseover="">


		<table width="100%" cellspacing="3" cellpadding="0" border="0" id="pop_2">
			<thead>
				<tr>
					<td colspan="3">
						<div class="mainImg" style="position: relative;">
							<div class="mainContent">
								<!--<img src='여기에 메인에 들어갈 이미지 주소를 순서대로 넣어주세요' />-->
								<img src="https://placeimg.com/500/650/tech"><img src="https://placeimg.com/500/650/nature"><img src="https://placeimg.com/500/650/anu"> 
							</div>
						</div>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="menuTd_1" class="">
						<!--<img src='여기에 하단메뉴에 들어갈 첫번째이미지 주소를 순서대로 넣어주세요' />--> <!--div class='menuImg'><img src='/web/medi2021/popup/image_176.jpg' /></div-->
						<p>1</p>
					</td>
					<td id="menuTd_2" class="">
						<!--<img src='여기에 하단메뉴에 들어갈 두번째 이미지 주소를 순서대로 넣어주세요' />--> <!--div class='menuImg'><img src='/web/medi2021/popup/image_175.jpg' /></div-->
						<p>
							2
						</p>
					</td>

					<td id="menuTd_3">
						<!--<img src='여기에 하단메뉴에 들어갈 두번째 이미지 주소를 순서대로 넣어주세요' />--> <!--div class='menuImg'><img src='/web/medi2021/popup/image_175.jpg' /></div-->
						<p>
							3
						</p>
					</td>



				</tr>
			</tbody>
		</table>
		<div style="padding: 0px; margin: 0;"
			class="xans-element- xans-popup xans-popup-footer ">
			<div style="text-align: left; float: left; width: 70%;" id="day_div">
				<input type="checkbox" name="floating_banner" id="floating_banner">
				오늘 하루 그만보기
			</div>

			<div style="">
				<span id="popup_close_btn"
					style="cursor: pointer; margin-top: 5px !important; display: inline-block;"
					onclick="javascript:closeBanner();">닫기 X</span>
			</div>
		</div>

	</div>

	<script>
            
            // 쿠키 체크 
            var cook = $.cookie('notice'); 
            // 쿠키가 없으면 배너 노출 
            if (cook == "ok") { 
                $(".popup_div").hide(); 
            } else { 
                $(".popup_div").show(); 
            }
            
            // 닫기 버튼 클릭 
            function closeBanner() { 
               
               if ( $('#pop_2').css('display') === 'none' ) {
                     $('#pop_1').hide();
                    $('#pop_2').show();
                    $('#day_div').show();
                    
                } else { 
                    if ($("#floating_banner").is(":checked")) { 
                        $.cookie('notice', 'ok', { expires: 1, path: '/' }); 
                    } 
                    //$(".popup_div").hide();
                    $('.popup_div').remove();
                }
               
               //팝업창 닫을시 carousel이 멈치는 현상으로 인한 추가
                $('#carouselExampleDark').carousel("cycle");	
   
            }


			//팝업
              $('#menuTd_1').addClass("popup_select");
            
            var mainMenu = 1;
            var slideImg = setInterval("next_content()",5000);
            
            $( window ).resize( function() {
                 //console.log("!!" );
                 contentOver(mainMenu);
               
            } );

            $('#menuTd_1').mouseover(function() {contentOver(3);});
            $('#menuTd_2').mouseover(function() {contentOver(1);});
            $('#menuTd_3').mouseover(function() {contentOver(2);});
            
            //$('#menuTd_1').click(function() {contentOver(2);});
            //$('#menuTd_2').click(function() {contentOver(1);});

            function next_content(){
                if(mainMenu == 1) contentOver(1);
                else if(mainMenu == 2) contentOver(2);
                else if(mainMenu == 3) contentOver(3);
            }

            function contentOver(n){

                if(window.innerWidth<=479){
                    if(n == 1){$(".mainContent").stop().animate({"left": "-270"}, 800); mainMenu=2;}
                    else if(n == 2){$(".mainContent").stop().animate({"left": "-540"}, 800); mainMenu=3;}
                    else if(n == 3){$(".mainContent").stop().animate({"left": "0"}, 800); mainMenu=1;}
                    //if(n == 1){$(".mainContent").stop().animate({"left": "-270"}, 800); mainMenu=2;}
                    //else if(n == 2){$(".mainContent").stop().animate({"left": "0"}, 800); mainMenu=1;}
                }else{

                    if(n == 1){$(".mainContent").stop().animate({"left": "-500"}, 800); mainMenu=2;}
                    else if(n == 2){$(".mainContent").stop().animate({"left": "-1000"}, 800); mainMenu=3;}
                    else if(n == 3){$(".mainContent").stop().animate({"left": "0"}, 800); mainMenu=1;}
                    
                    
                    //if(n == 1){$(".mainContent").stop().animate({"left": "-500"}, 800); mainMenu=2;}
                    //else if(n == 2){$(".mainContent").stop().animate({"left": "0"}, 800); mainMenu=1;}
                }

                /*$('#menuTd_1').css("border","3px solid #595959");
                $('#menuTd_2').css("border","3px solid #595959");
                $('#menuTd_3').css("border","3px solid #595959");
                $('#menuTd_'+mainMenu).css("border","3px solid orange");*/
                
                $('#menuTd_'+mainMenu).addClass("popup_select");
                $(".popup_div tbody td").not('#menuTd_'+mainMenu).removeClass("popup_select");
                

                clearInterval(slideImg);
                slideImg = setInterval("next_content()",5000);
            }


            $(window).on("load", function(){
                setTimeout(function() {
                    $(".mainImg").css({ 'position': 'relative' });
                    $(".mainContent").css({ 'position': 'absolute' })
                },1000);
            });  

        </script>
</body>
</html>
