<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/computersForm_css.css" %>
<%@ include file="../include/header.jsp"%>
<script>
$(function() {
	var inputCheckbox = $(".checkB");
	var inputCheckForm = $("#divData");
	var backList = $(".backList");
	var detailSearchFormFind = $(".detailSearchFormFind");
	var searchInComputerInfo = $(".searchInComputerInfo");
	var searchInComputerPriceSend = $(".searchInComputerPriceSend");
	var searchInComputerPriceForm = $(".searchInComputerPriceForm");
	
	$("#checkboxSearch").click(function() {
		inputCheckForm.empty();		
		for(var i = 0; i<6; i++){
			if(inputCheckbox.find("input").eq(i).is(":checked") == true){
				var indexCheckBox = "check"+i + "no";
				console.log("indexCheckBox:"+ indexCheckBox);
				var input = inputCheckbox.find("input").eq(i).clone();
				input.attr("name",indexCheckBox);
				inputCheckForm.append(input);			
			}
		}
		if((inputCheckbox.find("input").eq(0).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(1).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(2).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(3).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(4).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(5).is(":checked") == false)			
			){
			alert("체크항목 없음");	
		}else{			
		$("#frmData").submit();
		}						
	});
	$("#computersBack").click(function() {		
		inputCheckForm.empty();		
 		for(var i = 0; i<6; i++){
 			var indexCheckBox = "check"+i + "no";
 			var input = backList.find("input").eq(i).clone();
 			var inputVal = backList.find("input").eq(i).val();
 			if(inputVal != null){
 			var nthNum = inputVal.length;
 			console.log("inputValLength:" + nthNum);	
 			var nthNumSubstring = inputVal.substring(0,nthNum-1);
 			console.log("input:" + input);
 			console.log("inputVal:" + inputVal);
 			console.log("inputValLengthSubstring:" + nthNumSubstring);
 			
 			input.attr("name",indexCheckBox);
			
 			input.attr("value", nthNumSubstring);
 			inputCheckForm.append(input);
 			}
 		}
 		var inputConfirm = backList.find("input").eq(0).val();
 		if(inputConfirm != null){
 			var nth = inputConfirm.length;
 	 		if(nth == 3){
 	 				alert("뒤로 갈수  없음");	
 	 			}else{
 	 				$("#frmData").submit(); 	 			
 	 			}	
 		}	
	});	
	$("#detailSearch").click(function() {
		searchInComputerInfo.empty();
		var inputName = detailSearchFormFind.find("input").clone();
		var inputVal = detailSearchFormFind.find("input").val();
		console.log("inputVal:"+ inputVal);
		searchInComputerInfo.append(inputName);
		for(var i = 0; i<6; i++){
			var searchIndex = "search"+i + "no";
 			var input = backList.find("input").eq(i).clone();
 			console.log("searchIndex_name:" + searchIndex);
 			input.attr("name",searchIndex);
 			searchInComputerInfo.append(input);
		}
		if(inputVal == ""){
			alert("검색어를 입력하시오.");
		}else{
			
 		$("#frmSearchData").submit();
		}
		});
	
	
	$("#detailPrice").click(function() {
		searchInComputerPriceSend.empty();
		var inputName1 = searchInComputerPriceForm.find("input").eq(0).clone();
		var inputName2 = searchInComputerPriceForm.find("input").eq(1).clone();
		var inputValue1 = searchInComputerPriceForm.find("input").eq(0).val();
		var inputValue2 = searchInComputerPriceForm.find("input").eq(1).val();
		console.log("inputValue1:" + inputValue1);
		console.log("inputValue2:" + inputValue2);
		searchInComputerPriceSend.append(inputName1);
		searchInComputerPriceSend.append(inputName2);
		for(var i = 0; i<6; i++){
			var searchIndex = "search"+i + "no";
 			var input = backList.find("input").eq(i).clone();
 			console.log("searchIndex_price:" + searchIndex);
 			input.attr("name",searchIndex);
 			searchInComputerPriceSend.append(input);
		}
		if(inputValue1 == "" || inputValue2 == ""){
			alert("가격대를 입력하시오.");
		}else{	
		if(inputValue1 <= inputValue2){
			
  		$("#frmSearchPrice").submit();
		}else{
			alert("시작가격이 마지막 가격보다 작거나 같아야 합니다.");
		}
		}
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
<form class="backList"  style="display: none;">
<c:forEach var="cate_no_list" items="${cate_no_confirm}">	
<input type="text" name="${cate_no_list}" value="${cate_no_list}"/>
</c:forEach>
</form>
<form role="form" id="frmSearchData" action="/computerProduct/computersFormSearch" method="post">
<div class="form-group searchInComputerInfo" style="display: none;">
</div>
</form>
<form role="form" id="frmSearchPrice" action="/computerProduct/computersFormSearchPrice" method="post">
<div class="form-group searchInComputerPriceSend" style="display: none;">
</div>
</form>
<div class="computersFormDiv">
<header class="header">
<c:if test="${categoryInfo != null}">
<label class="computerFormListMenu">전체</label>&nbsp<button id="checkboxSearch" class="btn btn-warning btn-xs">검색</button>
&nbsp<button id="computersBack" class="btn btn-warning btn-xs">뒤로</button>
<ul class="nav nav-tabs computerFormListMenuItem">
<c:forEach var="CategoryVo" items="${categoryInfo}">
<li class="nav-item checkB">&nbsp&nbsp&nbsp${CategoryVo.cate_name}
&nbsp<input type="checkbox" name="${CategoryVo.cate_no}" value="${CategoryVo.cate_no}"/>
</li>
</c:forEach>
</ul>
</c:if>
<form id="frmData" action="/computerProduct/computersFormCheck" method="post">
	<div id="divData" style="display:none;">		
	</div>
</form>
</header>
<aside class="asideUp">
<a href="http://www.auction.co.kr/" target="_blank" title="제휴사이트입니다.">
<img src="/resources/bannerImage/auction.png" alt="제휴사이트" class="asideUpBanner"/>
</a></aside>
<nav class="navLeft">
<br>
<form role="form">
<div class="form-group detailSearchFormFind">					 
<label>
결과내 검색
</label>
<input type="text" id="c_com_name" class="form-control" placeholder="검색어를 입력하시오" name="c_com_name" required="required"/>
<button type="button" id="detailSearch" class="btn btn-xs btn-warning">
검색
</button>
</div>				
</form>			
<br>
<br>			
<form role="form">
				<div class="form-group searchInComputerPriceForm">					 
					<label>
						가격대
					</label>
					<input type="number" name="firstPrice" class="form-control" placeholder="시작 가격" required="required"/>
					~
					<input type="number" name="lastPrice" class="form-control" placeholder="나중 가격" required="required"/>
					<button type="button" id="detailPrice" class="btn btn-xs btn-warning">
					검색
					</button>
				</div>				
			</form>	
</nav>
<section class="section">
<div class="col-md-12">
	<c:forEach var="ComputerVo" items="${computerList}">	
						<table class="computerTable">
							<thead class="computerThead">
								<tr>
									<th>
										상품이미지								
									</th>
									<th>
										상품명								
									</th>
									<th>
										판매자								
									</th>
									<th>
										가격								
									</th>
									<th>
										구매								
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
									<a href="/computerProduct/detailComputerForm/${ComputerVo.p_no}" target="_blank">
										<c:choose>
											<c:when test="${ComputerVo.c_com_pic == null}">
												<img src="/resources/computerImage/default.png"/>
											</c:when>
										<c:otherwise>
												<img src="/resources/image/main_logo2.png"/>
											</c:otherwise>
										</c:choose>
										</a>
									</td>
									<td>
										<a href="/computerProduct/detailComputerForm/${ComputerVo.p_no}" target="_blank">${ComputerVo.c_com_name}</a>
									</td>
									<td>
										<a href="/login/memberVoInfoForm/${ComputerVo.c_com_seller}">${ComputerVo.c_com_seller}</a>
									</td>
									<td>
										<span id="price">${ComputerVo.c_com_price}</span>원
									</td>
									<td>
										<a href="/computerProduct/buyComputerProduct/${ComputerVo.p_no}">상품구매하기</a>
									</td>
								</tr>
							</tbody>			
						</table>
						<hr>
					</c:forEach>
				</div>
</section>
<aside class="aside">
<br>
<a href="https://ulsankh.step.or.kr/page/lms" target="_blank" title="kh 정보교육원 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/khBanner.mp4" type="video/mp4">
</video>
</a>
<br>
<br>
<br>
<br>
<br>
<a href="https://www.samsung.com/sec/" target="_blank" title="삼성 레드 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/red.mp4" type="video/mp4">
</video>
</a>
<br>
<br>
<br>
<br>
<br>
<a href="https://www.netflix.com/kr/" target="_blank" title="넷플릭스 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/netflix.mp4" type="video/mp4">
</video>
</a>
</aside>
</div>