<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>

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
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" action>
				<input type="hidden" name="qa_no" value="${qaDetail.qa_no}">
				
				<select id="firstQACategory">
					<option value="">선택하세요</option>
					<c:forEach var="QACateVo" items="${firstQACategory}">
						<option value="${QACateVo.qa_cate_no}"
						<c:if test="${qaDetail.qa_cate_no}">
							selected
						</c:if>>${QACateVo.qa_cate_name}</option>
					</c:forEach>
				</select>
				
				<select id="secondQACategory">
					<option value="">선택하세요</option>
				</select>
				
				<div class="form-group">
					<label for="q_content">질문</label>
					<input type="text" class="form-control" id="q_content" name="q_content" value="${qaDetail.q_content}" />
				</div>
				
				<div class="form-group">
					<label for="a_content">답변</label>
					<input type="text" class="form-control" id="a_content" name="a_content" value="${qaDetail.a_content}" />
				</div>
				<button type="button" class="btn btn-primary">
					수정
				</button>
			</form>
		</div>
	</div>
</div>