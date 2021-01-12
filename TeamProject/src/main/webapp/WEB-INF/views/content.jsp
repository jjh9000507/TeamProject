<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file="include/header.jsp"%>


<div class="row">
	<div class="col-md-12 borderAllCategory" id="borderAllCategory">
		<div class="col-md-2"></div>
		<div class="col-md-8" >
			<%@ include file="include/header_mainCatagories.jsp"%>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
		
<div class="row" style="padding-top: 3%">
	<div class="col-md-2"></div>
	<div class="col-md-4">
		<img id="content_img" src="/resources/image/${productVo.p_thumbimg}"/>
	</div>
	<div class="col-md-3">
		<div id="divContent">
			<span id="content_p_name">${productVo.p_name}</span>
		</div>
		<br>
		<div id="divContent2">
			가격  <span class="content_span">₩${productVo.p_price}</span><br>
			판매자 <span class="content_span2">${productVo.p_seller}</span><br>
			신용등급 <span class="content_span3">★★★★☆</span><br>
			주소 정보 <span class="content_span4">주소 정보 받아와야함</span><br>
			<button type="button" class="btn btn-primary" id="btnBuy">구매하기</button>
			<button type="button" class="btn btn-outline-warning" id="btnBuy2">장바구니에 담기</button>
		</div>
	</div>
	<div class="col-md-3"></div>
	
</div>

<div class="row" style="padding-top: 3%">
		<div class="col-md-3"></div>
		<div class="col-md-8" id="content_detail_info">
			<span id="span_detail">상품 상세정보</span><br>
		</div>
		<div class="col-md-1"></div>
</div>

<div class="row" style="padding-top: 3%">
		<div class="col-md-3"></div>
		<div class="col-md-8">
			<span>${productVo.p_content}</span>
			<span><img id="content_detail_img"src="/resources/image/${productVo.p_thumbimg}"/></span><br>
		</div>
		<div class="col-md-1"></div>
</div>
<br>
	
	


