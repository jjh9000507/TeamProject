	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jsp"%>


<script>
$(function(){
	$(".divMore").click(function(e){		
		e.preventDefault();
	var startNum = $(".list").length;
		
		console.log(startNum);
		
	var url = "/page/morePage";
	var sendData = {
		"startNum" : startNum	
	};
		$.get(url, sendData, function(data){
			$.each(data, function(){
// 				console.log(data);
				var ul = $(".productList > ul:eq(0)").clone();
					ul.find("img").eq(0).attr("src" ,"resources/image/" + this.p_thumbimg);  // 썸네일
					ul.find("a").eq(1).text(this.p_name);  // 상품이름
					ul.find("span").eq(0).text(this.p_price);  // 상품가격
					ul.find("a").eq(2).text(this.p_seller);  // 판매자
					ul.css("display" , "");
// 				 $(".productList > ul:eq(0)").remove();
					$(".productList").append(ul);
			});
		});
		
// 		startNum = startNum + 1;
	});
}); // main function

</script>


<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
	
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="include/header_mainCatagories.jsp"%>
<br>

<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
<div class="col-md-2"></div>

<div class="col-md-8">
	<div class="lblHOT">
	  <div class="neon">HOT ITEM</div>
</div>

</div>
<div class="col-md-2"></div>




<!------------------------------------------ 상품 리스트 ---------------------------------------->
		<div style="padding-top: 150px;">
<%-- 		${list} --%>
			<div class="row listMain">
			
					<ul class="nav nav-tabs listMenu">
						<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
						<li class="nav-item"><a class="nav-link" href="#">백화점</a></li>
						<li class="nav-item"><a class="nav-link" href="#">중고</a></li>
						<li class="nav-item"><a class="nav-link" href="#">기타</a></li>
					</ul>
					
				<div class="col-md-8 productList">
					
					<!-- 히든(복사) 데이터 -->
					<ul class="nav nav-pills list" style="display:none;">
						<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="/resources/image/shirt.jpg"/></a></li>
						<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
<!-- 					검색 데이터 -->
					<c:forEach var="list" items="${list}">
						<ul class="nav nav-pills list">
							<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="/resources/image/${list.p_thumbimg}"/></a></li>
							<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#">${list.p_name}<br></a><span id="price">${list.p_price}</span>원<br> 무료배송</li>
							<li class="nav-item"><a class="nav-link seller">${list.p_seller}</a></li>
						</ul>
					</c:forEach>
					
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
	</div>
</div>
		
		<div class="col-md-2"></div>


<!------------------------------------------ 더보기 버튼 ---------------------------------------->
<br>
<div class="row">
	<div class="col-md-12 btnMore">
		<div class="form-control divMore">
			<a href="#" class="a_More">더보기  <span class="arrow"><img src="/resources/image/arrow.PNG"/></span></a>
			<input type="hidden" id="morePage" name="morePage"/>
		</div>

	</div>
</div>


