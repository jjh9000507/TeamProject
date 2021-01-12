<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
    
${auctionSellVo}
<div class="container-fluid">
<div class="row">
	<div class="col-md-12">
	<form role="form" name="writeForm" id="writeForm" action="/auction/auctionResister">    
	
	<input type='hidden' name='e_year' id='e_year'>
	<input type='hidden' name='e_month' id='e_month'>
	<input type='hidden' name='e_day' id='e_day'>
	<input type='hidden' name='e_second' id='e_second'>
	
	<input type="hidden" name="zip" id="zip">
	<input type="hidden" name="road_address" id="road_address">
	<input type="hidden" name="jibun_address" id="jibun_address">
	
	
		<div class="form-group">
			<label for="p_title"> 상품명 </label> <input
				type="text" class="form-control" id="p_title" name="p_title"/>
		</div>
		
		<div class="form-group">
			<label for="present_price"> 경매금액 </label> <input
				type="text" class="form-control" id="present_price" name="present_price"/>
		</div>
		
		<div class="form-group">
			<label for="instant_price"> 즉구가 </label> <input
				type="text" class="form-control" id="instant_price" name="instant_price"/>
		</div>
		
		<div class="form-group">
			<label for="p_content"> 상품설명 </label> 
			<textarea class="form-control" id="p_content" name="p_content"></textarea>
		</div>
		
		<!-- 마감일 입력 -->
	
		<label for="datetimepicker1">경매기한</label>
		<!-- -------------------- 달력 입력 시작 ------------------------------------- -->
		
		<input type="text" id="txtDatePicker">
		시간:<input type="text" id="txtHour" name='e_hour' style="width:40px">
		분:<input type="text" id="txtMinute" name='e_minute' style="width:40px">

		
		<!-- --------------------- 달력 입력 끝 ------------------------------------ -->
	
											
		<!-- 파일 추가 시작 -->
		<div>
			<label>첨부할 파일 드로그 하세요(메인 사진에 체크하세요)</label>
			<label id="lblFileNameCheckError" style="color:red;display:none">(이미지 파일만 추가하세요)</label>
			<div id="fileDrop" data-nextPNO="${nextPNO}"></div>
			<!-- 여기에 파일을 드래그 드롭 -->
		</div>
		
		<div class="divUploaded" style="display: none;float:left;">
			<!-- 추가한 그림 크기와 옆에 x추가 -->
			<img height="50px" width="50px" /> <a href="#" class="a_times">&times;</a>
			<input type="radio" name="radioMainImg" id="radioMainImg">
		</div>
		
		<div id="uploadList"></div>
		<!-- 파일 추가 끝 -->
		
		<br clear="left">
		<br>
		<div>
			<label>직구를 원하시면 주소를 입력하세요</label>
		<br>
			
		<!-- 주소 찾기 시작 -->
		우편번호:<span id="spanZip"></span><a href="#" id="addrFindAuction"><img src="../resources/image/addrFind.png"></a><br/>
		<span id="spanRoadAddr"></span><br>
		<span id="spanjibundAddr"></span><br>
		<input type="text" placeholder="상세주소를 입력하세요" id="txtjibundAddrDetail" name="detail_address"/>
		
		<!-- 주소 찾기 끝-->
		</div>
		
		<br>
		<button type="button" class="btn form-control btn-warning" id="btnSubmit">등록</button>
	</form>
	</div>
</div>
</div>