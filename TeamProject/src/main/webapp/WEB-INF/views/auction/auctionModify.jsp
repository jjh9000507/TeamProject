<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
    
<script>
$(function(){
	/*
	이미지x 버튼을 누르지 않고 파일만 추가하고 취소버튼을 눌렀을 때
	이미지x 버튼을 누르지 않고 파일만 추가 후 수정버튼을 눌렀을 때
	이미지x 버튼을 누르고 취소버튼를 눌렀을 때
	이미지x 버튼을 누르고 수정버튼을 눌렀을 때
	이미지x 버튼을 누르고 파일 추가 후 취소버튼을 눌렀을 때
	이미지x 버튼을 누르고 파일 추가 후 수정버튼을 눌럿을 때
	-> 파일은 실시간으로 바로바로 지우고 삽입한다, 수정버튼을 눌렀을 땐 이미지 삭제든 추가든 아무런 조치가 없다
	*/
	
	//x버튼을 눌러 삭제시
	$("#uploadList").on("click",".a_times", function(){
		alert("dsf");
		var that = $(this);
		var fileAllName = that.next().attr("value");
		var p_no = $("#p_no").val();
		console.log(fileAllName)
		alert("fileAllName:"+fileAllName);
		
		var sendData = {
			"fileAllName" : fileAllName,
			"p_no" : p_no
		};
		
		var url="/auction/ModifyDelImg";
		/*한꺼번에
		S3에서 파일 삭제
		DB에서 파일 삭제
		폴더에서 파일 삭제*/
		
		$.get(url, sendData, function(result){
			if(result=="success"){
				that.parent().remove();
				alert("해당 파일 삭제함");
			}
		});
	});//a_times
	
	//이미지 추가 했을 때
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});//fileDrop	

	$("#fileDrop").on("drop", function(e) {
		e.preventDefault();
		
		$("#lblFileNameCheckError").hide();
		
		//var nextPNO = $(this).attr("data-nextPNO"); 수정은 nextPNO필요없다
	
		var file = e.originalEvent.dataTransfer.files[0]; //드래그한 파일에 대한 객체 정보를 가지고 있다
		//html의 form객체를 만들어서 여기에 이미지를 추가해서 통째로 ajax로 넘긴다

		var formData = new FormData();
		formData.append("file", file);
		var p_no = $("#p_no").val();
		//alert("p_no:"+p_no);
		
		//var url = "/furniture/uploadAjax/"+p_no;//pno에 해당하는 폴더 만든다
		var url = "/auction/ModifyAddImg/"+p_no;
				
		$.ajax({
			"processData" : false,
			"contentType" : false,
			"method" : "post",
			"url" : url,
			"data" : formData,
			"success" : function(data) {
				
				if(data != "false"){//이미지 파일이면 실행
					console.log("fileDrop에서 data:"+data)
					var divUploaded = $("#uploadList").prev().clone();
					var img = divUploaded.find("img");
					img.attr("src","/furniture/displayImage?imageName=" + data);
					
					var radio = divUploaded.find("input[name='radioMainImg']");
					radio.attr("value",data);
					
					$("#uploadList").append(divUploaded);
					divUploaded.show();
				}else{//이미지 파일이 아니면 에러메세지보여주기
					$("#lblFileNameCheckError").show();
				}
			}
		});//ajax

	});//fileDrop

	
});//function

</script>

${auctionSellVo}
<div class="container-fluid">
<div class="row">
	<div class="col-md-12">
	<form role="form" name="writeForm" id="writeForm" action="/auction/auctionResister">    
	
	<input type='hidden' name='p_no' id='p_no' value='${auctionSellVo.p_no}'>
	
	<input type='hidden' name='e_year' id='e_year'>
	<input type='hidden' name='e_month' id='e_month'>
	<input type='hidden' name='e_day' id='e_day'>
	<input type='hidden' name='e_second' id='e_second'>
	
	<input type="hidden" name="zip" id="zip">
	<input type="hidden" name="road_address" id="road_address">
	<input type="hidden" name="jibun_address" id="jibun_address">
	
		<div class="form-group">
			<label for="p_title">상품명</label> <input
				type="text" class="form-control" id="p_title" name="p_title" value="${auctionSellVo.p_title}"/>
		</div>
		
		<div class="form-group">
			<label for="present_price">경매 금액</label> <input
				type="text" class="form-control" id="present_price" name="present_price" value="${auctionSellVo.present_price}"/>
		</div>
		
		<div class="form-group">
			<label for="instant_price">즉구가</label> <input
				type="text" class="form-control" id="instant_price" name="instant_price" value="${auctionSellVo.instant_price}"/>
		</div>
		
		<div class="form-group">
			<label for="p_content">상품설명</label> 
			<textarea class="form-control" id="p_content" name="p_content">${auctionSellVo.p_content}</textarea>
		</div>
		
		<!-- 마감일 입력 -->
		<label for="datetimepicker1">경매기한</label>
		<!-- -------------------- 달력 입력 시작 ------------------------------------- -->
		
		<input type="text" id="txtDatePicker">
		시간:<input type="text" id="txtHour" name='e_hour' style="width:40px" value="${auctionSellVo.e_hour}">
		분:<input type="text" id="txtMinute" name='e_minute' style="width:40px" value="${auctionSellVo.e_minute}">

		
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
		
		<div id="uploadList">
		<c:forEach var="img" items="${imgModify}">
			<div class="divUploaded" style="float:left;">
			<!-- 추가한 그림 크기와 옆에 x추가 -->
			<img src="/furniture/displayImage?imageName=${img.img_name}" height="50px" width="50px" /> 
			<a href="#" class="a_times">&times;</a>
			<input type="radio" name="radioMainImg" id="radioMainImg" value="${img.img_name}">
		</div>
		</c:forEach>
		
		
		</div>
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