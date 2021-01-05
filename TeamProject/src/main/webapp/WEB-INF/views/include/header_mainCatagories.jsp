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
				<c:forEach var="mainCategories_1" items="${mainCategories_1}">
					<li><a href="/clothes/${mainCategories_1.cate_no }"  class="submenuLink">${mainCategories_1.cate_name}</a></li>
				</c:forEach>
			</ul>
		</li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리2 -->
		<li class="topMenuLi"><a class="menuLink" href="#">가구 생활</a>
			<ul class="submenu">
				<c:forEach var="mainCategories_2" items="${mainCategories_2}">
					<li><a href="/furniture/${mainCategories_2.cate_no}" class="submenuLink">${mainCategories_2.cate_name}</a></li>
				</c:forEach>		
			</ul>
		</li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리3 -->
		<li class="topMenuLi"><a class="menuLink" href="#">컴퓨터</a>
			<ul class="submenu">
				<c:forEach var="mainCategories_5" items="${mainCategories_5}">
					<li><a href="/computerProduct/computersForm/${mainCategories_5.cate_no}" class="submenuLink">${mainCategories_5.cate_name}</a></li>
				</c:forEach>
				
			</ul></li>

		<!-- 						<li>|</li> -->

		<!-- 카테고리4 -->
		<li class="topMenuLi"><a class="menuLink" href="#">가전·전자 제품</a>
			<ul class="submenu">
				<c:forEach var="mainCategories_3" items="${mainCategories_3}">
					<li><a href="/whitegoods/whitegoodsPage/${mainCategories_3.cate_no}" class="submenuLink">${mainCategories_3.cate_name}</a></li>
				</c:forEach>
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
