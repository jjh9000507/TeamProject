<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="stylesheet" href="/resources/css/sidebar.css" />
    
<%@ include file="../include/header.jsp"%>


<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<%@ include file="/resources/css/clothes.css"%>

<script>
$(function(){	
	var tabBtn = $("#tab-btn > ul > li");     //각각의 버튼을 변수에 저장
	var tabCont = $("#tab-cont > div");       //각각의 콘텐츠를 변수에 저장

	//컨텐츠 내용을 숨겨주세요!
	tabCont.hide().eq(0).show();

	tabBtn.click(function(){
	  var target = $(this);         //버튼의 타겟(순서)을 변수에 저장
	  var index = target.index();   //버튼의 순서를 변수에 저장
	  tabBtn.removeClass("active");    //버튼의 클래스를 삭제
	  target.addClass("active");       //타겟의 클래스를 추가
	  tabCont.css("display","none");
	  tabCont.eq(index).css("display","block");
	});
		
}); // main function

</script>

<br>

<!------------------------------------------ 상품 리스트 ---------------------------------------->
<div class="row">

	<div class="col-md-2"></div>
		<div class="col-md-8">
				<ul class="nowMenu">
					<li><a style="color:red;" href="/clothes/101">남성의류</a></li>
					
				</ul>
				
				<div id="tab-menu">
				  <div id="tab-btn">
				    <ul>
				      <li class="active"><a href="#">아우터</a></li>
				      <li><a href="#">상의</a></li>
				      <li><a href="#">바지</a></li>
				      <li><a href="#">스포츠</a></li>
				      <li><a href="#">신발</a></li>
				      <li><a href="#">속옷</a></li>
				    </ul>
				  </div>
				  
				  <div id="tab-cont">
				    <div><a href="#">후드집업</a><a href="#">코트</a><a href="#">가디건</a><a href="#">조끼</a><a href="#">자켓</a><a href="#">점퍼/야상/패딩</a><a href="#">수트/블레이저</a></div>
				    <div><a href="#">민소매</a><a href="#">반팔 티셔츠</a><a href="#">긴팔 티셔츠</a><a href="#">니트/스웨터</a><a>후드티</a><a>셔츠</a></div>
				    <div><a href="#">숏 팬츠</a><a href="#">점프슈트/오버올</a><a href="#">바지</a><a href="#">청바지</a></div>
				    <div><a href="#">기능성 의류</a><a href="#">수면/잠옷 (상의)</a><a href="#">교복</a><a href="#">이벤트</a><a href="#">수영복</a></div>
				    <div>모목도리</div>
				    <div>남성 속옷</div>
				  </div>
				</div>
		</div>
		<div class="col-md-2"></div>
</div>
		<div style="padding-top: 150px;">
			<div class="row listMain" style="position:relative;left:15%;">
				<div class="col-md-8 productList">
					
					<select style="float:right;">
						<option>가격</option>
						<option>이름</option>
					</select>
					
						<c:forEach var="male" items="${list}">
					<ul class="nav nav-pills list">
							<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="/resources/image/${male.p_thumbimg }"/></a></li>
							<li class="nav-item" style="width:372px;"><a class="nav-link productName" href="/page/content?p_no=${male.p_no}">${male.p_name }<br></a><span id="price">${male.p_price }</span>원<br> 무료배송</li>
							<li class="nav-item"><a class="nav-link seller">${male.p_seller}</a></li>
					</ul>
						</c:forEach>
				</div>
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
			<input type="hidden" id="morePage" name="morePage"/>
		</div>

	</div>
</div>

