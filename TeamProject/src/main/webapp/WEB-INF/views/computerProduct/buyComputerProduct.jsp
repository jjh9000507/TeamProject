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
	var index = "";
	var comment_no = "";
	var inputBuyFormSendData = $(".inputBuyFormSendData");
	var searchBuyFormSendData = $(".searchBuyFormSendData");
	$("#confirmPrice").click(function() {
		var productNumber = $("#productNumber").val();
		console.log("productNumber:" + productNumber);
		priceFinal = price * productNumber;
		console.log("priceFinal:" + priceFinal);
		$("#finalPrice").text(priceFinal + "원");		
	});
	$("#detailProductExpain").click(function() {
		$("#inquireControll").hide();
		$("#commentTable").hide();
		$("#productExplainTable").hide();
		$("#productExplain").text("상품내용:" + "${buyComputerVo.c_com_content}");
		$("#productExplain").show();
	});
	$("#buyAfter").click(function() {
		$("#inquireControll").hide();
		$("#productExplain").hide();
		$("#productExplainTable").hide();
		$("#commentTable > tbody").empty();
		var indexAfter = 1;
		var url = "/computerProductComment/commentShow";
		var p_no = "${buyComputerVo.p_no}";
		var sendData = {
				"p_no" : p_no
			};		
		$.post(url,sendData, function(data) {
			$.each(data, function() {				
				var tr = $("#trTable").find("tr").clone();
				tr.find("td").eq(0).text(indexAfter);
				tr.find("td").eq(1).text(this.c_com_comment_content);
				tr.find("td").eq(2).text(this.c_com_comment_writer);
				tr.find("td").eq(3).text(this.c_com_comment_regdate);
				if("${sessionScope.memberVo.m_id}" == this.c_com_comment_writer){			
					tr.find("td").eq(4).find("button");
					tr.find("td").eq(5).find("button");			
					}else{
						tr.find("td").eq(4).empty();
						tr.find("td").eq(5).empty();				
					}
				tr.find("td").eq(6).text(this.c_com_comment_no);
				$("#commentTable").append(tr);
				indexAfter++;
			});			
		});
		$("#commentTable").show();
	});
	$("#inquireProduct").click(function() {
		$("#inquireControll").show();
		var indexInquire = 1;
		$("#commentTable").hide();
		$("#productExplain").hide();
		$("#productExplainTable > tbody").empty();
		var url = "/computerProductComment/inquireShow/${buyComputerVo.p_no}";
		$.get(url, function(data) {
			$.each(data, function() {				
				var tr = $("#productExplainTrTable").find("tr").clone();
				tr.find("td").eq(0).text(indexInquire);
				tr.find("td").eq(1).text(this.p_e_answer_status);
				tr.find("td").eq(2).text(this.p_e_inquiry_status);
				tr.find("td").eq(3).text(this.p_e_title);
				tr.find("td").eq(4).text(this.p_e_id);
				tr.find("td").eq(5).text(this.p_e_regdate);
				tr.find("td").eq(6).text(this.p_e_no);
				$("#productExplainTable").append(tr);
				indexInquire++;
			});
		});
			
		$("#productExplainTable").show();
	});
	$("#commentTable").on("click", ".btnCommentModify", function(){	
		comment_no = $(this).parent().parent().find("td").eq(6).text();
		console.log("comment_no:" + comment_no);
		$("#modal-modify").trigger("click");		
	});
	$("#updateAfterBuyProduct").click(function(){				
		var updateInput = $("#updateInput").val();
		console.log("c_com_comment_content:" + updateInput);
		var url = "/computerProductComment/updateRefContent";
		var sendData = {
			"c_com_comment_content" : updateInput,			
			"c_com_comment_no" : comment_no
		};
		$.post(url, sendData, function(data) {
			if(data == "success"){
				alert("후기 내용 변경 성공");
			}
		});		
	});
	$("#commentTable").on("click", ".btnCommentDelete", function(){
		comment_no = $(this).parent().parent().find("td").eq(6).text();
		console.log("comment_no:" + comment_no);
		var url = "/computerProductComment/deleteRef";
		var sendData = {							
				"c_com_comment_no" : comment_no
			};
			$.post(url, sendData, function(data) {
				if(data == "success"){
					alert("선택 후기 삭제 성공");
				}
			});
	});
	$("#inquireControll").on("click", "#inquireProductWrite", function(){
		$("#modal-inquireModal").trigger("click");
					
	});
	$("#inquireControll").on("click", "#searchInquireButton", function(){
		var indexInquire = 1;
		var search = $("#searchInquireListSearch").val();
		console.log("search:" + search);
		var buySelectInquireListSearchOption = $("#buySelectInquireListSearchOption option:selected").val();
		console.log("buySelectInquireListSearchOption:" + buySelectInquireListSearchOption);			
		var c_com_name = "${buyComputerVo.c_com_name}";
		var url = "/computerProductComment/searchInquireExplain";
		var sendData = {
			"p_e_title"	 : search,
			"p_e_inquiry_status" : buySelectInquireListSearchOption,
			"p_e_product"		: c_com_name
		};
		$("#productExplainTable > tbody").empty();
		$.post(url,sendData,function(data){
			$.each(data, function() {				
				var tr = $("#productExplainTrTable").find("tr").clone();
				tr.find("td").eq(0).text(indexInquire);
				tr.find("td").eq(1).text(this.p_e_answer_status);
				tr.find("td").eq(2).text(this.p_e_inquiry_status);
				tr.find("td").eq(3).text(this.p_e_title);
				tr.find("td").eq(4).text(this.p_e_id);
				tr.find("td").eq(5).text(this.p_e_regdate);
				tr.find("td").eq(6).text(this.p_e_no);
				$("#productExplainTable").append(tr);
				indexInquire++;
			});	
		});
		$("#productExplainTable").show();
	});
	$("#buySelectModalConfirm").click(function(){
		var p_e_contents = $("#p_e_contents").val();
		console.log("p_e_contents:" + p_e_contents);
		var buySelectModalVal = $("#buySelectModal option:selected").val();
		console.log("buySelectModalVal:" + buySelectModalVal);
		var inquireWriter = $("#getInquireId").val();
		console.log("inquireWriter:" + inquireWriter);
		var getInquireProduct = $("#getInquireProduct").val();
		console.log("getInquireProduct:" + getInquireProduct);
		var url = "/computerProductComment/insertInquireExpain";
		var sendData = {
				"p_e_title" : p_e_contents,
				"p_e_id"	: inquireWriter,
				"p_e_inquiry_status" : buySelectModalVal,
				"p_e_product"        : getInquireProduct
		};
		$.post(url,sendData,function(data){
			if(data == "success"){
				alert("상품문의 사항 전달 성공");
			}
		});
	});
	$("#buyProduct").click(function(){
		console.log("구매하기 버튼 클릭됨.");
		var price = parseInt($("#finalPrice").text());
		console.log("price:" + price);
		var seller = "${buyComputerVo.c_com_seller}";
		console.log("seller:" + seller);
		var productNum = $("#productNumber").val();
		console.log("productNum:" + productNum);
		var productName = "${buyComputerVo.c_com_name}";
		console.log("productName:" + productName);
		var sendMethod = $("#buySelectMenu option:selected").val();
		console.log("sendMethod:" + sendMethod);
		if(price == "" || productNum == ""){
			alert("내용정보 불충분");
		}else{
			searchBuyFormSendData.find("input").eq(0).val(price);
			searchBuyFormSendData.find("input").eq(1).val(seller);
			searchBuyFormSendData.find("input").eq(2).val(productNum);
			searchBuyFormSendData.find("input").eq(3).val(productName);
			searchBuyFormSendData.find("input").eq(4).val(sendMethod);
			$("#frmBuyFormSendData").submit();
		}		
	});
	$("#putBasket").click(function(){
		var current_id = "${sessionScope.memberVo.m_id}";
		console.log("current_id:" + current_id);
		var p_no = "${buyComputerVo.p_no}";
		console.log("p_no:" + p_no);
		
		var url = "/buyComputerProduct/putBasketProduct";
		
		var sendData = {
				"m_id" 	: current_id,
				"p_no"	: p_no
		};
		if(current_id == null || current_id == ""){
			alert("로그인 하시오.");
		}else{
			$.post(url,sendData,function(data){
				if(data == "success"){
					alert("해당 상품을 장바구니에 추가하였습니다.");
				}
			});
		}		
	});
});
</script>
<form role="form" id="frmBuyFormSendData" action="/buyComputerProduct/openBuyComputerProductDetail" method="post">
<div class="form-group searchBuyFormSendData" style="display:none;">
	<input type="text" name="price" value=""/>
	<input type="text" name="seller" value=""/>
	<input type="text" name="productNum" value=""/>
	<input type="text" name="productName" value=""/>
	<input type="text" name="sendMethod" value=""/>
</div>
</form>

<div class="row">
		<div class="col-md-12">
			 <a id="modal-modify" href="#modal-container-modify" role="button" style="display: none;" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-modify" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog inputModifyModal" role="document">
					<div class="modal-content inputModifyModal">
						<div class="modal-header inputModifyModal">
							<h5 class="modal-title" id="myModalLabel">
								구매후기 수정 폼
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body inputModifyModal">
							<label>구매후기 내용 수정</label>	
						<input type="text" class="form-control" id="updateInput" name="c_com_comment_content" placeholder="구매후기 내용 수정사항"/>
						<input type="text" style="display: none;" id="getId" value="${buyComputerVo.c_com_seller}"/>
						</div>
						<div class="modal-footer">
							<button type="button" id="updateAfterBuyProduct" class="btn btn-primary">
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
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-inquireModal" href="#modal-container-inquireModal" role="button"  style="display: none;" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-inquireModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								상품문의 작성
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<select id="buySelectModal">
							<option value="상품문의" selected="selected">상품문의</option>
							<option value="배송">배송</option>
							<option value="교환">교환</option>
							<option value="반품/취소/환불">반품/취소/환불</option>
							<option value="기타">기타</option>
						</select>								
						<input type="text" class="form-control" name="p_e_contents" id="p_e_contents" placeholder="상품문의 사항 작성"/>
						<input type="text" style="display: none;" id="getInquireId" value="${buyComputerVo.c_com_seller}"/>
						<input type="text" style="display: none;" id="getInquireProduct" value="${buyComputerVo.c_com_name}"/>
						</div>
						<div class="modal-footer">							 
							<button type="button" id="buySelectModalConfirm" class="btn btn-primary">
								작성완료
							</button> 
							<button type="button" id="buySelectModalCancle" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
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
					<td style="display: none;"></td>					
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
					<td style="display: none;"></td>					
				</tr>
			</table>
</nav>
<nav class="buynav">
<c:choose>
<c:when test="${buyComputerVo.c_com_pic == null}">
<img src="/resources/computerImage/default.png" width="400px" height="300px"/>
</c:when>
<c:otherwise>
<img src="/resources/image/main_logo2.png" width="400px" height="300px"/>
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
							<span>${indexName[0]}</span> 카테고리내에서의 구매율:
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
							<select id="buySelectMenu">
							<option value="택배무료배송" selected="selected">택배무료배송</option>
							<option value="직접방문수령">직접방문수령</option>
							<option value="퀵서비스">퀵서비스</option>
						</select>
						</td>						
					</tr>
					<tr>
						<td>
							<button type="button" id="putBasket">장바구니</button>
							<button type="button" id="buyProduct">구매하기</button>
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
<li class="nav-item"><button id="buyAfter">구매후기(<span>${computerCommentCount}</span>)</button></li>&nbsp&nbsp&nbsp
<li class="nav-item"><button id="inquireProduct">상품문의(<span>${productExplainCount}</span>)</button></li>
</ul>
</footer>
<aside class="buyrightdownaside">
</aside>
<nav class="buyleftbeneathdownnav">
</nav>
<footer class="buybeneathfooter">
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
		<div>
		<ul class="nav nav-tabs breadcrumb" id="inquireControll" style="display: none;">
		<li class="nav-item"><input placeholder="검색어 입력" id="searchInquireListSearch" type="text"/><button type="button" id="searchInquireButton">검색</button></li>&nbsp&nbsp&nbsp
		<li class="nav-item">						 
				<select id="buySelectInquireListSearchOption">
							<option value="상품문의" selected="selected">상품문의</option>
							<option value="배송">배송</option>
							<option value="교환">교환</option>
							<option value="반품/취소/환불">반품/취소/환불</option>
							<option value="기타">기타</option>
						</select>			
			</li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<li class="nav-item"><button id="inquireProductWrite">상품문의</button></li>
		</ul>
		</div>	
			<table class="table" id="productExplainTable" style="display: none;">
				<thead>
					<tr>
						<th>번호</th>
						<th>답변상태</th>
						<th>문의유형</th>
						<th>문의내용</th>
						<th>작성자</th>
						<th>작성일자</th>												
						<th></th>												
					</tr>
				</thead>
				<tbody id="productExplainTbody">
				</tbody>
			</table>
		</div>	
</div>
</footer>
<aside class="buyrightbeneathdownaside">
</aside>
</div>
</div>
</div>
