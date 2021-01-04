<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto&display=swap" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="stylesheet" href="/resources/css/sidebar.css" />

<%@ include file="../include/header.jsp"%>

<script>
$(function(){	
		
		//아우터 
		$(".sidebar__nav > li:eq(1) > a , .sidebar__submenu:eq(1)").on("mouseover" , function(){
			$(".sidebar__nav > li:eq(1) > ul").show();	
		});
		
		$(".sidebar__nav > li:eq(1) > a , .sidebar__submenu:eq(1)").on("mouseout" , function(){
			$(".sidebar__nav > li:eq(1) > ul").hide();	
		});
		
		// 상의
		$(".sidebar__nav > li:eq(2) > a , .sidebar__submenu:eq(2)").on("mouseover" , function(){
			$(".sidebar__nav > li:eq(2) > ul").show();
		});
		
		$(".sidebar__nav > li:eq(2) > a , .sidebar__submenu:eq(2)").on("mouseout" , function(){
			$(".sidebar__nav > li:eq(2) > ul").hide();
		});
		
		// 바지
		$(".sidebar__nav > li:eq(3) > a , .sidebar__submenu:eq(3)").on("mouseover" , function(){
			$(".sidebar__nav > li:eq(3) > ul").show();
		});
		
		$(".sidebar__nav > li:eq(3) > a , .sidebar__submenu:eq(3)").on("mouseout" , function(){
			$(".sidebar__nav > li:eq(3) > ul").hide();
		});
		
		// 스포츠웨어
		$(".sidebar__nav > li:eq(4) > a , .sidebar__submenu:eq(4)").on("mouseover" , function(){
			$(".sidebar__nav > li:eq(4) > ul").show();
		});
		
		$(".sidebar__nav > li:eq(4) > a , .sidebar__submenu:eq(4)").on("mouseout" , function(){
			$(".sidebar__nav > li:eq(4) > ul").hide();
		});
	
}); // main function

</script>


<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<%@ include file="/resources/css/clothes.css"%>

<br>

<!------------------------------------------ 상품 리스트 ---------------------------------------->

	<div class="col-md-2"></div>
		<div class="col-md-8">
		
			<div>
				<ul class="nowMenu">
					<li><a href="/">홈 </a>></li>
					<li><a style="color:red;" href="/clothes/maleClothes">남성의류</a></li>
				</ul>
			</div>
			
			
		</div>
	<div class="col-md-2"></div>


		<div style="padding-top: 150px;">
			<div class="row listMain">

				<div class="col-md-8 productList">
				
					<ul class="nav nav-pills list" style="display:none;">
						<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="/resources/image/shirt.jpg"/></a></li>
						<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="/resources/image/shirt.jpg"/></a></li>
						<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
	</div>
</div>
		
		<div class="col-md-2"></div>


<!-- ---------------------------------------- 페이지네이션 ---------------------------------------->
<!------------------------------------------더보기 버튼---------------------------------------->
<br>
<div class="row">
	<div class="col-md-12 btnMore">
		<div class="form-control divMore">
			<a href="#" class="a_More">더보기  <span class="arrow"><img src="/resources/image/arrow.PNG"/></span></a>
			<input type="hidden" id="morePage" name="morePage"/>
		</div>
	</div>
</div>
<!------------------------------------------------------ 사이드바 메뉴 ------------------------------------------------------->
		<aside class="sidebar">
			<nav>
				<ul class="sidebar__nav">
				
				 <!-- 베스트 아이템1 -->
					<li>
						<a href="#" class="sidebar__nav__link">
							<i class=""><img class="sidebar__img" src="/resources/image/sidebar_best.png"/></i>
							<span class="sidebar__nav__text">BEST ITEM</span>
						</a>
							<ul class="sidebar__submenu">
							<!---------------->
							</ul>
					</li>
					
				 <!-- 아우터2 -->
					<li>
						<a href="#" class="sidebar__nav__link">
							<i class=""><img class="sidebar__img" src="/resources/image/sidebar_coat.png"/></i>
							<span class="sidebar__nav__text">아우터<span class="sidebar__nav__text__ENG">OUTER</span></span>
						</a>
							<ul class="sidebar__submenu">
							
									<li><a href="#">후드집업</a></li>
									<li><a href="#">코트</a></li>
									<li><a href="#">가디건</a></li>
									<li><a href="#">조끼</a></li>
									<li><a href="#">자켓</a></li>
									<li><a href="#">점퍼/야상/패딩</a></li>
									<li><a href="#">수트/블레이저</a></li>
							</ul>
					</li>
					
				 <!-- 상의3 -->
					<li>
						<a href="#" class="sidebar__nav__link">
							<i class=""><img class="sidebar__img" src="/resources/image/sidebar_shirt.png"/></i>
							<span class="sidebar__nav__text">상의<span class="sidebar__nav__text__ENG">Top</span></span>
						</a>
							<ul class="sidebar__submenu">
								<li><a href="#">민소매</a></li>
								<li><a href="#">반팔 티셔츠</a></li>
								<li><a href="#">긴팔 티셔츠</a></li>
								<li><a href="#">니트/스웨터</a></li>
								<li><a href="#">후드티</a></li>
								<li><a href="#">셔츠</a></li>
							</ul>
					</li>
					
				 <!-- 바지4 -->
					<li>
						<a href="#" class="sidebar__nav__link">
							<i class=""><img class="sidebar__img" src="/resources/image/sidebar_jeans.png"/></i>
							<span class="sidebar__nav__text">바지<span class="sidebar__nav__text__ENG">Pants</span></span>
						</a>
							<ul class="sidebar__submenu">
								<li><a href="#">숏 팬츠</a></li>
								<li><a href="#">슈트/슬랙스</a></li>
								<li><a href="#">레깅스</a></li>
								<li><a href="#">점프슈트/오버올</a></li>
								<li><a href="#">데님 팬츠</a></li>
								<li><a href="#">코튼 팬츠</a></li>
							</ul>
					</li>
					
				 <!-- 스포츠/기타5 -->
					<li>
						<a href="#" class="sidebar__nav__link">
							<i class=""><img class="sidebar__img" src="/resources/image/sidebar_sports.png"/></i>
							<span class="sidebar__nav__text">스포츠/기타<span class="sidebar__nav__text__ENG">Sports</span></span>
						</a>
						
							<ul class="sidebar__submenu">
								<li><a href="#">기능성 의류</a></li>
								<li><a href="#">수면/잠옷</a></li>
								<li><a href="#">교복</a></li>
								<li><a href="#">이벤트</a></li>
								<li><a href="#">수영복</a></li>
							</ul>
					</li>
					
				<!-- 신발6 -->
					<li>
						<a href="#" class="sidebar__nav__link">
							<i class=""><img class="sidebar__img" src="/resources/image/sidebar_shoes.png"/></i>
							<span class="sidebar__nav__text">신발<span class="sidebar__nav__text__ENG">Shoes</span></span>
						</a>
						
							<ul class="sidebar__submenu">
								<li><a href="#">구두</a></li>
								<li><a href="#">스니커즈</a></li>
								<li><a href="#">운동화</a></li>
								<li><a href="#">샌들/슬리퍼</a></li>
							</ul>
						
					</li>				
					
				<!-- 속옷7 -->
					<li>
						<a href="#" class="sidebar__nav__link">
							<i class=""></i>
							<span class="sidebar__nav__text">속옷<span class="sidebar__nav__text__ENG">Underwear</span></span>
						</a>
							<ul class="sidebar__submenu">
								<li><a href="#">남성 속옷</a></li>
							</ul>
						
						
					</li>
					
					
				</ul>
			</nav>
		</aside>
