<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin_header.jsp" %>


<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<h1>카테고리 관리</h1>
	</div>
	<div class="col-md-4"></div>
</div>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<a href="/admin/adminCategoryInput">카테고리 등록</a>
		<a href="/admin/adminCategoryDelete">카테고리 삭제</a>
	</div>
	<div class="col-md-4"></div>
</div>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<a href="/admin/adminForm">이전 화면으로</a>
	</div>
	<div class="col-md-4"></div>
</div>
<%@include file="../include/footer.jsp" %>