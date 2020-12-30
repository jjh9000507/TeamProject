<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin_header.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>등록번호</th>
						<th>상품명</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>판매자</th>
						<th>상품등록일</th>
<!-- 						<th></th> -->
					</tr>
				</thead>
				<tbody>
				<c:forEach var="ProductVo" items="${allProductList}">
					<tr>
						<td>${ProductVo.p_no}</td>
						<td>${ProductVo.p_name}</td>
						<td>${ProductVo.cate_no}</td>
						<td>${ProductVo.p_price}</td>
						<td>${ProductVo.p_seller}</td>
						<td>${ProductVo.p_regdate}</td>
						<td><a href="/admin/adminProductDelete">게시물 삭제</a></td>
<!-- 						<td><a href="#">게시물 삭제</a></td> -->
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>