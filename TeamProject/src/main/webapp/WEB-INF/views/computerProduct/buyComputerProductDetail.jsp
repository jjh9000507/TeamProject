<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/buyComputerProductDetail_css.css" %>
<%@ include file="../include/header.jsp"%>
<script>
$(function(){
	$("#buyProduct").click(function(){	
		var url = "/buyComputerProduct/sendForGetPurchasePercentage";
		var productNum = "${buyComputerInfo.productNum}";
		var productName = "${buyComputerInfo.productName}";
		var seller = "${buyComputerInfo.seller}";
		var sendData = {
			"productNum" : productNum,
			"productName" : productName,
			"seller"      : seller
		};
		$.post(url,sendData, function(data) {
			if(data == "success"){
				alert("성공");
			}else if(data == "fail"){
				alert("실패");
			}
		});
	});
});
</script>
<div class="row">
		<div class="col-md-2"></div>
<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="DetailDiv">
<nav class="DetailNav">
nav
</nav>
<section class="DetailSection">
<h1>주문서</h1>
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
					</tr>					
				</tbody>
			</table>
		</div>
	</div>	
	<br>
	<br>
	<h4>주문자 정보 입력</h4>
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
							<input placeholder="주문자 기입"/>							
						</td>
						<td>
						<div class="checkbox">
							<label> <input type="checkbox"/>
						입력한 주문자명으로 회원정보 변경하기</label>
						</div>
						</td>
						<td>
						<button>변경</button>
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
							이름
						</th>												
						<th>
							주소
						</th>												
						<th>
							연락처
						</th>
						<th>
							배송 메세지
						</th>												
					</tr>
				</thead>
				<tbody>
					<tr>						
						<td>
						<label>주문자 이름:</label>
						<input placeholder="성함을 입력하시오"/>
						</td>
						<td>
						<label>주소:</label>
						<input placeholder="우편번호 입력"/><button>우편번호 검색</button><br>
						<input placeholder="주소를 입력하시오"/>&nbsp&nbsp<input placeholder="상세주소를 입력하시오"/>						
						</td>
						<td>
						<label>연락처:</label>
						<input type="tel" placeholder="연락처를 입력하시오"/>
						</td>
						<td>
						<label>배송메세지:</label>
						<input placeholder="택배 기사님께 부탁할 사항을 입력하시오"/>(<span></span>/50자)
						</td>												
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<h4>결제정보</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							결제정보입력
						</th>
						<th>
							결제하기
						</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<form>
							<input type="radio" name="Payment" value="cardPayment">신용/체크카드
							&nbsp&nbsp<input type="radio" name="Payment" value="bankPayment">무통장입금
							&nbsp&nbsp<input type="radio" name="Payment" value="phonePayment">휴대폰결제
						</form>
						</td>
						<td>
							<button type="button" id="buyProduct">결제하기</button>
						</td>						
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
</section>
<aside class="DetailAside">
aside
</aside>
</div>