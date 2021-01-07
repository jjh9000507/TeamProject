<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<style>
div{
	text-align: center;
}
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
	<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
<div style="padding-top: 150px;">
	<ul class="nav nav-pills list">
		<li class="nav-item"><img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${whitegoodsVo.w_thumbimg}" style="width:200px; height:260px;"/></li>
		<li class="nav-item detail" style="width:360px;">${whitegoodsVo.w_name}<br><span id="price" class="detail">${whitegoodsVo.w_price}</span>원</li>
		<li class="nav-item seller">${whitegoodsVo.w_seller}<br></li>
	</ul>
	<ul class="nav nav-pills btnlist">
		<li><button type="button" class="btn btndetail cart" id="btnCart" data-pno="${whitegoodsVo.p_no}">장바구니</button></li>
		<li><button type="button" class="btn btndetail sell" id="btnSell">구매하기</button></li>
	</ul>
</div>
<c:if test="${sessionScope.memberVo.m_id == whitegoodsVo.w_seller}">
	<div><a href="/whitegoods/whitegoodsUpdate/${whitegoodsVo.w_no}">수정하기</a></div>
	<div><a href="/whitegoods/whitegoodsDelete/${whitegoodsVo.w_no}/${whitegoods.w_seller}">삭제하기</a></div>
</c:if>
	</div>
	<div class="col-md-2"></div>
</div>

<div class="row">
	<div class="col-md-2"></div>
	
	<div class="col-md-8">
		<div class="content">
			${whitegoodsVo.w_content}
		</div>
		
		<c:forEach var="productImgVo" items="${productImgList}">
			<div>
				<img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${productImgVo}" style="width:260px; height: 300px;">
			</div>
		</c:forEach>
	</div>
	<div class="col-md-2"></div>
</div>
<br>
<br>
<br>
<br>
<br>