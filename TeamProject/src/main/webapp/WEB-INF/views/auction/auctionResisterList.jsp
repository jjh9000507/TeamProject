<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#fileDrop {
	width: 80%;
	height: 100px;
	background-color: white;
	border: 4px dashed #c8d7ff;
}
</style>

<%
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); //도로명 주소
	String engAddr = request.getParameter("engAddr"); //영어 주소
	String jibunAddr = request.getParameter("jibunAddr"); //지번 주소
	String zipNo = request.getParameter("zipNo"); //우편번호
	String addrDetail = request.getParameter("addrDetail"); //사용자가 직접 입력
%>

<script>
$(function() {

	$("#listItem").click(function() {//tab1클릭시
		$("#listItemContent").show();
		$("#soldItemContent").hide();
		$("#registerItemContent").hide();

	});

	$("#soldItem").click(function() {//tab2클릭시
		$("#listItemContent").hide();
		$("#soldItemContent").show();
		$("#registerItemContent").hide();
	})
	
	$("#registerItem").click(function() {//tab3클릭시
		$("#listItemContent").hide();
		$("#soldItemContent").hide();
		$("#registerItemContent").show();
	})//registerItem
	
	//----------------------------------------- 이미지 추가----------------------------------------------------------//
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
		console.log(e);
	});//fileDrop	

	$("#fileDrop").on(
			"drop",
			function(e) {
				e.preventDefault();

				var file = e.originalEvent.dataTransfer.files[0]; //드래그한 파일에 대한 객체 정보를 가지고 있다
				console.log(file);
				//html의 form객체를 만들어서 여기에 이미지를 추가해서 통째로 ajax로 넘긴다

				var formData = new FormData();
				formData.append("file", file);

				var url = "/furniture/uploadAjax";
				
				$.ajax({
					"processData" : false,
					"contentType" : false,
					"method" : "post",
					"url" : url,
					"data" : formData,
					"success" : function(data) {
						console.log(data);
						
						var divUploaded = $("#uploadList").prev().clone();
						var img = divUploaded.find("img");
						console.log(img);
						img.attr("src","/furniture/displayImage?imageName=" + data);
						
						var radio = divUploaded.find("input[name='mainImg']");
						radio.attr("mainImagName",data);
						
						$("#uploadList").append(divUploaded);
						divUploaded.show();
					}
				});//ajax
			});//fileDrop

	$("#wirteForm").submit(function(){
		
		var div = $("#uploadList > .divUploaded"); // > : 자식에서 찾아라
		
		div.each(function(index){
			console.log("index:"+index);
			
		});
		
		return false;
	});	
			
	//--------------------------------------------- 주소  ----------------------------------------------------------//
	$("#addrFind").click(function() {//주소 찾기 버튼
		$("#modalAddr").trigger("click");
	});
	
	//모달에서 주소 찾기 
	$("#modalAddrFind").click(function() {
		
		var keyword = $("#moadlTxtAddrSearch").val();
		console.log("moadlTxtAddrSearch:"+moadlTxtAddrSearch);
		
		var dataAddr = {
			currentPage : "1",
			countPerPage : "1000",
			resultType : "json",
			confmKey : "devU01TX0FVVEgyMDIwMTIyNzEyMzcyMzExMDU5NDU=",
			keyword : keyword
		};

		$.ajax({
			url : "https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do" //인터넷망
			,
			type : "post"
			//,data:$("#form").serialize()
			,
			data : dataAddr,
			dataType : "jsonp",
			crossDomain : true,
			success : function(jsonStr) {
				$("#list").html("");
				var htmlStr = "";
				htmlStr += "<table border='1'>";
				$(jsonStr.results.juso).each(function() {
					htmlStr += "<tr>";
					htmlStr += "<td><a href='#' id='roadAddrPart1' class='roadAddrPart1'>" + this.roadAddrPart1 + "</a></td>";
					htmlStr += "<td>" + this.jibunAddr + "</td>";
					htmlStr += "<td>" + this.engAddr + "</td>";
					htmlStr += "<td>" + this.zipNo + "</td>";
					htmlStr += "</tr>";
				});
				htmlStr += "</table>";
				$("#list").html(htmlStr);
				}
			});//ajax
		});//addrFind

		$("#list").on("click",".roadAddrPart1", function(){//모달에서 주소 링크 클릭시 값 넘기기
			var roadAddr = $(this).parent().parent().find("td").eq(0).text();
			var jibunAddr = $(this).parent().parent().find("td").eq(1).text();
			var zip = $(this).parent().parent().find("td").eq(3).text();
			
			$("#txtroadAddr").val(roadAddr);
			$("#txtZip").val(zip);
			$("#txtjibundAddr").val(jibunAddr);
			$("#btnModalClose").trigger("click");
		});
	
	//--- 엔터키 ---//
	function enterSearch() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		//alert(evt_code);
		if (evt_code == 13) { //아스키코드 13은 엔터, 엔터를 치면 검색  
			event.keyCode = 0;
			getAddr();
		}
	}//enterSearch
	
});//function	
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="tabbable" id="tabs-778663">
				<ul class="nav nav-tabs">
				
				<li class="nav-item">
						<a class="nav-link active" href="#tab1" 
							data-toggle="tab" id="listItem">등록된 물품</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="#tab2" 
						data-toggle="tab" id="soldItem">거래된 물품</a></li>
						
					<li class="nav-item"><a class="nav-link" href="#tab3" 
						data-toggle="tab" id="registerItem">물품 등록</a></li>
				</ul>

				<div class="tab-content">

					<div class="tab-pane active" id="listItemContent"><!-- tab1 -->
						<!--------------------------------- tab1 div 시작 ------------------------------------>

						<div class="row">
							<div class="col-md-12">
							<div class="row">

							<c:forEach var="AuctionVo" items="${list}" >
							<div class="col-md-3">
								<div class="card">
									<img class="card-img-top rounded" alt="Thumbnail First" border="0" height="200px"
										src="/resources/auctionImage/${AuctionVo.p_no}/${AuctionVo.img}"/>
									<div class="card-block">
										<h5 class="card-title">상품:${AuctionVo.p_title}</h5>
										<p class="card-text">현재가:${AuctionVo.present_price}</p>
										<p class="card-text">즉구가:${AuctionVo.instant_price}</p>
										<p class="card-text">등록일:${AuctionVo.register_date}</p>
										<p>
											<a class="btn btn-outline-primary" href="#">수정</a> 
											<a class="btn btn-outline-danger" href="#">삭제</a>
										</p>
									</div>
								</div>
							</div>
							</c:forEach>

								</div>
							</div>
						</div>
						<!--------------------------------- tab1 div 끝 -------------------------------------->
					</div><!-- tab1 -->
					
					<div class="tab-pane" id="soldItemContent">	<!-- tab2 -->
						<!--------------------------------- tab2 div 시작 ------------------------------------>



						<!--------------------------------- tab1 div 끝 -------------------------------------->
					</div><!-- tab2 -->
					
					<div class="tab-pane" id="registerItemContent"><!-- tab3 -->
						<!--------------------------------- tab3 div 시작 ------------------------------------>
						
						<div class="row">
							<div class="col-md-12">
								<form role="form" name="writeForm" id="wirteForm">
									<div class="form-group">
										<label for="txtPName"> 상품명 </label> <input
											type="text" class="form-control" id="txtPName" />
									</div>
									
									<div class="form-group">
										<label for="presentPrice"> 경매금액 </label> <input
											type="text" class="form-control" id="txtPresentPrice" />
										<label for="instantPrice"> 즉구가 </label> <input
											type="text" class="form-control" id="txtInstantPrice" />
									</div>
									
									<div class="form-group">
										<label for="txtPExplain"> 상품설명 </label> 
										<textarea class="form-control" id="txtPExplain"></textarea>
									</div>
																		
									<!-- 파일 추가 시작 -->
									<div>
										<lable>첨부할 파일 드로그 하세요</lable>
										<div id="fileDrop"></div>
										<!-- 여기에 파일을 드래그 드롭 -->
									</div>
									
									<div class="divUploaded" style="display: none;float:left;">
										<!-- 추가한 그림 크기와 옆에 x추가 -->
										<img height="50px" width="50px" /> <a href="#" class="a_times">&times;</a>
										<input type="radio" name="mainImg">
									</div>
									
									<div id="uploadList"></div>
									<!-- 파일 추가 끝 -->
									
									<br clear="left">
									<br>
									<button type="submit" class="btn btn-warning">등록</button>
								</form>
								</div>
							</div>
						</div>
						<!--------------------------------- tab3 div 끝 -------------------------------------->
					</div><!-- tab3 -->

				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
