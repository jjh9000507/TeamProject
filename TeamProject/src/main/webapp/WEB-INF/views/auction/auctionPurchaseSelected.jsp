<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/auctionPurchaseSelected_css.css" %>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/css/sidebar.css" />

<style>

</style>


<script>
$(function(){
	
	$("#messageForDriver").keydown(function(){
		//alert("df");
		var msg = $(this).val();
		console.log(msg);
		var len = msg.length;
		console.log(len)
		$("#stringLengthSpan").text(len);
	});
	
	/* ------------------------------------ 옆면에 아우터 이벤트 시작 ---------------------------------- */
	//메인으로
	$(".sidebar__nav > li:eq(1) > a , .sidebar__submenu:eq(1)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(1) > ul").show();	
	});
	
	$(".sidebar__nav > li:eq(1) > a , .sidebar__submenu:eq(1)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(1) > ul").hide();	
	});
	
	// 관심상품
	$(".sidebar__nav > li:eq(2) > a , .sidebar__submenu:eq(2)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(2) > ul").show();
	});
	
	$(".sidebar__nav > li:eq(2) > a , .sidebar__submenu:eq(2)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(2) > ul").hide();
	});
	
	// 내상품
	$(".sidebar__nav > li:eq(3) > a , .sidebar__submenu:eq(3)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(3) > ul").show();
	});
	
	$(".sidebar__nav > li:eq(3) > a , .sidebar__submenu:eq(3)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(3) > ul").hide();
	});
	
	// 주문내역
	$(".sidebar__nav > li:eq(4) > a , .sidebar__submenu:eq(4)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(4) > ul").show();
	});
	
	$(".sidebar__nav > li:eq(4) > a , .sidebar__submenu:eq(4)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(4) > ul").hide();
	});
	/* ------------------------------------ 옆면에 아우터 이벤트 끝 ---------------------------------- */
	
})

</script>
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" ><%@ include file="../include/header_mainCatagories.jsp"%><br></div>
	<div class="col-md-2"></div>
</div>
<div class="container-fluid">
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="DetailDiv">

		<section class="DetailSection">
		<span class="mainTitle">주문서</span>
		<hr>
		<br>
		<br>
		<h4>주문상품내용</h4>
		<hr>
		<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>
									주문상품명
								</th>
								<th>
									상품수량
								</th>
								<th>
									판매자명
								</th>
								<th>
									배송방식
								</th>
								<th>
									가격
								</th>
								<th>
									주문날짜
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									${buyComputerInfo.productName}
								</td>
								<td>
									${buyComputerInfo.productNum}<span>개</span>
								</td>
								<td>
									${buyComputerInfo.seller}<span>님</span>
								</td>
								<td>
									${buyComputerInfo.sendMethod}
								</td>
								<td>
									${buyComputerInfo.price}<span>원</span>
								</td>
								<td>
									<span id="buyYear"></span>-<span id="buyMonth"></span>-<span id="buyDate"></span>
								</td>
							</tr>					
						</tbody>
					</table>
				</div>
			</div>	
			<br>
			<br>
			<h4>주문자 정보 수정</h4>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>
									주문자 확인
								</th>
								<th>
									
								</th>
								<th>
									
								</th>
																				
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<label>주문자명:</label>
									<input placeholder="주문자 기입" name="buyerName" id="buyerName"/>							
								</td>
								<td>
								<div class="checkbox">
									<label> <input type="checkbox" id="changeMemberName"/>
								입력한 주문자명으로 회원정보 변경하기</label>
								</div>
								</td>
								<td>
								<button type="button" id="changeMemberNameButton">변경</button>
								</td>												
							</tr>					
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<br>
			<h4>배송지 정보 입력</h4>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>																		
								<th>
									주소
								</th>												
								<th>
									연락처
								</th>
								<th>
									배송 메세지
								</th>												
								<th>
									
								</th>												
							</tr>
						</thead>
						<tbody>
							<tr>						
								<td>
									<button type="button" id="searchJuso">검색</button><br>							
								</td>
								<td>
									<label>연락처:</label>
									<select name="m_phonenumber1" id="m_phonenumber1" style="width:60px">	
										<option value="번호 선택">번호</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>									
									</select>
									<input type="text" style="width:90px">
									<input type="text" style="width:90px">
								</td>
								<td colspan='2' style="width:490px">
									<input placeholder="택배 기사님께 부탁할 사항을 입력하시오" type="text" id="messageForDriver" style="width:100%"/>(<span id="stringLengthSpan"></span>/50자)
								</td>
																				
							</tr>					
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<br>
			<h4>결제하기</h4>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<tr>
							<td>
								<button type="button" class="btn btn-md active disabled btn-outline-danger btn-block">
									결제하기
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>

	</div>
	</div>
	<div class="col-md-2"></div>
</div>
</div>


<!-- aside 시작 -->
<aside class="sidebar">
	<nav>
		<ul class="sidebar__nav">
		 <!-- 메인 -->
			<li>
				<a href="/auction/auctionMain" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/main3.png"/></i>
					<span class="sidebar__nav__text">메인으로</span>
				</a>
					<ul class="sidebar__submenu">
					</ul>
			</li>
		 <!-- 관심상품 -->
			<li>
				<a href="#" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/favorite2.png"/></i>
					<span class="sidebar__nav__text">관심상품</span>
				</a>
			</li>
		 <!-- 내상품 -->
			<li>
				<a href="/auction/auctionResisterList" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/myitem2.png"/></i>
					<span class="sidebar__nav__text">내상품</span>
				</a>
			</li>
		 <!-- 주문내역 -->
			<li>
				<a href="#" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/order3.png"/></i>
					<span class="sidebar__nav__text">내 결제 내역</span>
				</a>
			</li>
		</ul>
	</nav>
</aside>
<!-- aside 끝 -->
