<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/admin_header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4"><h1>카테고리 삭제</h1></div>
		<div class="col-md-4"></div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>카테고리 번호</th>
						<th>카테고리 이름</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="CategoryVo" items="categoryList">
					<tr>
						<td>${CategoryVo.cate_no}</td>
						<td>${CategoryVo.cate_name}</td>
						<td></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>