	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="include/header.jsp"%>


<script>
$(function(){
	$(".divMore").click(function(){
		
	var startNum = $(".list").length;
	console.log(startNum);
	});
});

</script>


<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
	
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="include/header_mainCatagories.jsp"%>
<br>

<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->


<!------------------------------------------ 상품 리스트 ---------------------------------------->
		<div style="padding-top: 150px;">
			<div class="row listMain">
				${sessionScope.memberVo}
					<ul class="nav nav-tabs listMenu">
						<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
						<li class="nav-item"><a class="nav-link" href="#">백화점</a></li>
						<li class="nav-item"><a class="nav-link" href="#">중고</a></li>
						<li class="nav-item"><a class="nav-link" href="#">기타</a></li>
					</ul>
					
				<div class="col-md-8 productList">
				
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="#"><img src="/resources/image/shirt.jpg"/></a></li>
						<li class="nav-item"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
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


<!------------------------------------------ 페이지네이션 ---------------------------------------->
<br>
<div class="row">

	<div class="col-md-12 btnMore">
		<div class="form-control divMore">
			<a href="#" class="a_More">더보기  <span class="arrow"><img src="/resources/image/arrow.PNG"/></span></a>
		</div>
<!-- 		<nav> -->
		
		
<!-- 			<ul class="pagination page_ul" style="justify-content:center;" > -->
			
<!-- 				이전 -->
<!-- 				<li class="page-item"><a class="page-link page_move" href="#">이전</a></li> -->
				
<!-- 				페이지 1 ~ 10 -->
<%-- 					<c:forEach var="i" begin="1" end="7"> --%>
<%-- 						<li class="page-item"><a class="page-link page_num" href="#">${i}</a></li> --%>
<%-- 					</c:forEach> --%>
					
<!-- 				다음	 -->
<!-- 				<li class="page-item"><a class="page-link page_move" href="#">다음</a></li> -->
				
<!-- 			</ul> -->
<!-- 		</nav> -->
	</div>
</div>


