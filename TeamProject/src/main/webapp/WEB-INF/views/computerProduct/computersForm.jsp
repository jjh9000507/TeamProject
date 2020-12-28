<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>
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
				<c:if test="${computerList != null}">
				<ul class="nav nav-tabs listMenu">
						<li class="nav-item category"><a>전체</a></li>
					<c:forEach var="CategoryVo" items="${categoryInfo}">
						<li class="nav-item category"><a href="/computerProduct/computersForm/${CategoryVo.cate_no}">${CategoryVo.cate_name}</a></li>
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
				<c:forEach var="ComputerVo" items="${computerList}">
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="/computerProduct/detailComputerProduct/${ComputerVo.p_no}">
						<c:choose>
							<c:when test="${ComputerVo.c_com_pic == null}">
								<img src="/resources/computerImage/default.png"/>
							</c:when>
							<c:otherwise>
								<img src="/resources/image/main_logo2.png"/>
							</c:otherwise>
						</c:choose>
						</a></li>
						<li class="nav-item"><a class="nav-link productName" href="/computerProduct/detailComputerProduct/${ComputerVo.p_no}">${ComputerVo.c_com_name}<br>
						</a><span id="price">${ComputerVo.c_com_price}</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">${ComputerVo.c_com_seller}</a></li>
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
