<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/buyComputerProductDetail_css.css" %>
<%@ include file="include/header.jsp"%>
	<div class="row">
			<div class="col-md-2"></div>
	<div class="col-md-8" >
	<%@ include file="include/header_mainCatagories.jsp"%>
	<br>
		</div>
		<div class="col-md-2"></div>
	</div>
<div class="DetailDiv" style="padding-left: 25%;">
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
							상품이름
						</td>
						<td>		
							<input type="number" min="0" max="100" step="1"/>
						</td>
						<td>
							판매자명<span>님</span>
						</td>
						<td>
							배송방식
						</td>
						<td>
							가격<span>원</span>
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
						<input placeholder="주소를 입력하시오"/>&nbsp;&nbsp;<input placeholder="상세주소를 입력하시오"/>						
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
							<input type="radio" name="cardPayment" value="cardPayment">신용/체크카드
							&nbsp;&nbsp;<input type="radio" name="bankPayment" value="bankPayment">무통장입금
							&nbsp;&nbsp;<input type="radio" name="phonePayment" value="phonePayment">휴대폰결제
						</form>
						</td>
						<td>
							<button>결제하기</button>
						</td>						
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
</section>
<aside class="DetailAside">
</aside>
</div>