<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@ include file="../include/header.jsp"%>
<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
<style>
.goodsDescant{
	font-size: 50px;
	text-align: center;
}

.goodsTitle{
	font-size:30px;
	text-align: right;
}


.seller{
	cursor: pointer;
}
</style>
<div class="row">
		<div class="col-md-2"></div>

<div class="col-md-8" >
<br>
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
		<div style="padding-top: 150px;">
			<div class="row listMain">
					
				<div class="col-md-8 productList">
					<ul class="nav nav-pills list">
						<li class="nav-item"><img src="/resources/computerImage/default.png"/></li>
						<li class="nav-item goodsTitle">${detailComputerVo.c_com_name}<br><hr><span id="price">${detailComputerVo.c_com_price}</span>원<br></li>
						
						<li class="nav-item"><a class="nav-link seller">${detailComputerVo.c_com_seller}</a></li>
					</ul>
					<div class="goodsDescant">
					${detailComputerVo.c_com_content}
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
		
		<div class="col-md-2"></div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<a href="/" class="btn btn-primary">목록</a>
		</div>
		<div class="col-md-2"></div>
	</div>
<%@ include file="../include/footer.jsp"%>
