<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/header.jsp"%>

관심상품 옥션 보고
주문하기, 수정하기는 옆에 사이드바 살리고
결제완료 -> 배송 정보 입력

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<%@ include file="auctionSideBar.jsp"%>
		</div>
		<div class="col-md-8">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
			<%@ include file="../include/header_mainCatagories.jsp"%>
				
			</div><!-- 내부 md-8 -->
			<div class="col-md-2"></div><!-- 내부 md-2 -->
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>
