<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto&display=swap" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="stylesheet" href="/resources/css/sidebar.css" />
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
