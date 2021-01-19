<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); //도로명 주소
	String engAddr = request.getParameter("engAddr"); //영어 주소
	String jibunAddr = request.getParameter("jibunAddr"); //지번 주소
	String zipNo = request.getParameter("zipNo"); //우편번호
	String addrDetail = request.getParameter("addrDetail"); //사용자가 직접 입력
%>

<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ include file="../include/header.jsp"%>

<!-- 달력 스타일시트 시작-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css"/>
<!-- 달력 스타일시트 끝-->
<link rel="stylesheet" href="/resources/css/sidebar.css" />

<!-- 달력 스크립트 추가-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
<!-- 달력 스크립트 끝--> 
<script type="text/javascript" src="/resources/js/auctionJS.js" charset="UTF-8"></script>


<style>
#fileDrop {
	width: 80%;
	height: 100px;
	background-color: white;
	border: 4px dashed #c8d7ff;
	}
	
.tablePurchase{
	margin-bottom: 24px;
	width: 800px; 
	height: 150px;
}

.tdPurchase{
	border-right-width: 3px;
	width: 300px;
	font-family: verdana;
	font-size:14px;
    padding-left: 17px;
	
}

.tabTitle{
	font-family: verdana;
	font-size:16px;
/* 	text-shadow: 1px 1px 1px rgba(0,0,0,0.2); */
}

.tabMd3{
	padding:20px;
}

.card-title{
	text-align: center;
    font-size: 16px;
    font-weight: 700;
   	font-family: verdana;
    vertical-align: middle;
    margin:30px;
}

.card-text{
	font-family: verdana;
	font-size:14px;
}

input[type=text]{
	text-align:center;
	border-left-width:0;
	border-right-width:0;
	border-top-width:0;
	border-bottom-width:1;
}
</style>

<!-- 입력 값
P_NO 시퀀스로 자동 증가
SELLER 로그인 했을 때 가지고 온다
P_TITLE-text
p_CONTENT-text
PRESENT_PRICE-text
INSTANT_PRICE-text
PURCHASER null
SOLD_PRICE null
SELL_STATUS null

ADDRESS - table 따로 
	zip-hidden;
	road_address-hidden;
	jibun_address-hidden;
	detail_address-text;

IMG - table 따로
	IMG_NO-시퀀스 자동
	images-hidden images[i]
	img_name-controller에서 처리
	main_img_status-안쓴다 그냥 디폴트 0
	P_NO-controller에서 처리


MainImg - table따로
	main_img_no-시퀀스 자동
	main_img_name-hidden
	p_no-controller에서 처리

R_NO
R_YEAR-controller에서 처리
R_MONTH-controller에서 처리
R_DAY-controller에서 처리
R_HOUR-controller에서 처리
R_MINUTE-controller에서 처리
P_NO

E_NO
E_YEAR-hidden
E_MONTH-hidden
E_DAY-hidden
E_HOUR-text
E_MINUTE-text
P_NO
-->
<script>
$(function() {

	/*
	var IMP = window.IMP; 
	IMP.init('imp18735883');
	*/
	
	$("#bidingItem").click(function() {//tab1클릭시
		$("#bidingItemContent").show();
		$("#bidingFinishItemContent").hide();
		$("#soldItemContent").hide();
		$("#purchaseBidingItemContent").hide();
		$("#purchaseItemContent").hide()
		$("#registerItemContent").hide();
	});
	
	$("#bidingFinishItem").click(function() {//tab2클릭시
		$("#bidingItemContent").hide();
		$("#bidingFinishItemContent").show();
		$("#soldItemContent").hide();
		$("#purchaseBidingItemContent").hide();
		$("#purchaseItemContent").hide()
		$("#registerItemContent").hide();
	});

	$("#soldItem").click(function() {//tab3클릭시
		$("#bidingItemContent").hide();
		$("#bidingFinishItemContent").hide();
		$("#soldItemContent").show();
		$("#purchaseBidingItemContent").hide();
		$("#purchaseItemContent").hide()
		$("#registerItemContent").hide();
	});
	
	$("#purchaseBidingItem").click(function(){
		$("#bidingItemContent").hide();
		$("#bidingFinishItemContent").hide();
		$("#soldItemContent").hide();
		$("#purchaseBidingItemContent").show();
		$("#purchaseItemContent").hide()
		$("#registerItemContent").hide();
	});
	
	$("#purchaseItem").click(function() {//tab4클릭시
		$("#bidingItemContent").hide();
		$("#bidingFinishItemContent").hide();
		$("#soldItemContent").hide();
		$("#purchaseBidingItemContent").hide();
		$("#purchaseItemContent").show()
		$("#registerItemContent").hide();
	})
	
	$("#registerItem").click(function() {//tab5클릭시
		$("#bidingItemContent").hide();
		$("#bidingFinishItemContent").hide();
		$("#soldItemContent").hide();
		$("#purchaseBidingItemContent").hide();
		$("#purchaseItemContent").hide()
		$("#registerItemContent").show();
	})//registerItem
	
	//------------------------ 달력 시작 ---------------------------------//
	$('#txtDatePicker').datepicker({ 
		format: 'yyyy-mm-dd',
		language : 'kr',
		todayHighlight : true,
		todayBtn : 'linked'
	}).on("changeDate", function(e){
		console.log(e.date);//Wed Jan 06 2021 00:00:00 GMT+0900 
		var dateStr = e.date.toString();
		//console.log("dateStr:"+dateStr);
		var date = dateStr.substring(0,15);
		console.log("date:"+date);
		var dates = date.split(" ");
		//dates[1] month, dates[2] day dates[3] year
		$("#e_year").val(dates[3]);
		$("#e_month").val(dates[1]);
		$("#e_day").val(dates[2]);
	});
	//------------------------ 달력 끝 ---------------------------------//
	
	//----------------------------------------- 이미지 추가----------------------------------------------------------//
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});//fileDrop	

	$("#fileDrop").on(
			"drop",
			function(e) {
				e.preventDefault();
				
				$("#lblFileNameCheckError").hide();
				
				var nextPNO = $(this).attr("data-nextPNO");//sql의 다음 시퀀스 값이 data-nextPNO에 들어있다
			
				var file = e.originalEvent.dataTransfer.files[0]; //드래그한 파일에 대한 객체 정보를 가지고 있다
				//html의 form객체를 만들어서 여기에 이미지를 추가해서 통째로 ajax로 넘긴다

				var formData = new FormData();
				formData.append("file", file);

				var url = "/furniture/uploadAjax/"+nextPNO;//pno에 해당하는 폴더 만든다
				
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

	$("#uploadList").on("click",".a_times",function(){
		var that = $(this);
		var fileName = that.next().attr("value");
		console.log(fileName)
		
		var sendData = {
			"fileName" : fileName
		};
		
		var url = "/furniture/deleteAjax"
		$.get(url,sendData, function(result){
			if(result == "success"){
				that.parent().remove();
			}
		});
	});
			
	$("#btnSubmit").click(function(){//등록 버튼 클릭시
		
		//영어 월을 숫자 월로 입력
		var engMonth = $("#e_month").val();
		console.log("engMonth:"+engMonth);
		var month = changeMonth(engMonth);
		console.log("month:"+month);
		$("#e_month").val(month);
		
		var e_second = parseInt((Math.random() * 59)+1);
		$("#e_second").val(e_second);
		
		//이미지 입력
		var div = $("#uploadList > .divUploaded"); // > : 자식에서 찾아라
		
		div.each(function(index){//img이름 가져온다
			//console.log("index:"+index);
			var radio = $(this).find("#radioMainImg")
			var filename = radio.attr("value");
			
			var html = "<input type='hidden' name='images["+index+"]' value='"+filename+"'>";
			$("#writeForm").prepend(html);
		});
		//메인 이미지 결정
		var radioValue = $("input[name=radioMainImg]:checked").val();//main이미지 이름 가져오기
		console.log("radioValue:"+radioValue);
		
		
		if(radioValue == null || radiValue == "undefined"){
			alert("메인 이미지를 선택하세요");
		}else{
			var htmlMainImgName = "<input type='hidden' name='main_img_name' value='"+radioValue+"'>"
			$("#writeForm").prepend(htmlMainImgName);
			
			//$("#writeForm").submit();
		}
	});	
			
	//--------------------------------------------- 주소  ----------------------------------------------------------//
	$("#addrFindAuction").click(function(e) {//주소 찾기 버튼
		e.preventDefault();
		$("#modalAddrAuction").trigger("click");
	});
	
	//모달에서 주소 찾기 
	$("#modalAddrFindAuction").click(function() {
		var keyword = $("#moadlTxtAddrAuction").val();
		
		var dataAddr = {
			currentPage : "1",
			countPerPage : "1000",
			resultType : "json",
			confmKey : "devU01TX0FVVEgyMDIwMTIyNzEyMzcyMzExMDU5NDU=",
			keyword : keyword
		};

		$.ajax({
			url : "https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do" //인터넷망
			,
			type : "post"
			//,data:$("#form").serialize()
			,
			data : dataAddr,
			dataType : "jsonp",
			crossDomain : true,
			success : function(jsonStr) {
				$("#list").html("");
				var htmlStr = "";
				htmlStr += "<table style='border:1;width:300px'>";
				$(jsonStr.results.juso).each(function() {
					htmlStr += "<tr><td style='text-align:center;font-size:15px;font-family:verdana;padding:2px'><a href='#' class='roadAddrPart1' data-zip='"+this.zipNo+"'>" + this.roadAddrPart1 + "</a></td><tr>";
					htmlStr += "<tr><td style='text-align:center;font-size:13px;font-family:verdana;font-color:gray;margin-bottom:4px'>" + this.jibunAddr + "<hr></td><tr>";
					//htmlStr += "<td>" + this.zipNo + "</td>";
				});
				htmlStr += "</table>";
				$("#list").html(htmlStr);
				}
			});//ajax
		});//addrFind

		$("#list").on("click",".roadAddrPart1", function(){//모달에서 주소 링크 클릭시 값 넘기기
			var roadAddr = $(this).text();
			var jibunAddr = $(this).parent().parent().next().next().children().text();//닫는tr-> /tr 도 요소에 포함. next()에 포함시킨다
			var zip = $(this).attr("data-zip");
			//alert("도로:"+roadAddr+" ,지번:"+jibunAddr);
			//console.log("zip:"+zip);
			$("#spanZip").text(zip);
			$("#spanRoadAddr").text(roadAddr);
			$("#spanjibundAddr").text(jibunAddr);
			$("#txtjibundAddrDetail").val("");
			
			$("#zip").val(zip);
			$("#road_address").val(roadAddr);
			$("#jibun_address").val(jibunAddr);
			
			
			$("#btnModalCloseAuction").trigger("click");
		});
		
		$(".btnDelAuction").click(function(e){
			e.preventDefault();
			var p_no = $(this).attr("data-pno");
			location.href="/auction/auctionDelete?p_no="+p_no;
		});
		
});//function	
	
</script>

<!--  주소 찾기 모달 시작 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a id="modalAddrAuction" href="#modalAddr-container-auction" role="button"
				class="btn" data-toggle="modal" style="display:none">주소 찾기</a>
			
			<div class="modal fade" id="modalAddr-container-auction" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
					
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">주소 입력</h5>
							<button type="button" id="btnModalCloseAuction" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						
						<div class="modal-body"> 
							<div>
								<input type="text" style="width:300px;margin-bottom:15px;font-size:15px" placeholder="주소를 입력하시오" id="moadlTxtAddrAuction" onkeydown="enterSearch();">
								<a href="#" id="modalAddrFindAuction"><img src="../resources/image/addrFind.png"></a>
							</div>
								<div id="list" style="padding-bottm:20px"></div>
								<!-- 검색 결과 리스트 출력 영역 -->
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  주소 찾기 모달 끝 -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"><%@ include file="auctionSideBar.jsp"%></div>
				<div class="col-md-8">
					<div class="row">
						<%@ include file="../include/header_mainCatagories.jsp"%>
						<div class="col-md-12" style="padding:35px;left: 56px;">
							
							<!--------------------------------------- 탭 시작 ------------------------------------------------------>
							
							<div class="tabbable" id="tabs-778663">
								<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active tabTitle" href="#tab1" data-toggle="tab" id="bidingItem">입찰 중인 상품</a></li>
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab2" data-toggle="tab" id="bidingFinishItem">입찰 종료된 상품</a></li>
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab3" data-toggle="tab" id="soldItem">낙찰된 상품</a></li>
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab4" data-toggle="tab" id="purchaseBidingItem">내가 입찰한 상품</a></li>
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab5" data-toggle="tab" id="purchaseItem">내가 구매한 상품</a></li>
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab6" data-toggle="tab" id="registerItem">물품 등록</a></li>
								</ul>
				
								<div class="tab-content">
				
									<div class="tab-pane active" id="bidingItemContent"><!-- tab1 -->
										<!--------------------------------- tab1 입찰 중인 상품 div 시작 ------------------------------------>
				
										<div class="row">
											<div class="col-md-12">
											<div class="row">
				
											<c:forEach var="bidingList" items="${bidingList}" >
											<div class="col-md-4 tabMd3">
												<div class="card">
														<a href="/auction/auctionSelected?p_no=${bidingList.p_no}">
														<img src="/furniture/displayImage?imageName=${bidingList.main_img_name}" class="img-class" style="height:200px;">
														</a>
														<div class="card-block">
														<h5 class="card-title">${bidingList.p_title}</h5>
														<p class="card-text">현재가:${bidingList.present_price}</p>
														<p class="card-text">즉구가:${bidingList.instant_price}</p>
														<p class="card-text">등록일:${bidingList.r_year}/${bidingList.r_month}/${bidingList.r_day}</p>
														<p class="card-text">마감일:${bidingList.e_year}/${bidingList.e_month}/${bidingList.e_day}</p>
														<p class="card-text">
															<a class="btn btn-outline-primary" href="/auction/auctionModify?p_no=${bidingList.p_no}">수정</a>
															<a class="btn btn-outline-danger btnDelAuction" href="#" data-pno="${bidingList.p_no}">삭제</a>
														</p>
													</div>
												</div>
											</div>
											</c:forEach>
				
												</div>
											</div>
										</div>
										<!--------------------------------- tab1 입찰 중인 상품 div 끝 -------------------------------------->
									</div><!-- tab1 -->
									
									<div class="tab-pane" id="bidingFinishItemContent">	<!-- tab2시작 -->
										<!--------------------------------- tab2 입찰 종료된 상품 div 시작 -------------------------------------->
											<div class="row">
											<div class="col-md-12">
											<div class="row">
				
											<c:forEach var="bidingFinishList" items="${bidingFinishList}" >
											<div class="col-md-4 tabMd3">
												<div class="card">
														<a href="/auction/auctionSelected?p_no=${bidingFinishList.p_no}">
														<img src="/furniture/displayImage?imageName=${bidingFinishList.main_img_name}" class="img-class" style="height:200px;">
														</a>
													<div class="card-block">
														<h5 class="card-title">${bidingFinishList.p_title}</h5>
														<p class="card-text">현재가:${bidingFinishList.present_price}</p>
														<p class="card-text">즉구가:${bidingFinishList.instant_price}</p>
														<p class="card-text">등록일:${bidingFinishList.r_year}/${bidingFinishList.r_month}/${bidingFinishList.r_day}</p>
														<p class="card-text">마감일:${bidingFinishList.e_year}/${bidingFinishList.e_month}/${bidingFinishList.e_day}</p>
														<p>
														<!-- 경매 종료는 수정 버튼이 필요없다 -->
															<a class="btn btn-outline-danger btnDelAuction" href="#" data-pno="${bidingFinishList.p_no}">삭제</a>
														</p>
													</div>
												</div>
											</div>
											</c:forEach>
				
												</div>
											</div>
										</div>
										<!--------------------------------- tab2 입찰 종료된 상품 div 끝 -------------------------------------->
									</div><!-- tab2끝 -->
									
									<div class="tab-pane" id="soldItemContent">	<!-- tab3 -->
										<!--------------------------------- tab3 거래된 상품 div 시작 ------------------------------------>
					
										<div class="row">
											<div class="col-md-12">
											<div class="row">
				
											<c:forEach var="auctionSoldVo" items="${soldList}" >
											<div class="col-md-3 tabMd3">
												<div class="card" style="height: 451px">
														<a href="/auction/auctionSelected?p_no=${auctionSoldVo.p_no}">
														<img src="/furniture/displayImage?imageName=${auctionSoldVo.main_img_name}" class="img-class" style="height:200px;">
														</a>
													<div class="card-block">
														<h5 class="card-title">상품:${auctionSoldVo.p_title}</h5>
														<p class="card-text">거래된가격:${auctionSoldVo.sold_price}</p>
														<p class="card-text">처음가격:${auctionSoldVo.present_price}</p>
														<p class="card-text">구매자:${auctionSoldVo.purchaser}</p>
														<p class="card-text">등록일:${auctionSoldVo.r_year}/${auctionSoldVo.r_month}/${auctionSoldVo.r_day}</p>
														<p class="card-text">판매된날짜:${auctionSoldVo.bid_date}</p>
<!-- 														<p> -->
<!-- 															<a class="btn btn-outline-primary" href="#">수정</a>  -->
<!-- 															<a class="btn btn-outline-danger" href="#">삭제</a> -->
<!-- 														</p> -->
													</div>
												</div>
											</div>
											</c:forEach>
				
												</div>
											</div>
										</div>					
					
										<!--------------------------------- tab3 거래된 상품 div 끝 -------------------------------------->
									</div><!-- tab3 -->
									
										<!--------------------------------- tab4 내가 입찰 한 상품 div 끝 -------------------------------------->
									<div class="tab-pane tabMd3" id="purchaseBidingItemContent">
										<c:forEach var="tempPno" items="${tempBidingPno}">
										<table border='1' width="600px"><!-- 여기서 테이블 한개 조건 들어가고 -->
											<tr>
												<c:forEach var="tempImg" items="${tempBidingImg}">
												<c:if test="${tempImg.p_no == tempPno }">
													<th>${tempImg.main_img_name}</th>
												</c:if>
												</c:forEach>
												<c:forEach var="tempTitle" items="${tempBidingTitle}">
												<c:if test="${tempTitle.p_no == tempPno }">
													<th>${tempTitle.p_title}</th>
													<th>${tempTitle.seller}</th>
												</c:if>
												</c:forEach>
											</tr>
											<c:forEach var="tempbiding" items="${tempBiding}">
											<c:if test="${tempbiding.p_no == tempPno}">
											<tr><!-- 여기서 입찰 목록 조건 들어간다 -->
												<td colspan='2'><span>${tempbiding.temp_bid_date}</span></td>
												<td>${tempbiding.temp_bid_price}원</td>
											</tr>
											</c:if>
											</c:forEach>
										</table>
										</c:forEach>
									</div>
										<!--------------------------------- tab4 내가 입찰 한 상품 div 끝 -------------------------------------->
										
									<div class="tab-pane tabMd3" id="purchaseItemContent"><!-- tab5 -->
										<!---------------------------------- tab5 구매한 상품 div 시작 ------------------------------------>
										<c:forEach var="auctionSoldVo" items="${purchaserList}" >
										<table border='1' class="tablePurchase">
											<tr>
												<td class="tdPurchase">입찰 날짜:<span>${auctionSoldVo.bid_date}</span></td>
												<td rowspan='3' style="width:130px">
												<a href="/auction/auctionSelected?p_no=${auctionSoldVo.p_no}">
												<img src="/furniture/displayImage?imageName=${auctionSoldVo.main_img_name}" class="img-class" style="height:150px;width:150px">
												</a>
												</td>
												<td class="tdPurchase">${auctionSoldVo.p_title}</td>
											</tr>
											<tr>
												<td class="tdPurchase">최초금액:<span>${auctionSoldVo.present_price}</span></td>
<!-- 												<td>이미지</td> -->
<!-- 												<td>제목</td> -->
												<td class="tdPurchase">판매자:<span>${auctionSoldVo.seller}</span></td>
											</tr>
											<tr>
												<td class="tdPurchase">낙찰금액:<span>${auctionSoldVo.sold_price}</span></td>
<!-- 												<td>이미지</td> -->
												 <td class="tdPurchase" style="padding:0px; height: 45px;text-align:center">
												 <a href="/auction/auctionPurchaseSelected/${auctionSoldVo.p_no}">
												 	<img src="/resources/auctionImage/btn_payment.png" style="height:45px;width:80%;cursor:pointer">
												 </a>
												 </td>
											</tr>
										</table>
										</c:forEach>
										<!---------------------------------- tab5 구매한 상품 div 끝 ------------------------------------>
									</div>
									
									
									<div class="tab-pane tabMd3" id="registerItemContent"><!-- tab6 -->
										<!--------------------------------- tab6 물품 등록 div 시작 ------------------------------------>
										<div class="row">
											<div class="col-md-12">
												<form role="form" name="writeForm" id="writeForm" action="/auction/auctionResister">    
												
												<input type='hidden' name='nextPNO' id='nextPNO' value='${nextPNO}'>
												
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
												<input type="text" id="txtDatePicker" style="width:140px;text-align:center;border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1">
												시간<input type="text" id="txtHour" name='e_hour' style="width:50px;text-align:center;border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1">
												분<input type="text" id="txtMinute" name='e_minute' style="width:50px;text-align:center;border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1">
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
													<label style="padding-right:10px">직구를 원하시면 주소를 입력하세요</label>
													<a href="#" id="addrFindAuction"><img src="../resources/image/addrFind.png"></a>
												<br>
													
												<!-- 주소 찾기 시작 -->
												우편번호:<span id="spanZip" style="padding-left:10px"></span><br/>
												<span id="spanRoadAddr"></span><br>
												<span id="spanjibundAddr"></span><br>
												<input type="text" placeholder="상세주소" id="txtjibundAddrDetail" name="detail_address" style="width:140px;"/>
												
												<!-- 주소 찾기 끝-->
												</div>
												
												<br>
												<button type="button" class="btn form-control btn-warning" id="btnSubmit">등록</button>
												</form>
											</div>
										</div>
									</div><!-- tab6 -->
										<!--------------------------------- tab6 물품 등록 div 끝 -------------------------------------->
								</div>
							</div>
							<!--------------------------------------- 탭 끝 ------------------------------------------------------>
						</div><!-- 안쪽 md8 -->
<!-- 						<div class="col-md-2"></div>안쪽m d2 -->
					</div><!-- row -->
				</div><!-- col-md-8 -->
				<div class="col-md-2"></div><!-- 바깥 md2 -->
			</div><!-- row -->
		</div><!-- col-md-12 -->
	</div><!-- row -->
</div><!-- container-fluid -->
