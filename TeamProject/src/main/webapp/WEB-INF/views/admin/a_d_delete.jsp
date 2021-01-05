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
.alld{
	font-size: 14px;
}
table {
	width:80%;
}
th, td{
	text-align: center;
}
.pno{
	width:90px;
}
td.pname{
	text-align: left;
}
.pcate{
	width:100px;
}
.pprice{
	width:100px;
}
.pseller{
	width:100px;
}
.pregdate{
	width:150px;
}
.pbtn{
	width:110px;
}
</style>
<script>
$(function(){
	//삭제버튼
	$(".contentDelete").on("click", function(e){
		e.preventDefault();
		var url="/admin/adminProductDelete";
		var sendData={
				"cate_no":$(this).attr("data-cateno"),
				"p_no":$(this).attr("data-pno"),
				"p_no2":$(this).attr("data-pno2")
		}
		$.get(url, sendData, function(data){
			if(data.trim() == "success"){
				$(".btnHome").trigger("click");
			}
		});
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="text-align: center;"><h1>상품게시물 삭제</h1></div>
	</div>
	<div class="row">
		<div class="col-md-12" style="text-align: center">
			<a href="/admin/adminDetail">이전 화면으로</a>
			<a href="/admin/adminForm">관리자 메인 화면으로</a>
		</div>
	</div>
	<div class="row listMain">
		<ul class="nav nav-tabs categoryMenu">
			<li class="nav-item"><a class="nav-link" href="/admin/detailDelete">전체</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/adminCategoryDelete/10">의류</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/detailDeleteCatePage/20">가구</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/detailDeleteCatePage/50">컴퓨터</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/detailDeleteCatePage/30">가전제품</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="pno">등록번호</th>
						<th class="pname">상품명</th>
						<th class="pcate">카테고리</th>
						<th class="pprice">가격</th>
						<th class="pseller">판매자</th>
						<th class="pregdate">상품등록일</th>
						<th class="pbtn"></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="ProductVo" items="${allProductList}">
					<tr>
						<td class="pno">${ProductVo.p_no2}</td>
						<td class="pname">${ProductVo.p_name}</td>
						<c:forEach var="CategoryVo" items="${categoryList}">
							<c:if test="${CategoryVo.cate_no == ProductVo.cate_no}">
								<td class="pcate">${CategoryVo.cate_name}</td>
							</c:if>
						</c:forEach>
						<td class="pprice">${ProductVo.p_price}</td>
						<td class="pseller">${ProductVo.p_seller}</td>
						<td class="pregdate">${ProductVo.p_regdate}</td>
						<td class="pbtn">
							<a href="#" class="contentDelete" data-pno="${ProductVo.p_no}" data-cateno="${ProductVo.cate_no}" data-pno2="${ProductVo.p_no2}">게시물 삭제</a>
							<button style="display: none;" type="button" class="btnHome" onclick="location.reload()">홈</button>
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