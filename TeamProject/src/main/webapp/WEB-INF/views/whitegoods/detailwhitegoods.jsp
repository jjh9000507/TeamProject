<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@ include file="../include/header.jsp"%>
<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
<style>
.goodsDescant{
	font-size: 50px;
	left: auto;
}

.goodsTitle{
	font-size:30px;
}

.seller{
	cursor: pointer;
}
</style>
<div class="row">
		<div class="col-md-2"></div>

<div class="col-md-8" >

<br>
<nav id="topMenu">

	<ul>
		<!-- 카테고리1 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>패션의류</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">상의</a></li>
				<li><a href="#" class="submenuLink">하의</a></li>
				<li><a href="#" class="submenuLink">신발</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리2 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>생활가전</a>
			<ul class="submenu">
				<li><a href="/whitegoods/whitegoodsform/301" class="submenuLink">영상가전</a></li>
				<li><a href="/whitegoods/whitegoodsform/302" class="submenuLink">계절가전</a></li>
				<li><a href="/whitegoods/whitegoodsform/303" class="submenuLink">주방가전</a></li>
				<li><a href="/whitegoods/whitegoodsform/304" class="submenuLink">생활가전</a></li>
				<li><a href="/whitegoods/whitegoodsform/305" class="submenuLink">기타</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리3 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>스포츠 레저</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">수영</a></li>
				<li><a href="#" class="submenuLink">등산</a></li>
				<li><a href="#" class="submenuLink">낚시</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리4 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>도서</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">도서</a></li>
				<li><a href="#" class="submenuLink">상품권</a></li>
				<li><a href="#" class="submenuLink">음반</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리5 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>컴퓨터</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리6 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리7 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>
			
		<!-- 카테고리8 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>
			
		<!-- 카테고리9 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="/resources/image/t-shirt.png"><br>기타1등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>
	</ul>
</nav>
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
		<div style="padding-top: 150px;">
			<div class="row listMain">
					
				<div class="col-md-8 productList">
					<ul class="nav nav-pills list">
						<li class="nav-item"><img src="/resources/image/shirt.jpg"/></li>
						<li class="nav-item goodsTitle">${detailwhitegoodsVo.p_name}<br><hr><span id="price">${detailwhitegoodsVo.p_price}</span>원<br></li>
						
						<li class="nav-item"><a class="nav-link seller">${detailwhitegoodsVo.p_seller}</a></li>
					</ul>
					<div class="goodsDescant">
					${detailwhitegoodsVo.p_content}
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
		
		<div class="col-md-2"></div>

<%@ include file="../include/footer.jsp"%>
