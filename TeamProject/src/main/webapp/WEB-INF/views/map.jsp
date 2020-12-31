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
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8io5mp0l3f"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&amp;submodules=panorama,geocoder,drawing,visualization"></script>
<script>
	$(function() {

		var map = new naver.maps.Map('map');
		//map.setMapTypeId(naver.maps.MapTypeId.HYBRID); //위성 지도 
		map.setCursor('pointer');
		//마커 생성
		var marker = new naver.maps.Marker({
			map : map
		});
		//클릭했을 때 마크이동
		naver.maps.Event.addListener(map, 'click', function(e) {
			marker.setPosition(e.coord);
			console.log(e.coord);
		});

		$("#goToTeam").click(function() {
			location.href = "/";
		})

		//좌표를 주소로 가져오기
		function searchCoordinateToAddress(lat, lng) {
			naver.maps.Service.reverseGeocode({
				location : new naver.maps.LatLng(lat, lng),
			}, function(status, response) { //비동기기 때문에 searchCoordinateToJibunAddress값만 리턴이 되고 이 함수 안에 값은 리턴이 안 된다
				if (status == naver.maps.Service.Status.ERROR) {
					return alert('Something wrong!');
				}

				var result = response.result, // 검색 결과의 컨테이너
				items = result.items; // 검색 결과의 배열

				if (items[0] != null) {
					$("#spandJibunAddress").text(items[0].address);
				} else {
					$("#spandJibunAddress").text("지번 주소 없음");
				}

				if (items[1] != null) {
					$("#spandRoadAddress").text(items[1].address);
				} else {
					$("#spandRoadAddress").text("도로 주소 없음");
				}

				var latlng = new naver.maps.LatLng(lat, lng); //경
				map.setCenter(latlng);
				map.setZoom(15);
				var marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(latlng),
					map : map
				});
			});
		}

		//주소로 좌표값 가져오기
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
					map : map
				});

			});
		}

		// 좌표 값 가져오기
// 		$("#btnCoordinate").click(function() {
// 			var value = $("#txtAddress").val();
			var data_Address = $("#address").attr("data-Address");
			searchAddressToCoordinate(data_Address);

// 		});
	});
	/* ==================================== 네이버 지도 소스 코드 끝 ======================================= */
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div id="map"
							style="width: 40%; top: 25%; left: 56%; height: 460px;"></div>
					</div>
					<div class="col-md-4">
						<br>
						<br>
						<br> 주소 입력:<input type="text" id="txtAddress"
							name="txtAddress"><br>
						<button type="button" id="btnCoordinate">검색한 주소로 이동</button>
						<br> 좌표 : <span id="spandCoordinate"></span><br> <br>
						<br>
						<input type="hidden" id="address" data-address="${roadAddress}"/>
						<button type="button" id="goToTeam">프로젝트로</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>