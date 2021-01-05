<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>
<style>
#fileDrop{
	width:80%;
	height: 80px;
	margin: auto;
	border: 1px solid; 
}

.divUploaded{
	width:150px;
	float: left;
}
</style>
<script src="/resources/js/imageScript.js"></script>
<script>
$(function(){
	//대분류 선택
	$("#large").change(function(){
		var selected = $("#large option:selected").val();
		var url = "/sellproduct/getCategoryList";
		var sendData = {
				"cate_no" : selected
		}
		$.get(url, sendData, function(data){
			$("#middle > option").remove();
			$("#small > option").remove();
			$("#small2 > option").remove();
			$("#middleDiv").show();
			
			var startclone = $("#clMiddle").find("option").eq(0).clone();
			$("#middle").append(startclone);
			$("#smallDiv").hide();
			$("#smallDiv2").hide();
			for(var v = 0; v < data.length; v++){
				var clone = $("#clMiddle").find("option").eq(0).clone();
				clone.val(data[v].cate_no);
				clone.text(data[v].cate_name);
				$("#middle").append(clone);
				
			}
		});
	});
	
	//중분류 선택
	$("#middle").on("change", function(){
		var selected = $("#middle option:selected");
		$("#smallDiv").hide();
		$("#smallDiv2").hide();
		
		if(selected.text() == "기타"){
			$("#smallDiv").hide();
			$("#smallDiv2").hide();
			$("#small").empty();
			$("#small2").empty();
		} else{
			var url = "/sellproduct/getCategoryList";
			var sendData = {
					"cate_no":selected.val()
			}
			$.get(url, sendData, function(data){
				$("#small > option").remove();
				$("#small2 > option").remove();

				if(data == ""){
					$("#smallDiv").hide();
				} else {
					$("#smallDiv").show();

					var startClone = $("#clSmall").find("option").eq(0).clone();
					$("#small").append(startClone);
					for(var v = 0; v<data.length; v++){
						var clone = $("#clSmall").find("option").eq(0).clone();
						if(data[v].name != "기타"){
							clone.val(data[v].cate_no);
							clone.text(data[v].cate_name);
						} else {
							clone.val("");
							clone.text("기타");
						}
						$("#small").append(clone);
					}
				}
			});
		}
	});
	//소분류1 선택
	$("#small").on("change", function(){
		var selected = $("#small option:selected");
		
		if(selected.text() == "기타"){
			$("#smallDiv2").hide();
			$("#small2").empty();
		} else {
			var url = "/sellproduct/getCategoryList";
			var sendData = {
					"cate_no":selected.val()
			}
			$.get(url, sendData, function(data){
				$("#small2 > option").remove();
				if(data == ""){
					$("#smallDiv2").hide();
				} else {
					$("#smallDiv2").show();
					
					var startClone = $("#clSmall2").find("option").eq(0).clone();
					$("#small2").append(startClone);
					
					for(var v = 0; v<data.length; v++){
						var clone = $("#clSmall2").find("option").eq(0).clone();
						if(data[v].name != "기타") {
							clone.val(data[v].cate_no);
							clone.text(data[v].cate_name);
						} else {
							clone.val("");
							clone.text("기타");
						}
						$("#small2").append(clone);
					}
				}
			});
		}
	});
	
	//파일 업로드 시킬 칸 위에 마우스 올릴때
	$("#fileDrop").on("dragenter dragover", function(e){
// 		console.log(e);
		e.preventDefault();
	});
	
	//파일 업로드 시킬 칸 위에 파일 놓을 때
	$("#fileDrop").on("drop", function(e){
		e.preventDefault();
		var file = e.originalEvent.dataTransfer.files[0];
// 		console.log(file);
		
		var formData = new FormData();
		formData.append("file", file);
		var url="/sellproduct/uploadedFile";
		
		$.ajax({
			"processData":false,
			"contentType":false,
			"method" : "post",
			"url" : url,
			"data":formData,
			"success":function(data){
				console.log(data);
				var underbarIndex = data.lastIndexOf("_");
				var front = data.substring(0, underbarIndex + 1);
				var rear = data.substring(underbarIndex + 1);
				var fileName = front + rear;
				
				var div = $("#uploadedList").prev().clone();
				div.attr("data-filename", data);
				var img = div.find("img");
				if(isImage(rear)){
					img.attr("src", "http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/" + data);
					var span = div.find("span");
					span.text(fileName.substring(fileName.lastIndexOf("_") + 1));
					
					$("#uploadedList").append(div);
					div.show();
				}
				
				$("input[name=p_thumbimg]").attr("value", data);
			}
		});
	});
	
	//이미지 등록창 띄우는 버튼
	$("#btnImgDrop").click(function(){
		$("#fileDrop").show();
	});
	
	
	//상품등록 버튼
	$("#btnSellProduct").on("click", function(){
		var cate_no = $("#cate_no");
		var large = $("#large option:selected").val();
		var middle = $("#middle option:selected").val();
		var small1 = $("#small option:selected").val();
		var small2 = $("#small2 option:selected").val();
		
		var form = $("#frmUpload");
		if(large == 10){
			form.attr("action", "/sellproduct/clothes");
		} else if(large == 20){
			form.attr("action", "/sellproduct/furniture");
		} else if(large == 30){
			form.attr("action", "/sellproduct/whitegoodsUpload");
		} else if(large == 50){
			form.attr("action", "/sellproduct/computer");
		}
		
		
		if(small2 != null){
			cate_no.val(small2);
		} else {
			if(small1 != null){
				cate_no.val(small1);
			} else {
				cate_no.val(middle);
			}	
		}

		if(cate_no.val() == "" && cate_no.val() == null){
			alert("카테고리를 선택해주세요.");
		}
		
		$("#frmUpload").submit();
	});
	
	//첨부파일 삭제(x) 클릭
	$("#uploadedList").on("click", "a_times", function(e){
		e.preventDefault();
		var filename = $(this).parent().attr("data-filename");
		var url = "/deleteAjax?filename=" + filename;
		var that = $(this);
// 		$.get(url, function(data){
			
// 		});
		
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" id="frmUpload" action="" method="get" enctype="multipart/form-data">
			<div class="form-group">
					<label for="p_name"> 상품명 </label>
					<input name="p_name"
						type="text" class="form-control" id="p_name" required/>
				</div>
				
				<div class="form-group">
					<label for="p_price"> 판매가 </label>
					<input name="p_price"
						type="number" class="form-control" id="p_price" required/>
				</div>
				
				<div class="form-group" style="display: none;">
					<label>카테고리2</label>
					<select id="clMiddle">
						<option value="">선택하세요
					</select>
				</div>
				
				<div class="form-group" style="display: none;">
					<label>카테고리3</label>
					<select id="clSmall">
						<option value="">선택하세요
					</select>
				</div>
				
				<div class="form-group" style="display: none;">
					<label>카테고리4</label>
					<select id="clSmall2">
						<option value="">선택하세요
					</select>
				</div>
				
				<div class="form-group">
					<label>카테고리1</label>
					<select id="large">
						<option value="">선택하세요
						<option value="10">의류
						<option value="20">가구
						<option value="50">컴퓨터
						<option value="30">가전제품
					</select>
				</div>
				
				<div class="form-group" id="middleDiv" style="display: none;">
					<label>카테고리2</label>
					<select id="middle">
					</select>
				</div>
				
				<div class="form-group" id="smallDiv" style="display: none;">
					<label>카테고리3</label>
					<select id="small">
					</select>
				</div>
				
				<div class="form-group" id="smallDiv2" style="display: none;">
					<label>카테고리4</label>
					<select id="small2">
					</select>
				</div>
				
				<input type="hidden" name="cate_no" id="cate_no" value="">
				
				<div class="form-group">
					<label for="p_content"> 상품설명 </label>
					<textarea class="form-control" name="p_content" id="p_content" required></textarea>
				</div>
				
				<div class="form-group">
					<label for="">상품 이미지</label><br>
					<button type="button" id="btnImgDrop">업로드</button>
					<div id="fileDrop" style="display: none"></div>
				</div>
				
				<div class="divUploaded" style="display: none;">
					<img src="/resources/image/default.png" height="100"><br>
					<span>default.png</span>
					<a href="#" style="cursor: pointer;" class="a_times">&times;</a>
				</div>
				
				<div id="uploadedList">
				
				</div>
				<input type="hidden" name="p_thumbimg" value="">
				<button type="button" id="btnSellProduct">상품 등록</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>