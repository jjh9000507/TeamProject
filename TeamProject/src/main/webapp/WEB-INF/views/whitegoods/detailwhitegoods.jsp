<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<style>
.content{
	text-align: center;
	font-size: 25px;
}
.detail{
	font-size:30px;
	text-align: center;
}
.btndetail{
	font-size: 20px;
    
}
.btnlist{
	width: 972px;
	background : white;
	float: right;
}

.cart{
	background-color: white;
	border: 1px solid;
}

.sell{
	background-color: red;
	border: 1px solid black;
	color:white;
}
</style>
<script>
	$(function(){
		$("#btnCart").click(function(){
			$("#frmDetail").attr("action", "/whitegoods/cart")
			$("#frmDetail").submit();
		});
	});
</script>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
<div style="padding-top: 150px;">
	<ul class="nav nav-pills list">
		<li class="nav-item"><img src="/resources/image/shirt.jpg"/></li>
		<li class="nav-item detail">${whitegoodsVo.w_name}<br><span id="price" class="detail">${whitegoodsVo.w_price}</span>원</li>
		<li class="nav-item seller">${whitegoodsVo.w_seller}<br></li>
	</ul>
	<ul class="nav nav-pills btnlist">
		<li><button type="button" class="btn btndetail cart" id="btnCart">장바구니</button></li>
		<li><button type="button" class="btn btndetail sell" id="btnSell">구매하기</button></li>
	</ul>
</div>
	<form id="frmDetail" action="" method="get">
	<input type="hidden" name="w_no" value="${whitegoodsVo.w_no}">
	
	</form>
	</div>
	<div class="col-md-2"></div>
</div>

<div class="row">
	<div class="col-md-2"></div>
	
	<div class="col-md-8">
		<div class="content">
			${whitegoodsVo.w_content}
		</div>
		
	</div>
	<div class="col-md-2"></div>
</div>

<%@ include file="../include/footer.jsp"%>