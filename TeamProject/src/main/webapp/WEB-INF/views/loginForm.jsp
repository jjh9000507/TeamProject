<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jsp"%>
<br>
<br>
<br>
<br>
<br>

<script>
$(function(){
	$("#findID").click(function() {
		$("#modal-210594").trigger("click");
	});
	$("#findPW").click(function() {
		$("#modal-3000").trigger("click");
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-210594" href="#modal-container-210594" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-210594" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content loginHeaderModal">
						<div class="modal-header">
							<h5 class="modal-title loginFont" id="myModalLabel">
								아이디 찾기 폼
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<input type="email" class="form-control" id="e_mail" name="e_mail" placeholder="등록된 e-mail를 입력하시오" 
					 required="required"/>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary">
								등록된 이메일로 받아보기
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-3000" href="#modal-container-3000" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-3000" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content loginHeaderModal">
						<div class="modal-header">
							<h5 class="modal-title loginFont" id="myModalLabel">
								비밀번호 찾기 폼
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디를 입력하시오" 
					 required="required"/>
						<input type="email" class="form-control" id="e_mail" name="e_mail" placeholder="등록된 e-mail를 입력하시오" 
					 required="required"/>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary">
								등록된 이메일로 받아보기
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<form role="form" class="loginHeader" action="/loginRun"
				method="post">

				<div class="form-group">

					<h1 class="loginFontHead">로그인 폼</h1>

				</div>
				<div class="form-group">

					<label for="m_id" class="loginFont"> 아이디 </label> <input
						type="text" class="form-control" id="m_id" name="m_id"
						placeholder="아이디를 입력하시오" value="${cookie.saveId.value}"
						required="required" />
				</div>
				<div class="form-group">

					<label for="m_pass" class="loginFont"> 비밀번호 </label> <input
						type="password" class="form-control" id="m_pass" name="m_pass"
						placeholder="비밀번호를 입력하시오" required="required" />
				</div>

				<div class="checkbox">

					<label class="loginFont"> <input type="checkbox"
						name="saveId"
						<c:if test="${not empty cookie.saveId.value}">checked</c:if> />
						아이디 체크
					</label> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
					<a type="button"
						class="loginFont" id="findID">아이디 찾기</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a type="button" class="loginFont" id="findPW">비밀번호 찾기</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a type="submit" class="loginFont" href="#">회원가입</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a type="submit" class="loginFont" href="#">비회원 주문조회</a>
				</div>
				<button type="submit" class="btn btn-primary loginFont">
					로그인</button>

			</form>

		</div>
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="include/footer.jsp"%>