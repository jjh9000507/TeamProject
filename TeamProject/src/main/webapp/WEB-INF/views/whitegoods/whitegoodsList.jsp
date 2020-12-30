<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<style>
.categoryMenu li{
	width:243px;
}
.categoryMenu{
 	padding-left : 155px;
	padding-bottom : 5px;
	text-align: center;
}
</style>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>

<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->


<!------------------------------------------ 상품 리스트 ---------------------------------------->
		<div style="padding-top: 150px;">
			
			<div class="row listMain">
					<ul class="nav nav-tabs listMenu">
						<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
						<li class="nav-item"><a class="nav-link" href="#">백화점</a></li>
						<li class="nav-item"><a class="nav-link" href="#">중고</a></li>
						<li class="nav-item"><a class="nav-link" href="#">기타</a></li>
					</ul>
				<div class="col-md-8 productList">
				
					<c:forEach var="whitegoodsVo" items="${WhitegoodsList}">
						<ul class="nav nav-pills list">
							<li class="nav-item"><a class="nav-link" href="#"><img src="/resources/image/shirt.jpg"/></a></li>
							<li class="nav-item"><a class="nav-link productName" href="/whitegoods/detailWhitegoods/${whitegoodsVo.w_no}">${whitegoodsVo.w_name}<br></a><span id="price">${whitegoodsVo.w_price}</span>원<br> 무료배송</li>
							<li class="nav-item"><a class="nav-link seller">${whitegoodsVo.w_seller}</a></li>
						</ul>
					</c:forEach>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
	</div>
	<div class="col-md-2"></div>
</div>
		


<!------------------------------------------ 페이지네이션 ---------------------------------------->
<br>
<div class="row">
	<div class="col-md-12 btnMore">
		<div class="form-control divMore">
			<a href="#" class="a_More">더보기  <span class="arrow"><img src="/resources/image/arrow.PNG"/></span></a>
			<input type="hidden" id="morePage" name="morePage"/>
		</div>

	</div>
</div>
<!-- -------------------------------------- 페이지네이션 ------------------------------------- -->

