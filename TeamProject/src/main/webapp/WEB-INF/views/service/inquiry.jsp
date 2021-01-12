<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<form role="form" action="/service/inquiryQ" method="get">
				<input type="hidden" name="m_id" value="${sessionScope.memberVo.m_id}">
				<input type="hidden" name="email" value="${sessionScope.memberVo.email}">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="inquiry_title"/>
				</div>
				
				<div class="form-group">
					<label>문의 내용</label>
					<textarea class="form-control" name="inquiry_content"></textarea>
				</div>
				
				<div>
					<p>해당 문의는 회원님의 이메일 정보를 바탕으로 답신을 보내드립니다. 이메일을 확인해주세요.</p>
				</div>
				<button type="submit" class="btn btn-primary">
					문의하기
				</button>
			</form>
		</div>
	</div>
</div>