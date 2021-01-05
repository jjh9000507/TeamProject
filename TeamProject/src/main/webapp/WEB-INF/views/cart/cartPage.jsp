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
.pno{
	width:90px;
}
.btnCart{
	width:100px;
}
.pseller{
	width:300px;
}
.pimg{
	wdith:10%;
}
</style>
<script>
$(function(){
	$(".cartDelete").on("click", function(e){
		var url = "/cart/cartDelete";
		var sendData = {
				"cart_no" : $(this).attr("data-cartno")
		}
		
		$.get(url, sendData, function(data){
			if(data.trim() == "success"){
				$(".cartHome").trigger("click");
			}
		})
	})
});
</script>
<div class="container-fluid">
<div class="row">
	<div class="col-md-12">
		<h1 style="text-align: center;">${sessionScope.memberVo.m_id}님의 장바구니 입니다.</h1>
	</div>
</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="pno">번호</th>
						<th class="pimg">상품이미지</th>
						<th class="pname">상품명</th>
						<th class="pseller">판매자</th>
						<th class="btnCart"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="CartVo" items="${cartList}">
						<tr>
							<td class="pno">${CartVo.cart_no}</td>
							<c:forEach var="ProductVo" items="${productList}">
								<c:if test="${CartVo.p_no == ProductVo.p_no2}">
									<td class="pimg"><img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${ProductVo.p_thumbimg}" style="width:80px; height:100px;"></td>
									<td class="pname">${ProductVo.p_name}</td>
									<td class="pseller">${ProductVo.p_seller}</td>
								</c:if>
							</c:forEach>
							<td class="btnCart">
								<a href="#" data-cartno="${CartVo.cart_no}" class="cartDelete">취소</a>
								<button type="button" onclick="location.reload()" class="cartHome" style="display: none">홈</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>