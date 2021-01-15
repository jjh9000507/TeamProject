<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="/resources/css/whitegoods.css" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function scrollMove(seq){
	var offset = $(".product-" + seq).offset();
	$('html, body').animate({scrollTop : offset.top}, 400);
}
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
			alt="detail image"/>
	</div>
</div>


		<div class="prod-buy-header">
		    <h2 class="prod-buy-header__title">${whitegoodsVo.w_name}</h2>
		</div>
	    <div class="prod-price-container">
		    <div class="prod-price">
				<span class="total-price prod-major-price">
					<strong>${whitegoodsVo.w_price}<span class="price-unit">원</span></strong>
				</span>
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
<div id="btfTab" class="tab">
    <ul class="tab-titles">
        <li name="detail" onclick="scrollMove('detail')" class="active">상품상세</li>
        <li name="review" onclick="scrollMove('review')">상품평 <span class="product-tab-review-count"></span></li>
        <li name="qna" onclick="scrollMove('qna')">상품문의</li>
        <li name="etc" onclick="scrollMove('etc')">배송/교환/반품 안내</li>
    </ul>
    <ul class="tab-contents">
        <li class="product-detail">
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
        
        
        
	        
		</li>
		<li class="product-review">
		
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>상품평</p>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Product</th>
								<th>Payment Taken</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>TB - Monthly</td>
								<td>01/04/2012</td>
								<td>Default</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
		</li>
		<li class="product-qna">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>상품 문의</p>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Product</th>
								<th>Payment Taken</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>TB - Monthly</td>
								<td>01/04/2012</td>
								<td>Default</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
		</li>
		<li class="product-etc">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>배송/반품 안내</p>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Product</th>
								<th>Payment Taken</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>TB - Monthly</td>
								<td>01/04/2012</td>
								<td>Default</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
		
		
			
		</li>
    </ul>
</div>
<br>
<br>
<br>
<br>
<br>