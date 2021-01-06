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
   <c:forEach var="CategoryVo" items="${sessionScope.firstCategory}">
   <li><a href="#">${CategoryVo.cate_name}</a>
      <ul id="sub-menu">
     	 <c:forEach var="subCategoryVo" items="${sessionScope.AllCategory}">
			<c:if test="${subCategoryVo.cate_ref == CategoryVo.cate_no}">
				<li style="padding: 16px 25px;"><a href=
					<c:choose>
						<c:when test="${CategoryVo.cate_no == 10}">
						"/clothes/${subCategoryVo.cate_no}"
						</c:when>
						
						
						<c:when test="${CategoryVo.cate_no == 20}">
						"/furniture/${subCategoryVo.cate_no}"
						</c:when>
						
						<c:when test="${CategoryVo.cate_no == 30}">
						"/whitegoods/whitegoodsPage/${subCategoryVo.cate_no}"
						</c:when>
						
						<c:when test="${CategoryVo.cate_no == 50}">
						"/computerProduct/computersForm/${subCategoryVo.cate_no}"
						</c:when>
						<c:otherwise>
						"#"
						</c:otherwise>
					</c:choose>
				 class="submenuLink">${subCategoryVo.cate_name}</a></li>
			</c:if>
		 </c:forEach>
      </ul>
    </li>
    </c:forEach>
  </ul>
</nav>
