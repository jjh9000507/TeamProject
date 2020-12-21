<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="include/header.jsp"%>
<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->

<div class="row">
		<div class="col-md-2"></div>

<div class="col-md-8" >

<br>
<nav id="topMenu">

	<ul>
		<!-- 카테고리1 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>패션의류</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">상의</a></li>
				<li><a href="#" class="submenuLink">하의</a></li>
				<li><a href="#" class="submenuLink">신발</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리2 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>생활가전</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">가정</a></li>
				<li><a href="#" class="submenuLink">주방</a></li>
				<li><a href="#" class="submenuLink">미용</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리3 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>스포츠 레저</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">수영</a></li>
				<li><a href="#" class="submenuLink">등산</a></li>
				<li><a href="#" class="submenuLink">낚시</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리4 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>도서</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">도서</a></li>
				<li><a href="#" class="submenuLink">상품권</a></li>
				<li><a href="#" class="submenuLink">음반</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리5 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>컴퓨터</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리6 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리7 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>
			
		<!-- 카테고리8 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>
			
		<!-- 카테고리9 -->
		<li class="topMenuLi"><a class="menuLink" href="#"><img class="default" src="resources/image/t-shirt.png"><br>기타1등등</a>
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
			
					<ul class="nav nav-tabs listMenu">
						<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
						<li class="nav-item"><a class="nav-link" href="#">백화점</a></li>
						<li class="nav-item"><a class="nav-link" href="#">중고</a></li>
						<li class="nav-item"><a class="nav-link" href="#">기타</a></li>
					</ul>
					
				<div class="col-md-8 productList">
				
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="#"><img src="resources/image/shirt.jpg"/></a></li>
						<li class="nav-item"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="#"><img src="resources/image/shirt.jpg"/></a></li>
						<li class="nav-item"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="#"><img src="resources/image/shirt.jpg"/></a></li>
						<li class="nav-item"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="#"><img src="resources/image/shirt.jpg"/></a></li>
						<li class="nav-item"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
		
		<div class="col-md-2"></div>

<%@ include file="include/footer.jsp"%>
