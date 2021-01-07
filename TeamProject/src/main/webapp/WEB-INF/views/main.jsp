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
	
	// 메인 카테고리 스크롤 이동 시에 따라오기
	$(window).scroll(function() {
		var position = $(window).scrollTop(); // 현재 스크롤 위치
		
		if(position >= 200) {
			$(".borderAllCategory").css("position" , "fixed");	
			$(".borderAllCategory").css("top" , "0");	
			$(".borderAllCategory").css("z-index" , "2");	
			$(".borderAllCategory").css("background" , "white");	
		} else if (position <= 200) {
			$(".borderAllCategory").css("position" , "");	
			$(".borderAllCategory").css("top" , "");	
			$(".borderAllCategory").css("z-index" , "");	
			$(".borderAllCategory").css("background" , "");
		}
	});
	
}); // main function


</script>


<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
	
<div class="row">
<div class="col-md-12 borderAllCategory" >
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="include/header_mainCatagories.jsp"%>
</div>
<br>

<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->

	</div>
</div>
		<div class="col-md-2"></div>

			<div class="row">
				<div class="col-md-12">
					<div class="carousel slide" id="carousel-849276" data-interval="4000">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-849276"></li>
							<li data-slide-to="1" data-target="#carousel-849276"></li>
							<li data-slide-to="2" data-target="#carousel-849276"
								class="active"></li>
						</ol>
						<div class="carousel-inner">
						
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap First"
									src="/resources/image/mainimage1.jpg" />
								<div class="carousel-caption">
									<h4>First Thumbnail label</h4>
									<p>소개글</p>
								</div>
							</div>
							
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap Second"
									src="/resources/image/mainimage2.jpg" />
								<div class="carousel-caption">
									<h4>Second Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
							
							<div class="carousel-item active">
								<img class="d-block w-100" alt="Carousel Bootstrap Third"
									src="/resources/image/mainimage3.jpg" />
								<div class="carousel-caption">
									<h4>Third Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carousel-849276"
							data-slide="prev"><span class="carousel-control-prev-icon"></span>
							<span class="sr-only">Previous</span></a> <a
							class="carousel-control-next" href="#carousel-849276"
							data-slide="next"><span class="carousel-control-next-icon"></span>
							<span class="sr-only">Next</span></a>
					</div>
					
					<!------------------------------------------ 상품 리스트 ---------------------------------------->
					
	<div class="col-md-2"></div>
					
		<div style="padding-top: 40px;">
			<div class="row listMain">
					
			</div>
				<div class="col-md-8 productList" style="left: 25%;">
					
					<!-- 히든(복사) 데이터 -->
					<ul class="nav nav-pills list" style="display:none;">
						<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="resources/image/shirt.jpg"/></a></li>
						<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#">슬림면스판나시 짱짱한원단 L~XXL 남자나시 타투나시<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
				</div>
				<div class="col-md-2"></div>
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
					
				</div>
			</div>


<!------------------------------------------ 더보기 버튼 ---------------------------------------->
<br>
<div class="row">
	<div class="col-md-12 btnMore">
		<div class="form-control divMore">
			<a href="#" class="a_More">더보기  <span class="arrow"><img src="resources/image/arrow.PNG"/></span></a>
			<input type="hidden" id="morePage" name="morePage"/>
		</div>

	</div>
</div>


