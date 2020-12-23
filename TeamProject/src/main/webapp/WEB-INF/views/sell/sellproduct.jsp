<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>

<script>
$(function(){
	//카테고리1 선택 시 반응
	$("#large").on("change", function(){
		var select = $("#large option:selected").val();
		if(select == "305"){
			
		} else {
			$("#middleDiv").show();
			$("#smallDiv").hide();
			var url = "/whitegoods/getCategoryList";
			var sendData = {
				"cate_no":select	
			};
			$.get(url, sendData, function(data){
				//카테고리 내 선택지 정리
				$("#middle > option").remove();
				$("#small > option").remove();
				var startClone = $("#clMiddle").find("option").eq(0).clone();
				$("#middle").append(startClone);
				//카테고리 selectbox에 선택지 추가
				for(var i = 0; i < data.length; i++){
					if(data.name != "기타"){
						var clone = $("#clMiddle").find("option").eq(0).clone();
						clone.val(data[i].cate_no);
						clone.text(data[i].cate_name);
						$("#middle").append(clone);
						$("#middle").find("option").eq(i+1).text(data[i].cate_name);
						$("#middle").find("option").eq(i+1).val(data[i].cate_no);
					} else {
						$("#middle").find("option").eq(i+1).text("");
						$("#middle").find("option").eq(i+1).val("");
					}
				}
			});
		}
	});
	//카테고리2 선택 시 반응
	$("#middle").on("change", function(){
		$("#smallDiv").show();
		var select = $("#middle option:selected").val();
		if(select == ""){
			$("#smallDiv").hide();
		}
		var url = "/whitegoods/getCategoryList";
		var sendData = {
				"cate_no":select	
		};
		$.get(url, sendData, function(data){
			//카테고리 내 선택지 정리
			$("#small > option").remove();
			var startClone = $("#clMiddle").find("option").eq(0).clone();
			$("#small").append(startClone);
			for(var i = 0; i < data.length; i++){
				if(data.name != "기타"){
					var clone = $("#clSmall").find("option").eq(0).clone();
					clone.val(data[i].cate_no);
					clone.text(data[i].cate_name);
					$("#small").append(clone);
// 					$("#small").find("option").eq(i+1).text(data[i].cate_name);
// 					$("#small").find("option").eq(i+1).val(data[i].cate_no);
				} else {
					$("#small").find("option").eq(i+1).text("");
					$("#small").find("option").eq(i+1).val("");
				}
			}
		});
	});
	
	//등록 버튼 눌렀을 때
	$("#btnSellProductUpload").click(function(e){
		e.preventDefault();
		var large = $("#large option:selected").val();
		var middle = $("#middle option:selected").val();
		var small = $("#small option:selected").val();
		
// 		if(small != "") {
// 			$("#cate_no").val(small);
// 		} else {
// 			if(middle != "") {
// 				$("#cate_no").val(middle);
// 			} else {
// 				$("#cate_no").val(large);
// 			}
// 		}
		if(large == "305"){
			$("#cate_no").val(large);
		} else {
			if(small != "") {
				$("#cate_no").val(small);
			} else if(small == "" && middle != "") {
				$("#cate_no").val(middle);
			}
		}
// 		console.log(small);
// 		console.log(middle);
// 		console.log(large);
// 		console.log($("#cate_no").val());
		$("#frmUpload").submit();
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<form role="form" id="frmUpload" action="sellWhiteGoodsUpload" method="get" enctype="multipart/form-data">
				<div class="form-group">
					<label for="p_name"> 상품명 </label>
					<input name="p_name"
						type="text" class="form-control" id="p_name" />
				</div>
				
				<div class="form-group">
					<label for="p_price"> 판매가 </label>
					<input name="p_price"
						type="number" class="form-control" id="p_price" />
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
				
				<div class="form-group">
					<label>카테고리1</label>
					<select id="large">
						<option value="">선택하세요
						<option value="301">영상가전
						<option value="302">계절가전
						<option value="303">주방가전
						<option value="304">생활가전
						<option value="305">기타
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
				
				<input type="hidden" id="cate_no" name="cate_no" value="">
				
				<div class="form-group">
					<label for="p_content"> 상품 설명 </label>
					<textarea id="p_content" name="p_content" class="form-control"></textarea>
				</div>
				
				<div class="form-group">
					<label for="thumbnail"> 상품 대표 이미지 </label>
					<input type="file" class="form-control-file" name="thumbnail" id="thumbnail" />
				</div>
				<button type="button" id="btnSellProductUpload" class="btn btn-primary">등록</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>