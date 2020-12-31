<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
    
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
   
    $(function(){

    	/*
    	//지도 옵션으로 생성
    	var map = new naver.maps.Map("map", {
    	    center: new naver.maps.LatLng(lat1),
    	    zoom: 12, //값이 클수록 확대
    	    mapTypeControl: true
    	});
    	//lat1의 위치에 마크 추가
		var marker = new naver.maps.Marker({            	   
			position: new naver.maps.LatLng(lat1),
			map: map   
		});
    	map.setZoom(12);
		//경도, 위도 만들기, lat위도 34, lng 경도 127
		var latlng = new naver.maps.LatLng(37.3595316, 127.1052133);
    	//배열에 담기 주소에 따라 마크 생성
		var points = [[36.3565081,127.1117463],[36.5543931,127.1078195],[36.9572927,127.1041619]];		
		var size = points.length;
		console.log("size:"+size);
		var markers = new Array(size);
		var lat = new Array(size);
		for(var i=0 ; i<points.length ; i++){
			lat[i] = new naver.maps.LatLng(points[i][0],points[i][1]);
			console.log("lat:"+lat);
			markers[i] = new naver.maps.Marker({            	   
				position: new naver.maps.LatLng(lat[i]),
				map: map   
			});
			console.log("markers[i]:"+markers[i]);
		}
		*/
    	
   		var map = new naver.maps.Map('map');
    	//map.setMapTypeId(naver.maps.MapTypeId.HYBRID); //위성 지도 
    	map.setCursor('pointer');
    	//마커 생성
    	var marker = new naver.maps.Marker({            	   
			map: map   
		});
    	//클릭했을 때 마크이동
    	naver.maps.Event.addListener(map, 'click', function(e) { 
            marker.setPosition(e.coord);
            console.log(e.coord);
		});
   
    	
    $("#goToTeam").click(function(){
    	location.href="/";
    })
  	 
    //좌표를 주소로 가져오기
    function searchCoordinateToAddress(lat, lng){    	    
    	naver.maps.Service.reverseGeocode({
            location: new naver.maps.LatLng(lat, lng),
        }, function(status, response) { //비동기기 때문에 searchCoordinateToJibunAddress값만 리턴이 되고 이 함수 안에 값은 리턴이 안 된다
            if (status == naver.maps.Service.Status.ERROR) {
                return alert('Something wrong!');
            }

            var result = response.result, // 검색 결과의 컨테이너
                items = result.items; // 검색 결과의 배열
         

            if(items[0] != null){
            	$("#spandJibunAddress").text(items[0].address);
            }else{
          	  	$("#spandJibunAddress").text("지번 주소 없음");
            }
                
           
          if(items[1] != null){
          		$("#spandRoadAddress").text(items[1].address);
          }else{
        	  $("#spandRoadAddress").text("도로 주소 없음");
          }
          	
          var latlng = new naver.maps.LatLng(lat, lng); //경
          map.setCenter(latlng);
          map.setZoom(15);
          var marker = new naver.maps.Marker({            	   
  			position: new naver.maps.LatLng(latlng),
  			map: map   
  			});
        });
    }
    
    //주소로 좌표값 가져오기
    function searchAddressToCoordinate(addr){   
    	﻿naver.maps.Service.fromAddrToCoord({ 
    		address: addr }, function(status, response) {
    	    if (status == naver.maps.Service.Status.ERROR) {
    	        return alert('Something wrong!');
    	    }

    	 	//﻿response.v2.addresses[0].jibunAddress
     		$("#spandCoordinate").text('경도:' + response.result.items[0].point.y + ', 위도:' + response.result.items[0].point.x);
    		
     		var latlng = new naver.maps.LatLng(response.result.items[0].point.y, response.result.items[0].point.x); //경
     		map.setCenter(latlng);
           	map.setZoom(15);
            var marker = new naver.maps.Marker({            	   
    			position: new naver.maps.LatLng(latlng),
    			map: map   
    			});
            
    		});
    	}
    
    $("#btnAddress").click(function(){
    	var lat = $("#txtLat").val();
    	var lng = $("#txtLng").val();
    	
    	searchCoordinateToAddress(lat,lng);
    	
    });
    
    $("#btnCoordinate").click(function(){
    	var value = $("#txtAddress").val();
    	
    	searchAddressToCoordinate(value);
    	
    });
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
				<div id="map" style="width:100%;height:800px;"></div>
				</div>
				<div class="col-md-4">
				<br><br><br>
				경도(ex:35.xx)입력<input type="text" id="txtLat"><br>
				위도(ex:129.xx)입력<input type="text" id="txtLng"><br>
				<button type="button" id="btnAddress">주소 값 가져오기</button><br>
				지번 주소 : <span id="spandJibunAddress"></span><br>
				도로 주소 : <span id="spandRoadAddress"></span><br><br><hr>
				
				주소 입력:<input type="text" id="txtAddress" name="txtAddress"><br>
				<button type="button" id="btnCoordinate">좌표 값 가져오기</button><br>
				좌표 : <span id="spandCoordinate"></span><br>
				<br><br>
				<button type="button" id="goToTeam">프로젝트로</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>