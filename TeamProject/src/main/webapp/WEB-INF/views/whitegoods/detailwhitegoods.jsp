<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<style>
.productshow{
	border-left:2px solid #CCC;
	border-right:2px solid #CCC;
	padding:20px;
	width:900px;
}
.show1{
	border-top: 2px solid #CCC;
}

.prod-image__detail{float:left;width:410px;height:410px}

.prod-buy-header{position:relative;padding:0 0 10px;border-bottom:1px solid #ccc}
.prod-buy-header .prod-buy-header__title{font-size:18px;font-weight:bold;width:380px}
.prod-buy-header .prod-buy-header__title{width:375px}
.prod-buy-header {padding-top:2px;*zoom:1}
.prod-buy-header {content:" ";display:table}
</style>
<script>
	$(function(){
		var memberVo = "${sessionScope.memberVo.m_id}";
		$("#btnCart").click(function(){
			if(memberVo == ""){
				alert("로그인이 필요한 작업입니다.");
			} else {
				var url = "/cart/cartInput";
				var sendData = {
						"p_no": $("#btnCart").attr("data-pno")
				}
				$.get(url, sendData, function(data){
					console.log(data.trim());
					if(data.trim() == "success"){
						alert("상품이 장바구니에 담겼습니다.");
					} else if(data.trim() == "fail"){
						alert("이미 존재하는 상품입니다.");
					} else if(data.trim() == "member"){
						alert("로그인이 필요한 작업입니다.");
					}
				});
			}
		});
	});
</script>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<%@ include file="../include/header_mainCatagories.jsp"%>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8 productshow show1">
<br>
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
<!-- 
	<br>
	<div style="text-align: right;">
			<c:if test="${sessionScope.memberVo.m_id == whitegoodsVo.w_seller}">
				<div>
					<a class="btn btn-success btn-xs" href="/whitegoods/whitegoodsUpdate/${whitegoodsVo.w_no}">수정하기</a>
					<a class="btn btn-danger btn-xs" href="/whitegoods/whitegoodsDelete/${whitegoodsVo.w_no}">삭제하기</a>
				</div>
			</c:if>
		</div>
-->
<div class="prod-image" data-global-banner-fold="">
    <div id="repImageContainer" class="prod-image-container">
        <img class="prod-image__detail" src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${whitegoodsVo.w_thumbimg}"
             onload="_logTTI(this)" alt="detail image"/>
    </div>
    
    <div id="prodStickyBanner" class="product-sticky-banner-clickable prod-sticky-banner"></div>
</div>


		<div class="prod-buy-header">
		    <h2 class="prod-buy-header__title">${whitegoodsVo.w_name}</h2>
		</div>
	    <div class="prod-price-container">
		    <div class="prod-price">
		    	<div class="prod-sale-price   prod-major-price" >
					<span class="total-price">
						<strong>${whitegoodsVo.w_price}<span class="price-unit">원</span></strong>
					</span>
				<span class="unit-price"></span> 
				</div>
			</div>
		</div>
		<div class="prod-vendor-container without-coach" >
			<div class="prod-vendor with-delivery-vendor">
		        <div class="prod-sale-vendor">
		                판매자: <a class="prod-sale-vendor-name" href="#">${whitegoodsVo.w_seller}</a>
		        </div>
		    </div>
		</div>
		
		<div class="prod-buy-footer ">
			<div class="prod-onetime-order " style="">
				<button class="prod-cart-btn" id="btnCart" data-pno="${whitegoodsVo.p_no}">장바구니 담기</button>
				<button class="prod-buy-btn"><span class="prod-buy-btn__txt">바로구매</span></button>
			</div>
		</div>
	</div>
</div>
<!-- 
<div class="row">
	<div class="col-md-2"></div>
	
	<div class="col-md-8 productshow show2">
	
		<c:forEach var="productImgVo" items="${productImgList}">
			<div class="imgProduct">
				<img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${productImgVo}" style="width:260px; height: 300px;">
			</div>
		</c:forEach>
		<hr>
		<div class="content">
			${whitegoodsVo.w_content}
		</div>
		
	</div>
	<div class="col-md-2"></div>
</div>
-->
<br>
<br>
<br>
<br>
<br>