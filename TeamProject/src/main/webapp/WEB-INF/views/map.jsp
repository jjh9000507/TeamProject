<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ include file="include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5i2j41zq2n"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&amp;submodules=panorama,geocoder,drawing,visualization"></script>
<script>
	$(function() {

		$("#btnCoordinate").click(function() {
			modalTrigger();
		});
		
		//메인으로 돌아가기
		$("#goToTeam").click(function() {
			location.href = "/";
		});
		
		//맵 생성
		var map = new naver.maps.Map('map');
		//map.setMapTypeId(naver.maps.MapTypeId.HYBRID); //위성 지도 
		
		//검색한 주소로 좌표값 가져오기 (addr : 주소)
		function searchAddressToCoordinate(addr) {
			naver.maps.Service.fromAddrToCoord({
				address : addr
			}, function(status, response) {
				if (status == naver.maps.Service.Status.ERROR) {
					return alert('Something wrong!');
				}

				// 경도 위도 표시
				//﻿response.v2.addresses[0].jibunAddress
				$("#spandCoordinate").text(
						'경도:' + response.result.items[0].point.y + ', 위도:'
								+ response.result.items[0].point.x);

				var latlng = new naver.maps.LatLng(
						response.result.items[0].point.y,
						response.result.items[0].point.x); //경
				map.setCenter(latlng);
				map.setZoom(15);
				var marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(latlng),
					map : map,
					icon: {
					        url: '/resources/image/marker/home.png',     //50, 68 크기의 원본 이미지
					        size: new naver.maps.Size(25, 34),
					        scaledSize: new naver.maps.Size(25, 34),
					        origin: new naver.maps.Point(0, 0),
					        anchor: new naver.maps.Point(12, 34)
					}
				});

			});
		}
		
		//등록한 상품 주소의 좌표값 가져오기 (addr : 주소)
		function sellProductToAddress(addr) {
			naver.maps.Service.fromAddrToCoord({
				address : addr
			}, function(status, response) {
				if (status == naver.maps.Service.Status.ERROR) {
					return alert('Something wrong!');
				}

				// 경도 위도 표시
				//﻿response.v2.addresses[0].jibunAddress
// 				$("#spandCoordinate").text(
// 						'경도:' + response.result.items[0].point.y + ', 위도:'
// 								+ response.result.items[0].point.x);
			var y = response.result.items[0].point.y;
			var x = response.result.items[0].point.x;
			console.log(x);
			console.log(y);
			
				var latlng_sellProduct = new naver.maps.LatLng(
						response.result.items[0].point.y,
						response.result.items[0].point.x
				); 
				

				
				map.setCenter(latlng_sellProduct);
				map.setZoom(15);
				
				var marker_sellProduct = new naver.maps.Marker({
					position : new naver.maps.LatLng(latlng_sellProduct),
					map : map
					
				});

// 				console.log("latlng_sellProduct" + latlng_sellProduct);
				var MARKER_SPRITE_X_OFFSET = 29,
    				MARKER_SPRITE_Y_OFFSET = 50;

				var contentString = [];
				 contentString = {
					"A1" : [] ,
					"B1" : []
						
				};
// 				 등록된 상품 주소들
				 /* data_addr */

			for (var key in contentString) {
 				var infowindow = new naver.maps.InfoWindow({
		      		  content: '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ key +'"</b>.</div>'
				 });
			};
				
				naver.maps.Event.addListener(marker_sellProduct, "click", function(e) {
				    if (infowindow.getMap()) {
				        infowindow.close();
				    } else {
				        infowindow.open(map, marker_sellProduct);
				    }
				});	
	
				infowindow.open(map, marker_sellProduct);
				
			});
			
				
			
		} //등록한 상품 주소 마커 
		
		
		
		
		
			// 좌표 값 가져오기
			var data_Address = $("#address").attr("data-Address");
			searchAddressToCoordinate(data_Address);
			console.log("data_Address : " + data_Address); // 검색한 주소
			
			// 주소 값 가져와서 위도 경도로 변환
			$(".addr_list").each(function(){
			var data_addr = $(this).attr("data-addr"); //등록된 상품들 주소
			console.log("data_addr : " + data_addr);
			sellProductToAddress(data_addr);
			});
		
	});
	/* ==================================== 네이버 지도 소스 코드 끝 ======================================= */
</script>
</head>
<body>
<div class="col-md-2"></div>
<div class="col-md-8" style="padding-left: 20%;">
<%@ include file="include/header_mainCatagories.jsp"%>
</div>
<div class="col-md-2"></div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div style="position: absolute; left: 63%;">
						검색한 주소 : <input type="text" id="txtAddress" name="txtAddress" value="${roadAddress}">
						</div>
						<div id="map" style="width: 70%; top: 25%; left: 40%; height: 500px;"></div>
					</div>
					
					<div class="col-md-4">
						<br>
						<br>
						<button type="button" id="btnCoordinate">주소 재검색하기</button>
						<br>
						<input type="hidden" id="address" data-address="${roadAddress}"/>
						
							<c:forEach var="road_address" items="${addr_list}">
								<input type="hidden" class="addr_list" data-addr="${road_address.road_address}"/>
							</c:forEach>
						
						<button type="button" id="goToTeam">프로젝트로</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>