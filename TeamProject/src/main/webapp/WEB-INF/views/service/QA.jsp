<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
.listMenu{
	text-align: center;
	font-size:15px;
}
.inquiry{
	font-size: 11px;
}
.cate_name{
	width:200px;
	font-size:15px;
	text-align: center;
}
.cate_btn{
	text-align:center;
	width:60px;
}
</style>
<script>
	$(function(){
		$(".btnShow").on("click", function(){
			var that = $(this).parent().parent().next();
			that.toggle();
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<ul class="nav nav-tabs listMenu">
				<c:forEach var="qaCategory" items="${firstQACategory}">
					<li class="nav-item"><a class="nav-link" href="/service/Q&ACategory/${qaCategory.qa_cate_no}">${qaCategory.qa_cate_name}</a></li>
				</c:forEach>
			</ul>	
		</div>
		<div class="col-md-3"></div>
	</div>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<table class="table">
				<tbody>
				<c:forEach var="QandAVo" items="${QAList}">
					<tr>
						<c:forEach var="QACateVo" items="${qaCategoryList}">
							<c:if test="${QandAVo.qa_cate_no == QACateVo.qa_cate_no}">
								<td class="cate_name">${QACateVo.qa_cate_name}</td>
							</c:if>
						</c:forEach>
						<td class="cate_content">${QandAVo.q_content}</td>
						<td class="cate_btn"><button type="button" class="btnShow">+</button></td>
					</tr>
					<tr style="display: none;">
						<td class="cate_name"></td>
						<td class="cate_content">
							${QandAVo.a_content}<br>
							<div class="inquiry">
								더 궁금하신 사항이 있으시다면 <a href="/service/inquiry?m_id=${memberVo.m_id}">1:1문의</a>를 이용해주세요.<br>
								로그인 회원만 이용 가능합니다.
							</div>
						</td>
						<td class="cate_btn"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
