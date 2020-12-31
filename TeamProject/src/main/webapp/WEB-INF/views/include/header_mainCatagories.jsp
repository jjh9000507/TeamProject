<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
$(function(){
	
	$("#divPlace").click(function() {
		modalTrigger();
	});
	
// 	$(".menuLink , .submenu").bind({
// 		"mouseover" : function() {
// 			$("#carousel-849276").css("margin-top", "50px");
// 		},
// 		"mouseout" : function() {
// 			console.log("out");
// 			$("#carousel-849276").css("margin-top", "0px");
// 		}
// 	});

});
</script>



<nav id="topMenu">
	<ul>
		<!-- 카테고리1 -->
		<li class="topMenuLi"><a class="menuLink" id="lblAllCategory" href="#">&#8801;</a>
			<ul class="allCategory_ul">
				<li><a href="#" class="submenuLink">전체카테고리1</a></li>
				<li><a href="#" class="submenuLink">전체카테고리1</a></li>
				<li><a href="#" class="submenuLink">전체카테고리1</a></li>
			</ul>
			</li>
			
		<li class="topMenuLi"><a class="menuLink" id="lblAllCategory" href="#"><span class="lblHOT"></span></a>
	  <a class="neon">HOT ITEM</a>
			</li>
			
		<!-- 카테고리1 -->
		<li class="topMenuLi"><a class="menuLink" href="#">패션의류</a>
			<ul class="submenu">
				<li><a href="/clothes/maleClothes" class="submenuLink">남성의류</a></li>
				<li><a href="/clothes/feMaleClothes" class="submenuLink">여성의류</a></li>
				<li><a href="/clothes/publicClothes" class="submenuLink">남녀공용</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리2 -->
		<li class="topMenuLi"><a class="menuLink" href="#">가구 생활</a>
			<ul class="submenu">
				<li><a href="/furniture/house" class="submenuLink">가정</a></li>
				<li><a href="/furniture/office" class="submenuLink">사무</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리3 -->
		<li class="topMenuLi"><a class="menuLink" href="#">컴퓨터</a>
			<ul class="submenu">
				<li><a href="/computerProduct/computersForm/501" class="submenuLink">데크스탑</a></li>
				<li><a href="/computerProduct/computersForm/502" class="submenuLink">노트북</a></li>				
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리4 -->
		<li class="topMenuLi"><a class="menuLink" href="#">가전·전자 제품</a>
			<ul class="submenu">
				<li><a href="/whitegoods/whitegoodsPage/301" class="submenuLink">영상 가전</a></li>
				<li><a href="/whitegoods/whitegoodsPage/302" class="submenuLink">계절 가전</a></li>
				<li><a href="/whitegoods/whitegoodsPage/303" class="submenuLink">주방 가전</a></li>
				<li><a href="/whitegoods/whitegoodsPage/304" class="submenuLink">생활 가전</a></li>
				<li><a href="/whitegoods/whitegoodsPage/305" class="submenuLink">기타</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리5 -->
		<li class="topMenuLi"><a class="menuLink" href="#">기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리6 -->
		<li class="topMenuLi"><a class="menuLink" id="divPlace" href="#">
						<span style="color:red;">내 주변 매물 찾기</span>
							</a>
							
			</li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리7 -->
		<li class="topMenuLi"><a class="menuLink" href="#">기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타2</a></li>
			</ul></li>
			
		<!-- 카테고리8 -->
		<li class="topMenuLi"><a class="menuLink" href="#">기타등등</a>
			<ul class="submenu">
				<li><a href="#" class="submenuLink">기타1</a></li>
			</ul></li>
		
		</ul>
	</nav>
