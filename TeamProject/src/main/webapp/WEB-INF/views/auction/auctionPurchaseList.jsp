<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ include file="../include/header.jsp"%>

<style>
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

<script type="text/javascript">

$(function(){
	$("#purchaseBidingItem").click(function(){
		$("#purchaseBidingItemContent").show();
		$("#purchaseItemContent").hide()
		//$("#registerItemContent").hide();
	});
	
	$("#purchaseItem").click(function() {//tab4클릭시
		$("#purchaseBidingItemContent").hide();
		$("#purchaseItemContent").show()
		//$("#registerItemContent").hide();
	})
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
			<%@ include file="auctionHeader.jsp"%>
			<div><div style="float:left"><img src="/resources/auctionImage/btnMainPurchaser.png" height="40px"></div><h1>구매 상품</h1></div>
				<!-- tab 시작 -->
				<div class="row">
					<div class="col-md-12" style="padding-left: 200px;">
						<div class="tabbable" id="tabs-222970">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab1" data-toggle="tab" id="purchaseBidingItem">입찰한 상품</a></li>
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab2" data-toggle="tab" id="purchaseItem">낙찰된 상품</a></li>
							</ul>
							<div class="tab-content"><!-- 탭 큰 틀 시작 -->
							<!-- tab 내가 입찰 한 상품 시작-->
								<div class="tab-pane active" id="purchaseBidingItemContent">
										<!--------------------------------- tab4 내가 입찰 한 상품 div 시작 -------------------------------------->
									<div class="tab-pane tabMd3" id="purchaseBidingItemContent">
										<c:forEach var="tempPno" items="${tempBidingPno}">
										<table border='1' style="width:600px"><!-- 여기서 테이블 한개 조건 들어가고 -->
											<tr>
												<c:forEach var="tempImg" items="${tempBidingImg}">
												<c:if test="${tempImg.p_no == tempPno }">
													<th><img src="/furniture/displayImage?imageName=${tempImg.main_img_name}" class="img-class" style="height:100px;width:100px"></th>
												</c:if>
												</c:forEach>
												<c:forEach var="tempTitle" items="${tempBidingTitle}">
												<c:if test="${tempTitle.p_no == tempPno }">
													<th><a href="/auction/auctionSelected?p_no=${tempTitle.p_no}">${tempTitle.p_title}</a></th>
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
								</div>
							<!-- tab 내가 입찰 한 상품 끝-->
							<!-- tab 구매한 상품 시작 -->
								<div class="tab-pane" id="purchaseItemContent">
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
							<!-- tab 구매한 상품 끝 -->
							</div><!-- 탭 큰 틀 닫기 -->
						</div>
					</div>
				</div>
				<!-- tab 끝-->
			</div><!-- 내부 md-8 -->
			<div class="col-md-2"></div><!-- 내부 md-2 -->
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>
    