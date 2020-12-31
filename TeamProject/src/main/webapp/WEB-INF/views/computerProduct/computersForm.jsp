<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/computersForm_css.css" %>
<%@ include file="../include/header.jsp"%>

<script>

$(function() {
	$("#checkboxSearch").click(function() {
		var inputCheckbox = $(".checkB");
		var url = "/computerProduct/computersForm";
		
		var checkList = new Array(6);
		var now_cate_no = inputCheckbox.find("input").eq(0).val(); 
		for(var i = 0; i < checkList.length; i++){
			if(inputCheckbox.find("input").eq(i).is(":checked") == true){			
				checkList[i] =inputCheckbox.find("input").eq(i).val();
			console.log("checkList:" + checkList[i]);
			var sendData = {
					"checkList" : checkList,
					"now_cate_no" : now_cate_no
				};
				console.log(sendData);
				$.post(url, sendData, function() {
					
					
				});
			}
		}		
	});
});
</script>
<div class="row">
		<div class="col-md-2"></div>
<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>
	</div>
</div>		
		<div class="col-md-2"></div>
		<br>
		<br>

<div class="computersFormDiv">

<header class="header">
<c:if test="${categoryInfo != null}">
<label class="computerFormListMenu">전체</label>&nbsp<button id="checkboxSearch" class="btn btn-warning btn-xs">검색</button>
<ul class="nav nav-tabs computerFormListMenuItem">
<c:forEach var="CategoryVo" items="${categoryInfo}">
<li class="nav-item checkB">&nbsp&nbsp&nbsp${CategoryVo.cate_name}
&nbsp<input type="checkbox" name="${CategoryVo.cate_no}" value="${CategoryVo.cate_no}"/>
</li>
</c:forEach>
</ul>
</c:if>

</header>
<aside class="asideUp">
<a href="http://www.auction.co.kr/" target="_blank" title="제휴사이트입니다.">
<img src="/resources/bannerImage/auction.png" alt="제휴사이트" class="asideUpBanner"/>
</a></aside>
<nav class="navLeft">
<br>
<form role="form">
<div class="form-group searchInComputer">					 
<label>
결과내 검색
</label>
<input type="text" class="form-control" placeholder="검색어를 입력하시오"/>
<button type="submit" class="btn btn-xs btn-warning">
검색
</button>
</div>				
</form>			
<br>
<br>			
<form role="form">
				<div class="form-group searchInComputer">					 
					<label>
						가격대
					</label>
					<input type="number" class="form-control" placeholder="시작 가격"/>
					~
					<input type="number" class="form-control" placeholder="나중 가격"/>
					<button type="submit" class="btn btn-xs btn-warning">
					검색
					</button>
				</div>				
			</form>			
<nav class="pageNav">
<ul class="pagination">
	<c:if test="${pagingDto.startPage != 1}">
		<li class="page-item">
			<a class="page-link" href="#" data-page="${pagingDto.startPage - 1}">이전</a>
		</li>
	</c:if>

	<c:forEach var="i" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
		<li
			<c:choose>
				<c:when test="${i == pagingDto.page}">
					class="page-item active"
				</c:when>
				<c:otherwise>
					class="page-item"
				</c:otherwise>
			</c:choose>><a class="page-link" href="#" data-page="${i}">${i}</a></li>
	</c:forEach>

	<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
		<li class="page-item"><a class="page-link" href="#" data-page="${pagingDto.endPage + 1}">다음</a></li>
	</c:if>
				</ul>
			</nav>

</nav>
<section class="section">
<div class="col-md-12">
	<c:forEach var="ComputerVo" items="${computerList}">
	
						<table class="computerTable">
							<thead class="computerThead">
								<tr>
									<th>
										상품이미지								
									</th>
									<th>
										상품명								
									</th>
									<th>
										판매자								
									</th>
									<th>
										가격								
									</th>
									<th>
										구매								
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
									<a href="/computerProduct/detailComputerForm/${ComputerVo.p_no}">
										<c:choose>
											<c:when test="${ComputerVo.c_com_pic == null}">
												<img src="/resources/computerImage/default.png"/>
											</c:when>
										<c:otherwise>
												<img src="/resources/image/main_logo2.png"/>
											</c:otherwise>
										</c:choose>
										</a>
									</td>
									<td>
										<a href="/computerProduct/detailComputerForm/${ComputerVo.p_no}">${ComputerVo.c_com_name}</a>
									</td>
									<td>
										<a href="/login/memberVoInfoForm/${ComputerVo.c_com_seller}">${ComputerVo.c_com_seller}</a>
									</td>
									<td>
										<span id="price">${ComputerVo.c_com_price}</span>원
									</td>
									<td>
										<a href="#">상품구매하기</a>
									</td>
								</tr>
							</tbody>
			
						</table>
						<hr>
					</c:forEach>
				</div>
</section>
<aside class="aside">
<br>
<a href="https://ulsankh.step.or.kr/page/lms" target="_blank" title="kh 정보교육원 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/khBanner.mp4" type="video/mp4">
</video>
</a>
<br>
<br>
<br>
<br>
<br>
<a href="https://www.samsung.com/sec/" target="_blank" title="삼성 레드 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/red.mp4" type="video/mp4">
</video>
</a>
<br>
<br>
<br>
<br>
<br>
<a href="https://www.netflix.com/kr/" target="_blank" title="넷플릭스 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/netflix.mp4" type="video/mp4">
</video>
</a>
</aside>
</div>

<%@ include file="../include/footer.jsp"%>

