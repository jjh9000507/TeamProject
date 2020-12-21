<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file="/resources/css/header_css.css" %>
<!-- <link type="text/css" rel="stylesheet" href="/resources/css/header_css.css"> -->

<script>

$(function(){
	$(".allCategory, .allCategory_ul").on("mouseover" , function(){
		$(".allCategory_ul").show();
	});
	$(".allCategory, .allCategory_ul").on("mouseout" , function(){
		$(".allCategory_ul").hide();
	});
	
});
</script>

<body>

	<div class="container-fluid header_body">
		<div class="row">
		
			<!--top-header -->
			<div class="col-md-12 topHeader">
				<div class="col-md-2"></div>
				
					<div class="col-md-8">
						<c:choose>
							<c:when test="${empty sessionScope.memberVo}">
								<a href="/loginForm" type="button" class="btn btn-link topHeader-button">로그인</a>
								<a type="button" class="btn btn-link topHeader-button">회원가입</a>
							</c:when>
							<c:otherwise>
								<a href="#" type="button" class="btn btn-link topHeader-button">판매하기</a>
							</c:otherwise>
						</c:choose>
						<a type="button" class="btn btn-link topHeader-button">장바구니</a>
						<a type="button" class="btn btn-link topHeader-button">고객 센터</a>
					</div>
					
				<div class="col-md-2"></div>
			</div>
			
		<div class="col-md-12 borderAllCategory">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			
			<!--  전체 카테고리 보이기 --> 
				<br>
					<div class="allCategory">
						<a type="button">&#8801;<label class="lblAllCategory"> 전체카테고리</label></a>
					</div>				
					
			<!-- Home 버튼 -->		
				<div class="divHome">
					<a type="button" href="/" class="btn btn-link btnHome"><img class="default" src="/resources/image/main_logo.png"/> 중고 동네	</a>
				</div>
				
				<br>
				
			<!-- 검색 창 -->		
					<div class="container-1">
						<input type="text" id="txtSearch" class="txtSearch" placeholder="검색어"/>
						<button id="btnSearch"><i class="fas fa-search"></i></button>
					</div>
				
				<br>
				
		

<!--------------------------------------- 전체 카테고리 메뉴 ----------------------------------------->
					<ul class="allCategory_ul">
					 	<li><a href="#">상의상의</a></li>
					 	<li><a href="#">하의하의</a></li>
					 	<li><a href="#">신발신발</a></li>
					 	<li><a href="#">기타기타</a></li>
					 	<li><a href="#">기타기타</a></li>
					</ul>
					

					</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>

