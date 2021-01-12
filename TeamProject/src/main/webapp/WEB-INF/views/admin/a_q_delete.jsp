<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<style>
.cate_name{
	width:200px;
	font-size:15px;
	text-align: center;
}
.cate_btn{
	text-align:center;
	width:60px;
}
.btns{
	width:200px;
}
</style>
<script>
	$(function(){
		$(".btnShow").on("click", function(){
			var that = $(this).parent().parent().next();
			that.toggle();
		});
		
		$(".btnDelete").on("click", function(){
			var qa_no = $(this).attr("data-qano");
			var url="/admin/QandADeleteRun";
			var sendData = {
					"qa_no":qa_no
			}
			$.get(url, sendData, function(data){
				if(data.trim() == "success"){
					location.reload();
				}
			});
		});
	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<tbody>
				<c:forEach var="QandAVo" items="${QA_UDList}">
					<tr>
						<c:forEach var="QACateVo" items="${QACategory}">
							<c:if test="${QandAVo.qa_cate_no == QACateVo.qa_cate_no}">
								<td class="cate_name">${QACateVo.qa_cate_name}</td>
							</c:if>
						</c:forEach>
						<td class="cate_content">${QandAVo.q_content}</td>
						<td class="cate_btn"><button type="button" class="btnShow">+</button></td>
						<td class="btns">
							<a href="/admin/qaUpdate/${QandAVo.qa_no}" class="btn btn-success btnUpdate" data-qano="${QandAVo.qa_no}">수정</a>
							<button type="button" class="btnDelete" data-qano="${QandAVo.qa_no}">삭제</button>
						</td>
					</tr>
					<tr style="display: none;">
						<td class="cate_name">답변</td>
						<td class="cate_content">${QandAVo.a_content}</td>
						<td class="cate_btn"></td>
						<td class="btns"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>