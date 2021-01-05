<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/admin_header.jsp" %>
<script>
	$(function(){
		//대분류 선택
		$("#large").change(function(){
			var selected = $("#large option:selected").val();
			console.log(selected);
// 			var url = "/admin/getCategoryList";
// 			var sendData = {
// 					"cate_no" : selected
// 			}
// 			$.get(url, sendData, function(data){
// 				$("#middle > option").remove();
// 				$("#small > option").remove();
// 				$("#small2 > option").remove();
// 				$("#middleDiv").show();
				
// 				var startclone = $("#clMiddle").find("option").eq(0).clone();
// 				$("#middle").append(startclone);
// 				$("#smallDiv").hide();
// 				$("#smallDiv2").hide();
// 				for(var v = 0; v < data.length; v++){
// 					var clone = $("#clMiddle").find("option").eq(0).clone();
// 					clone.val(data[v].cate_no);
// 					clone.text(data[v].cate_name);
// 					$("#middle").append(clone);
					
// 				}
// 			});
		});
		
		
	/* 버튼 클릭 시 해당 레벨의 카테고리 추가하도록 띄움 */
		$("#btnLargeInput").click(function(){
			console.log("대분류 클릭");
		});
		
		$("#btnMiddleInput").click(function(){
			console.log("중분류 클릭");
		});
		
		$("#btnSmall1Input").click(function(){
			console.log("소분류1 클릭");
		});
		
		$("#btnSmall2Input").click(function(){
			console.log("소분류2 클릭");
		});
		
		
	});
</script>

<div class="row">
	<div class="col-md-12" style="text-align: center">
		<a href="/admin/adminDetail">이전 화면으로</a>
		<a href="/admin/adminForm">관리자 메인 화면으로</a>
	</div>
</div>

<div class="row">
	<div class="col-md-12" style="text-align: center">
		<button type="button" id="btnLargeInput">대분류 추가</button>
		<button type="button" id="btnMiddleInput">중분류 추가</button>
		<button type="button" id="btnSmall1Input">소분류1 추가</button>
		<button type="button" id="btnSmall2Input">소분류2 추가</button>
	</div>
</div>


<form>
	<div style="display: none;">
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
	
	<div>
		<label>카테고리1</label>
		<select id="large">
			<option value="">선택하세요
			<c:forEach var="CategoryVo" items="${firstCategoryList}">
				<option value="${CategoryVo.cate_no}">${CategoryVo.cate_name}
			</c:forEach>
		</select>
	</div>

	<div style="display: none;">
		<label>카테고리2</label>
		<select id="middle">
		</select>
	</div>
					
	<div style="display: none;">
		<label>카테고리3</label>
		<select id="small">
		</select>
	</div>
	
	<input type="hidden" value="">
</form>
<%@include file="../include/footer.jsp" %>