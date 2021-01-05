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

<nav id="mainNav" role="navigation">
  <ul id="main-menu">
  	<!-- 카테고리1 -->	
  	<li style="width:90px;"><a href="#" id="allCategory">&#8801;</a>
    	<ul id="sub-menu" style="top:-21px; left:60%; width:200px;">
				<li><a href="#" class="submenuLink">전체 카테고리</a></li>
				<li><a href="#" class="submenuLink">전체 카테고리</a></li>
    	</ul>
    </li>
  	
  	
  <li class="sub-menu">
	  <a class="neon">HOT ITEM</a>
	</li>
  
  <!-- 카테고리6 -->
	<li class="sub-menu">
		<a class="sub-menu" id="divPlace" href="#">
			<span style="color:red; font-weight:bold;">내 주변 매물 찾기</span>
		</a>
	</li>
  
    <li><a href="#">패션의류</a>
    	<ul id="sub-menu">
    		<c:forEach var="mainCategories_1" items="${sessionScope.mainCategories_1}">
				<li><a href="/clothes/${mainCategories_1.cate_no }" class="submenuLink">${mainCategories_1.cate_name}</a></li>
			</c:forEach>
    	</ul>
    </li>
    
  <!-- 가구생활 -->
    <li><a href="#">가구생활</a>
      <ul id="sub-menu">
     	 <c:forEach var="mainCategories_2" items="${sessionScope.mainCategories_2}">
			<li><a href="/furniture/${mainCategories_2.cate_no}" class="submenuLink">${mainCategories_2.cate_name}</a></li>
	     </c:forEach>	
      </ul>
    </li>
    
   <!-- 컴퓨터 --> 
    <li ><a href="#">컴퓨터</a>
      <ul id="sub-menu">
     	 <c:forEach var="mainCategories_5" items="${sessionScope.mainCategories_5}">
			<li style="padding: 16px 25px;"><a href="/computerProduct/computersForm/${mainCategories_5.cate_no}" class="submenuLink">${mainCategories_5.cate_name}</a></li>
		 </c:forEach>
      </ul>
    </li>
    
    <!-- 가전 전자제품 -->
    <li><a href="#">가전·전자 제품</a>
      <ul id="sub-menu">
      	<c:forEach var="mainCategories_3" items="${sessionScope.mainCategories_3}">
			<li style="padding: 16px 51px;"><a href="/whitegoods/whitegoodsPage/${mainCategories_3.cate_no}" class="submenuLink">${mainCategories_3.cate_name}</a></li>
		</c:forEach>
      </ul>
    </li>
    
    <li><a href="#">기타등등</a>
    
    </li>
    
   
  </ul>
</nav>
