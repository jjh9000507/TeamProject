<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
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
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<h1>${sessionScope.memberVo.m_id}님의 장바구니 입니다.</h1>
	</div>
	<div class="col-md-4"></div>
</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>판매자</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="CartVo" items="${cartList}">
						<tr>
							<td>${CartVo.cart_no}</td>
							<c:forEach var="ProductVo" items="${productList}">
								<c:if test="${CartVo.p_no == ProductVo.p_no2}">
									<td>${ProductVo.p_name}</td>
									<td>${ProductVo.p_seller}</td>
								</c:if>
							</c:forEach>
							<td>
								<a href="#" data-cartno="${CartVo.cart_no}" class="cartDelete">장바구니에서 제거</a>
								<button type="button" onclick="location.reload()" class="cartHome" style="display: none">홈</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>