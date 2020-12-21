<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<form role="form" action="sellWhiteGoodsUpload" method="get">
				<div class="form-group">
					<label for="p_name"> 상품명 </label>
					<input name="p_name"
						type="text" class="form-control" id="p_name" />
				</div>
				
				<div class="form-group">
					<label for="p_price"> 판매가 </label>
					<input name="p_price"
						type="number" class="form-control" id="p_price" />
				</div>
				
				<div class="form-group">
					<label>카테고리1</label>
					<select id="large">
						<option value="301">영상가전
						<option value="302">계절가전
						<option value="303">주방가전
						<option value="304">생활가전
						<option value="305">기타
					</select>
				</div>
				
				<div class="form-group">
					<label>카테고리2</label>
					<select id="middle">
						<c:choose>
							<c:when test='$("#large").val("301")'>
								<option value="301">영상가전
								<option value="302">계절가전
								<option value="303">주방가전
								<option value="304">생활가전
								<option value="305">기타
							</c:when>
						</c:choose>
					</select>
				</div>
				
				<div class="form-group">
					<label>카테고리3</label>
					<select id="small">
						<option value="301">영상가전
						<option value="302">계절가전
						<option value="303">주방가전
						<option value="304">생활가전
						<option value="305">기타
					</select>
				</div>
				
				<div class="form-group">
					<label for="p_content"> 상품 설명 </label>
					<textarea id="p_content" name="p_content" class="form-control"></textarea>
				</div>
				
				
				<button type="button" id="btnSellProductUpload" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>