<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/buyComputerProduct_css.css" %>
<%@ include file="../include/header.jsp"%>
<script>
$(function(){
	var price = "${buyComputerVo.c_com_price}";
	var priceFinal = "";
	$("#confirmPrice").click(function() {
		var productNumber = $("#productNumber").val();
		console.log("productNumber:" + productNumber);
		priceFinal = price * productNumber;
		console.log("priceFinal:" + priceFinal);
		$("#finalPrice").text(priceFinal + "원");
		
	});
	$("#detailProductExpain").click(function() {
		$("#commentTable").hide();
		$("#productExplain").text("${buyComputerVo.c_com_content}");
		$("#productExplain").show();
	});
	$("#buyAfter").click(function() {
		
		$("#commentTable > tbody").empty();
		var tr = $("#trTable").find("tr").clone();
		tr.find("td").eq(0).text("제발");
		tr.find("td").eq(1).text("되라");
		tr.find("td").eq(2).text("쫌");
		tr.find("td").eq(3).text("부자");
		if("${buyComputerVo.c_com_seller}" != null){
			
			tr.find("td").eq(4).find("button");
			tr.find("td").eq(5).find("button");
			}else{
				tr.find("td").eq(4).empty();
				tr.find("td").eq(5).empty();
			}
		$("#commentTable").append(tr);	
		$("#commentTable").show();
	});
	$("#inquireProduct").click(function() {
		
	});
});
</script>

<div class="row">
		<div class="col-md-2"></div>
<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>
	</div>
	<div class="col-md-2"></div>
</div>	
<br>
<br>
<div class="row">
<div class="col-md-12">
<div class="buycomputersFormDiv">
<nav class="buyleftupnav">
</nav>
<header class="buyheader">
<div class="row">
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						${indexName[2]}
					</li>
					<li class="breadcrumb-item">
						${indexName[1]}
					</li>
					<li class="breadcrumb-item">
						${indexName[0]}
					</li>
				</ol>
			</nav>
		</div>
	</div>
</header>
<aside class="buyrightupaside">
</aside>
<nav class="buyleftnav">
<table style="display: none;" id="trTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
					<button type="button"
							class="btn btn-xs btn-warning btnCommentModify">수정</button>
					</td>
					<td>
					<button type="button"
							class="btn btn-xs btn-danger btnCommentDelete">삭제</button>
					</td>
				</tr>
			</table>
</nav>
<nav class="buynav">
<c:choose>
<c:when test="${buyComputerVo.c_com_pic == null}">
<img src="/resources/computerImage/default.png"/>
</c:when>
<c:otherwise>
<img src="/resources/image/main_logo2.png"/>
</c:otherwise>
</c:choose>
</nav>
<aside class="buyaside">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							${buyComputerVo.c_com_name}
						</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<span>${buyComputerVo.c_com_price}</span>원
						</td>						
					</tr>
					<tr>
						<td>
							전체판매상품 중 선호도:
							<div class="progress">
								<div class="progress-bar w-75">
								</div>
							</div>
						</td>						
					</tr>					
					<tr>
						<td>
							상품수량선택:&nbsp
							<input id="productNumber" type="number" min="0" max="100" step="1"/>
							<button type="button" id="confirmPrice">결정</button>
						</td>						
					</tr>
					<tr>
						<td>
							총 상품금액:<span id="finalPrice"></span>
						</td>						
					</tr>
					<tr>
						<td>
							<div class="dropdown">				 
				<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
					배송방법을 선택하시오
				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					 <a class="dropdown-item disabled" href="#">택배-무료배송</a> 
					 <a class="dropdown-item" href="#">직접방문수령</a> 
					 <a class="dropdown-item" href="#">퀵서비스</a>
				</div>
			</div>
						</td>						
					</tr>
					<tr>
						<td>
							<button>장바구니</button>
							<button>구매하기</button>
						</td>						
					</tr>
				</tbody>
			</table>
		</div>
	</div>			
</aside>
<aside class="buyrightaside">
</aside>
<nav class="buyleftdownnav">
</nav>
<footer class="buyfooter">
<ul class="nav nav-tabs breadcrumb">
<li class="nav-item"><button id="detailProductExpain">상세설명</button></li>&nbsp&nbsp&nbsp
<li class="nav-item"><button id="buyAfter">구매후기<span>(n)</span></button></li>&nbsp&nbsp&nbsp
<li class="nav-item"><button id="inquireProduct">상품문의<span>(n)</span></button></li>
</ul>
<div class="row">
		<div class="col-md-12">
			<p style="display: none;" id="productExplain">
				
			</p>
		</div>
	</div>
<div class="row">
		<div class="col-md-12">			
			<table class="table" id="commentTable" style="display: none;">
				<thead>
					<tr>
						<th>댓글번호</th>
						<th>댓글내용</th>
						<th>작성자</th>
						<th>날짜</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody id="tableTbody">
				</tbody>
			</table>
		</div>
	</div>
</footer>
<aside class="buyrightdownaside">
</aside>
</div>
</div>
</div>