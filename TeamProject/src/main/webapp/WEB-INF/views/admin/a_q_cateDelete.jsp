<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<style>
a.btns{
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	text-decoration: none;
	border-radius: 4px;
	float:left;
}

a.btns:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 40, 200, 0.7) 0 0px 0px 40px inset;
}
</style>
<script>
	$(function(){
		$(".qaCategoryDelete").on("click", function(e){
			e.preventDefault();
			var qa_cate_no = $(this).attr("data-qano");
			var sendData={
					"qa_cate_no":qa_cate_no
			}
			var url="/admin/QandACategoryDeleteRun";
			$.get(url, sendData, function(data){
				console.log(data);
				if(data.trim()=="success"){
					location.reload();
				}
			});
		});
	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3">
			<a class="btn btns" href="/admin/adminQandAMain">이전 페이지</a>
			<a class="btn btns" href="/admin/adminForm">관리자 페이지 홈으로</a>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<table class="table">
				<thead>
					<tr>
						<th>카테고리 번호</th>
						<th>카테고리 이름</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="QACategory" items="${QACategory}">
					<tr>
						<td>${QACategory.qa_cate_no}</td>
						<td>${QACategory.qa_cate_name}</td>
						<td><a href="#" class="btn btns qaCategoryDelete" data-qano="${QACategory.qa_cate_no}">삭제</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>