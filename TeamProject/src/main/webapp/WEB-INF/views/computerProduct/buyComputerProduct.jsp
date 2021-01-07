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
		$("#productExplainTable").hide();
		$("#productExplain").text("상품내용:" + "${buyComputerVo.c_com_content}");
		$("#productExplain").show();
	});
	$("#buyAfter").click(function() {
		$("#productExplain").hide();
		$("#productExplainTable").hide();
		$("#commentTable > tbody").empty();
		var tr = $("#trTable").find("tr").clone();
		tr.find("td").eq(0).text("0");
		tr.find("td").eq(1).text("1");
		tr.find("td").eq(2).text("${buyComputerVo.c_com_seller}");
		tr.find("td").eq(3).text("3");
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
		$("#commentTable").hide();
		$("#productExplain").hide();
		$("#productExplainTable > tbody").empty();
		var tr = $("#productExplainTrTable").find("tr").clone();
		tr.find("td").eq(0).text("0");
		tr.find("td").eq(1).text("1");
		tr.find("td").eq(2).text("2");
		tr.find("td").eq(3).text("3");
		tr.find("td").eq(4).text("4");
		tr.find("td").eq(5).text("5");
		$("#productExplainTable").append(tr);	
		$("#productExplainTable").show();
	});
	$("#commentTable").on("click", ".btnCommentModify", function(){
		$("#modal-modify").trigger("click");
	});
	$("#commentTable").on("click", ".btnCommentDelete", function(){
		alert("구매후기 삭제");
	});
	
});
</script>
<div class="row">
		<div class="col-md-2"></div>
<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<div class="row">
		<div class="col-md-12">
			 <a id="modal-modify" href="#modal-container-modify" role="button" style="display: none;" class="btn" data-toggle="modal">Launch demo modal</a>
			<div class="modal fade" id="modal-container-modify" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								구매후기 수정 폼
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							...
						</div>
						<div class="modal-footer">							 
							<button type="button" class="btn btn-primary">
								변경
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
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
						컴퓨터
					</li>
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
							class="btn btn-xs btn-primary btnCommentModify">수정</button>
					</td>
					<td>
					<button type="button"
							class="btn btn-xs btn-warning btnCommentDelete">삭제</button>
					</td>					
				</tr>
			</table>
<table style="display: none;" id="productExplainTrTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>					
				</tr>
			</table>
</nav>
<nav class="buynav">
<c:choose>
<c:when test="${buyComputerVo.c_com_pic == null}">
<img src="/resources/computerImage/default.png" width=100% height=70%/>
</c:when>
<c:otherwise>
<img src="/resources/image/main_logo2.png" width=100% height=70%/>
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
							<button id="putBasket">장바구니</button>
							<button id="buyProduct">구매하기</button>
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
<div class="row">
		<div class="col-md-12">			
			<table class="table" id="productExplainTable" style="display: none;">
				<thead>
					<tr>
						<th>번호</th>
						<th>답변상태</th>
						<th>문의유형</th>
						<th>문의제목</th>
						<th>작성자</th>
						<th>작성일자</th>						
					</tr>
				</thead>
				<tbody id="productExplainTbody">
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