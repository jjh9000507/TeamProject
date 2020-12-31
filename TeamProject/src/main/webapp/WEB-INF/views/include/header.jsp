<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file="/resources/css/header_css.css" %>
<%@ include file="/resources/css/loginForm_css.css" %>
<%@ include file="/resources/css/footer_css.css"%>
<%@ include file="/resources/css/memberVoInfoForm_css.css"%>


<!-- <link type="text/css" rel="stylesheet" href="/resources/css/header_css.css"> -->

<script>

$(function(){
	$(".allCategory, .allCategory_ul").on("mouseover" , function(){
		$(".allCategory_ul").show();
	});
	$(".allCategory, .allCategory_ul").on("mouseout" , function(){
		$(".allCategory_ul").hide();
	});	

	var msg = "${msg}";
	if (msg == "loginSuccess") {
		alert("로그인 성공");
	}else if (msg == "loginFail") {
		alert("로그인 실패");
	}else if (msg == "changePwSuccess") {
		alert("비밀번호 변경 성공");
	}else if (msg == "changePwFail") {
		alert("비밀번호 변경 실패(아이디가 잘못되었는지 확인하시오)");
	}else if (msg == "nonBuyerLoginSuccess"){
		alert("비회원으로 입장 하셨습니다.");
	}else if (msg == "logoutSuccess"){
		alert("로그아웃 되었습니다.");
	}
	
	$("#btnSearch").click(function(){
		var searchName = $("#txtSearch").val();
			console.log(searchName);
		var url = "/page/search?searchName=" + searchName;	
		location.href = url;
		
	});
	
}); // main function
</script>
<body>
 	<div class="container-fluid header_body">
	
		<div class="row">
		
			<!--top-header -->
			<div class="col-md-12 topHeader">
				<div class="col-md-2"></div>
				
					<div class="col-md-8">

					<c:choose>														
						<c:when test="${empty sessionScope.memberVo && empty sessionScope.nonBuyer}">
							<a href="/login/loginForm" type="submit" class="btn btn-link topHeader-button">로그인</a>
							<a href="/join/joinForm" type="button" class="btn btn-link topHeader-button">회원가입</a>
						</c:when>							
						<c:when test="${not empty sessionScope.memberVo && empty sessionScope.nonBuyer}">
							<a href="/logout" type="submit" class="btn btn-link topHeader-button">로그아웃</a>
						</c:when>
						<c:when test="${empty sessionScope.memberVo && not empty sessionScope.nonBuyer}">
							<a href="/logout" type="submit" class="btn btn-link topHeader-button">비회원 로그아웃</a>
						</c:when>
						
					</c:choose>						
					<a href="/cart/cartPage" class="btn btn-link topHeader-button">장바구니</a>
					<a type="button" class="btn btn-link topHeader-button">고객 센터</a>
	
					<c:if test="${sessionScope.memberVo.admin_check == 1}">
						<a href="/admin/adminForm" class="btn btn-link topHeader-button">관리자 페이지</a>
					</c:if>

					<c:choose>
						<c:when test="${empty sessionScope.memberVo && empty sessionScope.nonBuyer}">
							<a class="btn btn-link topHeader-button">회원정보 없음</a>
						</c:when>	
												
						<c:when test="${not empty sessionScope.memberVo && empty sessionScope.nonBuyer}">
							<a class="btn btn-link topHeader-button" href="/login/memberVoInfoForm/${sessionScope.memberVo.m_id}">${sessionScope.memberVo.m_id}님 반갑습니다.</a>
							<a href="/sellproduct/sellproductMain" type="button" class="btn btn-link topHeader-button">판매하기</a>
						</c:when>
						
						<c:when test="${empty sessionScope.memberVo && not empty sessionScope.nonBuyer}">
							<a class="btn btn-link topHeader-button">비회원 신분이십니다.</a>							
						</c:when>
					</c:choose>

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
						<input type="text" id="txtSearch" name="txtSearch" class="txtSearch" placeholder="검색어"/>
						<button type="button" id="btnSearch"><i class="fas fa-search"></i></button>
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

