<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/admin_header.jsp"%>
<!-- 
	여기에는 테이블 넣어서 문의제목, 작성자, 문의일 / 답변하기버튼  이런 순서로 만들 예정
	답변하기 누르면 테이블 이동하고, 제목은 [re]문의제목
	내용은
	문의내용
	--------
	답변
	
	이런 식으로 쓸 예정이고
	현진이 형한테 물어서 메일로 해당 답변이 전개되도록 해보자.
 -->
<style>
.inqumid{
	width:70px;
}
.inqumbtn{
	width:100px;
}
.inqutitle{
	cursor: pointer;
}
.inquiryTr{
	cursor:pointer;
}
</style>
<script>
	$(function(){
		$(".inquiryTr").on("click", function(){
			var that = $(this).next();
			that.toggle();
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<table class="table">
				<thead>
					<tr>
						<th>문의자</th>
						<th>문의 제목</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="InquiryVo" items="${inquiryList}">
					<tr class="inquiryTr">
						<td class="inqumid">${InquiryVo.m_id}</td>
						<td class="inqutitle">${InquiryVo.inquiry_title}</td>
						<td class="inqumbtn"></td>
					</tr>
					<tr style="display: none;">
						<td></td>
						<td>${InquiryVo.inquiry_content}</td>
						<td><a href="/admin/inquiryAnswer/${InquiryVo.inquiry_no}">답변하기</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>