<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@ page session="false"%> --%>
<%@ include file="../include/header.jsp"%>
<style>
.category{
	cursor: pointer;
	font-size: 20px;
}
</style>
<script>
$(function(){
	
});
</script>
<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->

<div class="row">
		<div class="col-md-2"></div>

<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>

<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
		<div style="padding-top: 150px;">
			<div class="row listMain">
				<c:if test="${getCategoryList != null}">
				<ul class="nav nav-tabs listMenu">
						<li class="nav-item category"><a>전체</a></li>
					<c:forEach var="CategoryVo" items="${getCategoryList}">
						<li class="nav-item category"><a href="/whitegoods/whitegoodsform/${CategoryVo.cate_no}">${CategoryVo.cate_name}</a></li>
					</c:forEach>
				</ul>
				</c:if>
				
				<ul class="nav nav-tabs listMenu">
					<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
					<li class="nav-item"><a class="nav-link" href="#"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"></a></li>
				</ul>
				<div class="col-md-8 productList">
				
					<c:forEach var="WhitegoodsVo" items="${getWhitegoodsList}">
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="/whitegoods/detailWhiteGoods/${WhitegoodsVo.p_no}">
						<c:choose>
							<c:when test="${WhitegoodsVo.p_thumbimg == null}">
								<img src="/resources/image/shirt.jpg"/>
							</c:when>
							<c:otherwise>
								<img src="/resources/image/main_logo2.png"/>
							</c:otherwise>
						</c:choose>
						</a></li>
						<li class="nav-item"><a class="nav-link productName" href="/whitegoods/detailWhiteGoods/${WhitegoodsVo.p_no}">${WhitegoodsVo.p_name}<br></a><span id="price">${WhitegoodsVo.p_price}</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">${WhitegoodsVo.p_seller}</a></li>
					</ul>
					</c:forEach>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
		
		<div class="col-md-2"></div>


<div class="col-md-12 btnMore">
	<div class="form-control divMore">
		<a href="#" class="a_More">더보기  <span class="arrow"><img src="/resources/image/arrow.PNG"/></span></a>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
