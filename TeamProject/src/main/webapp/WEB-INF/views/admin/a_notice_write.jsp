<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="insertNotice" method="get">
				
				<div class="form-group">
					<label for="notice_title">제목</label>
					<input type="text" class="form-control" id="notice_title" name="notice_title" />
				</div>
				
				<div class="form-group">
					<label for="notice_content">공지내용</label>
					<textarea class="form-control" id="notice_content" name="notice_content"></textarea>
				</div>

				<button type="submit" class="btn btn-primary">
					작성완료
				</button>
			</form>
		</div>
	</div>
</div>