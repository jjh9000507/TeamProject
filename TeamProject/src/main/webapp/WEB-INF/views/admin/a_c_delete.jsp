<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/admin_header.jsp" %>
<style>
h1{
	text-align: center;
}
.categoryMenu {					/* 상품 리스트 전체 길이 */
	padding-left : 700px;
	padding-bottom : 5px;
 	background-color : white;
	text-align:center;
	color: black;
	font-size : 22px;
	border: 1px solid white;
}
.categoryno{
	text-align: center;
	width:140px;
}
.categoryname{
	text-align: center;
	
}
.categorybtn{
	text-align: center;
	width:80px;
}
</style>
<script>
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="text-align: center"><h1>카테고리 삭제</h1></div>
	</div>
	<div class="row">
		<div class="col-md-12" style="text-align: center">
			<a href="/admin/adminCategory">이전 화면으로</a>
			<a href="/admin/adminForm">관리자 메인 화면으로</a>
		</div>
	</div>
	<div class="row listMain">
		<ul class="nav nav-tabs categoryMenu">
			<li class="nav-item"><a class="nav-link" href="/admin/adminCategoryDelete">전체</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/categoryDeletePage/10">의류</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/categoryDeletePage/20">가구</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/categoryDeletePage/50">컴퓨터</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/categoryDeletePage/30">가전제품</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="categoryno">카테고리 번호</th>
						<th class="categoryname">카테고리 이름</th>
						<th class="categorybtn"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="CategoryVo" items="${categoryList}">
					<tr>
						<td class="categoryno">${CategoryVo.cate_no}</td>
						<td class="categoryname">${CategoryVo.cate_name}</td>
						<td class="categorybtn">
							<a href="/admin/CategoryDelete/${CategoryVo.cate_no}" class="categoryDelete">삭제</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>