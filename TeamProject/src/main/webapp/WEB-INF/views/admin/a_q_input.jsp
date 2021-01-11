<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<h1>Q&A 작성</h1>
<script>
	$(function(){
		$("#firstQACategory").change(function(){
			var selected = $("#firstQACategory option:selected").val();
			var url="/admin/adminQACategorySelect";
			var sendData={
					"qa_cate_no":selected
			}
			$.get(url, sendData, function(data){
				var startClone = $("#secondQACategory").find("option").eq(0).clone();
				$("#secondQACategory> option").remove();
				$("#secondQACategory").append(startClone);
				for(var  v = 0; v < data.length; v++){
					var clone = $("#secondQACategory").find("option").eq(0).clone();
					clone.val(data[v].qa_cate_no);
					clone.text(data[v].qa_cate_name);
					$("#secondQACategory").append(clone);
				}
			})
		});
		
		$("#btnSubmit").on("click", function(){
			var selected = $("#secondQACategory option:selected").val();
			console.log(selected);
			var qa_cate_no = $("#qa_cate_no").val(selected);
			console.log(qa_cate_no);
			if(qa_cate_no == "" || qa_cate_no == null){
				alert("카테고리를 선택해주세요.")
				return false;
			}
			$("#frmQAInsert").submit();
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" id="frmQAInsert" action="/admin/adminQAInsert">
				<select id="firstQACategory">
					<option value="">선택하세요</option>
					<c:forEach var="QACateVo" items="${firstQACategory}">
						<option value="${QACateVo.qa_cate_no}">${QACateVo.qa_cate_name}</option>
					</c:forEach>
				</select>
				
				<select id="secondQACategory">
					<option value="">선택하세요</option>
				</select>
				<div class="form-group">
					<label for="q_content"> 질문 </label>
					<input type="text" name="q_content" class="form-control" id="q_content" required/>
				</div>

				<div class="form-group">
					<label for="a_content"> 답변 </label>
					<textarea name="a_content" class="form-control" id="a_content" required></textarea>
				</div>
				
				<input type="hidden" name="qa_cate_no" id="qa_cate_no">
				<button type="button" class="btn btn-primary" id="btnSubmit">
					등록
				</button>
			</form>
		</div>
	</div>
</div>