<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<style>
table, th, td{
	text-align: center;
}
table{
	width: 100%;
}
td.pname{
	text-align: left;
}

.pcheck{
	width:60px;
}
.btnCart{
	width:100px;
}
.pseller{
	width:200px;
}
.pimg{
	width:10%;
}
.pprice{
	width:90px;
}
a.btns{
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	text-decoration: none;
	border-radius: 4px;
	float:left;
}

a.btns:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 40, 200, 0.7) 0 0px 0px 40px inset;
}
.alls{
text-align:center;
	float:left;
}
</style>
<script>
$(function(){
	var msg = "${msg}"
	if(msg == "successDelete"){
		alert("취소되었습니다.");
	}
	$(".cartDelete").on("click", function(e){
		e.preventDefault();
		var url = "/cart/cartDelete";
		var sendData = {
				"cart_no" : $(this).attr("data-cartno")
		}
		
		$.get(url, sendData, function(data){
			if(data.trim() == "success"){
				alert("취소되었습니다.");
				location.reload();
			}
		});
	});
	
	$("#chkAll").click(function(){
		var isChecked = $(this).prop("checked");
		if(isChecked){
			$(".chkProduct").prop("checked", true);
		} else {
			$(".chkProduct").prop("checked", false);
		}
	});
	
	$("#btnAllDelete").click(function(){
		if(checkLength() == true){
			$("#frmCart").attr("action","/cart/cartListDelete").submit();
		}
	});
	
	$("#btnAllBuy").click(function(){
		if(checkLength() == true){			
// 			$("#frmCart").attr("method","get");
			$("#frmCart").attr("action","/cart/purchase").submit();
		}
	});
	
	function checkLength(){
		var len = $(".chkProduct:checked").length;
		if(len == 0){
			alert("선택된 상품이 없습니다.");
			return false;
		} else {
			return true;
		}
	}
});
</script>
<div class="container-fluid">
<div class="row">
	<div class="col-md-12">
		<h1 style="text-align: center;">${sessionScope.memberVo.m_id}님의 장바구니 입니다.</h1>
	</div>
</div>
<div class="row">
	<div class="col-md-8"></div>
	<div class="col-md-2">
		<a class="btn btns" href="#" id="btnAllBuy">선택 품목 구매</a>
		<a class="btn btns" href="#" id="btnAllDelete">선택 품목 취소</a>
	</div>
	<div class="col-md-2"></div>
</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form id="frmCart" method="post">
			<input type="hidden" name="type" value="${param.type}">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="pcheck"><input type="checkbox" id="chkAll"></th>
						<th class="pimg">상품이미지</th>
						<th class="pname">상품명</th>
						<th class="pseller">판매자</th>
						<th class="pprice">판매가</th>
						<th class="btnCart"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="CartVo" items="${cartList}">
						<tr>
									<td class="pcheck"><input type="checkbox" class="chkProduct" name="cart_no" value="${CartVo.cart_no}"></td>
							<c:forEach var="ProductVo" items="${productList}">
								<c:if test="${CartVo.p_no == ProductVo.p_no2}">
									<td class="pimg"><img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${ProductVo.p_thumbimg}" style="width:80px; height:100px;"
									alt="상품 이미지"></td>
									<td class="pname">${ProductVo.p_name}</td>
									<td class="pseller">${ProductVo.p_seller}</td>
									<td class="pprice">${ProductVo.p_price}</td>
								</c:if>
							</c:forEach>
							<td class="btnCart">
								<a href="/cart/purchase" data-cartno="${CartVo.cart_no}" class="btn btns cartBuy">구매</a>
								<a href="#" data-cartno="${CartVo.cart_no}" class="btn btns cartDelete">취소</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>