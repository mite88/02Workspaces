<%--
/**
 * 1. 프로젝트명 : location.jsp
 * 2. 작성일 : 2022. 6. 21. 오후 2:43:14
 * 3. 작성자 : mite88
 * 4. 설명 : 지점찾기
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 21.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title_name}</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                <h4 class="section-title">${title_name}</h4>
                <h1 class="display-5 mb-4">We Focused On Modern Architecture And Interior Design</h1>
            </div>
            <div class="row g-4">
            	<div class="col-xl-4 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                  <!-- list -->
					<table id="addr_table">
					
					 <c:forEach items='${offlice_list }' var="row" varStatus="loop">
						
			            <tr>
							<td class="name">${row.o_name }</td>
							<td class="addr">${row.o_addr}</td>
							
							<td class="btn_url"> <a href="https://map.kakao.com/?eName=${row.o_addr}" target="_blank">길찾기</a></td>
			                <td class="content d-none">
			                	<div class="info">
									<div class="row">
									
										<div class="col-md-12">
											<img alt="office_img1"  class="img-fluid" src="<%=request.getContextPath()%>/Uploads/office/${row.o_img1}">
										</div>
									
										
										<div class="desc col-md-12">
											
											<div class="titles">
												<a href="https://false9.iwinv.net/bbs/board.php?bo_table=mapV2&amp;wr_id=39">${row.o_name }</a>
											</div>
											<div class="sub1">${row.o_addr }</div>
											<div class="sub2">
												<a href="https://map.kakao.com/?eName=${row.o_addr}" target="_blank">길찾기</a>
											</div>
										</div>
									</div>
								</div>

							</td>
			            </tr>
			            
					</c:forEach>
					
						
					</table>
					
				</div>
                <div class="col-xl-8 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                  <!-- map -->
					<div id="map" style="width:100%;height:600px;"></div>
				</div>
            </div>
        </div>
    </div>
    
    
	<!-- footer -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
	
	<!-- kakao API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1719acb269a938b6750fa57d8a6c11cb&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		        
		        // 마커를 표시합니다
		        displayMarker(locPosition);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);    
		    // 마커를 표시합니다    
		    displayMarker(locPosition);
		}

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		$('td.addr').click(function() {
			// 지도를 생성합니다    

			//같은 줄 설명 text 만들기
			var trNum = $(this).closest('tr').prevAll().length;

			var rows = document.getElementById("addr_table").getElementsByTagName("tr");
			var cells = rows[trNum].getElementsByTagName("td");
			//alert(trNum);

			var content_text = cells[2].childNodes[1].innerHTML;
			console.log(content_text);

			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch($(this).text(), function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        // 추출한 좌표를 통해 도로명 주소 추출
			        let lat = result[0].y;
			        let lng = result[0].x;
			        getAddr(lat,lng);
			        function getAddr(lat,lng){
			            let geocoder = new kakao.maps.services.Geocoder();
		
			            let coord = new kakao.maps.LatLng(lat, lng);
			            let callback = function(result, status) {
			                if (status === kakao.maps.services.Status.OK) {
			                	// 추출한 도로명 주소를 해당 input의 value값으로 적용
			                    $(this).text(result[0].road_address.address_name);
			                }
			            }
			            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			        }
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

					console.log(content_text);
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
	                    
			            content: '<div class="p-1" style="width:230px;text-align:center;">'+content_text+'</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});  
	    });
		
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(locPosition) {

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}    


		$('#searchBtn').click(function(){
			// 버튼을 click했을때
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch($('#address').val(), function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        // 추출한 좌표를 통해 도로명 주소 추출
			        let lat = result[0].y;
			        let lng = result[0].x;
			        getAddr(lat,lng);
			        function getAddr(lat,lng){
			            let geocoder = new kakao.maps.services.Geocoder();
		
			            let coord = new kakao.maps.LatLng(lat, lng);
			            let callback = function(result, status) {
			                if (status === kakao.maps.services.Status.OK) {
			                	// 추출한 도로명 주소를 해당 input의 value값으로 적용
			                    $('#address').val(result[0].road_address.address_name);
			                }
			            }
			            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			        }
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});  
			
		});
		  
		</script>
	</body>
</html>