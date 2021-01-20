<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav id="mainNav" role="navigation">
  <ul id="main-menu">
  
  	<!-- 전체 카테고리  -->	
  	<li><a href="#" id="allCategory">&#8801;</a>
    	<ul class="sub-menu" style="top: 60%;position: absolute;left: 50%;display: none;">
				<li><a href="#" class="submenuLink">전체 카테고리</a></li>
				<li><a href="#" class="submenuLink">전체 카테고리</a></li>
    	</ul>
    </li>

  <!-- 메인 카테고리 목록 -->
	<li><a id="divPlace" href="/auction/auctionMain"><span style="color:red; font-weight:bold;">메인으로</span></a></li>
	<li><a href="/auction/auctionSellList">판매 상품</a></li>
	<li><a href="/auction/auctionPurchaseList">구매 상품</a></li>
	<li><a href="#">결제한 상품 내역</a></li>
	<li><a href="#">결제된 상품 내역
		<!--<c:if test="${sidebarCount > 0 }">
			<span style="color:red">(${sidebarCount})</span>
		</c:if>-->
		</a></li>
	<li><a href="/auction/auctionResisterList">상품 등록</a></li>
	<li><a href="#">관심 상품</a></li>
  </ul>
</nav>
