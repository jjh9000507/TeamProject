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
.productList {
	padding : 0px;
	margin-left: auto;
	margin-right: auto;
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
					
				<div class="col-md-2"></div>
				<div class="col-md-8 whitegoodsList">
				
					<c:forEach var="whitegoodsVo" items="${WhitegoodsList}">
						<ul class="nav nav-pills list">
							<li class="nav-item"><a class="nav-link" href="/whitegoods/detailWhitegoods/${whitegoodsVo.w_no}"><img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${whitegoodsVo.w_thumbimg}" style="width:140px; height:200px;"/></a></li>
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