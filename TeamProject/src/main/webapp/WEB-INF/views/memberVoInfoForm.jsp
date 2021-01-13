<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<br>
<br>
<br>
<br>
<br>
<script>
$(function() {
	var secretCodeNum = "";
	
	$("#memberVoInfoUpdateButton").click(function() {
		$("#modal-549609").trigger("click");
	});
	$("#sendPhoneMessage").click(function() {
		var m_phonenumber_send = $("#m_phonenumber_send").val();
		console.log("sendPhoneMessage + m_phonenumber_send:" + m_phonenumber_send);
		var m_pass_new = $("#m_pass_new").val();
		var m_email_new = $("#m_email_new").val();
		var m_phonenumber_new = $("#m_phonenumber_new").val();
		var url = "/login/sendMessageForMemberInfoUpdate";
		var sendData = {
 			"m_phonenumber_send" : m_phonenumber_send
// 			"m_pass" : m_pass_new,
// 			"email" : m_email_new,
// 			"m_phonenumber" : m_phonenumber_new
		};
		$.post(url, sendData, function(data) {
			console.log("sendMessageForMemberInfoUpdate + data1:" + data);
			
			
			if (data[0] == "success") {
				alert("인증코드 폼");
// 				$("#btnEmailPwSendClose").trigger("click");
				$("#closeSecretNumberSend").trigger("click");
				$("#modal-pw").trigger("click");
				secretCodeNum = data[1];
			} else if (data[0] == "fail") {
				alert("문자 전송 실패");
			}
		});
	});
	
	$("#changePwByPhonenumber").click(function() {
		var m_id_for_change = $("#m_id_for_change").val();		
		var m_pass_new = $("#m_pass_new").val();		
		var m_email_new = $("#m_email_new").val();
		var m_phonenumber_new = $("#m_phonenumber_new").val();
		var url = "/login/sendMessageForMemberInfoUpdateContents";
		var sendData = { 
			"m_id" : m_id_for_change,
			"m_pass" : m_pass_new,
			"email" : m_email_new,
			"m_phonenumber" : m_phonenumber_new			
		};
		var secretCodeNumberConfirm = $("#secretCodeNumberConfirm").val();
		console.log("secretCodeNum:" + secretCodeNum);
		console.log("secretCodeNumberConfirm:" + secretCodeNumberConfirm);
		if(secretCodeNum == secretCodeNumberConfirm){	
		
		$.post(url, sendData, function(data) {
			console.log("sendMessageForMemberInfoUpdateContents + data:" + data);
			if (data == "success") {
				alert("회원정보 변환 성공");
				$("#changePwByPhonenumberClose").trigger("click");			
			} else if (data == "fail") {
				alert("회원정보 변환 실패");
			}
		});
		}else{
			alert("인증코드가 다르니 다시 입력하시오.");
		}
	});
	
	
});
</script>
<div class="container-fluid">
<div class="row">
		<div class="col-md-12">
			 <a id="modal-549609" href="#modal-container-549609" role="button" class="btn" style="display: none;" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-549609" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content memberInfoHeaderModal">
						<div class="modal-header">
							<h5 class="modal-title memberVoInfoFormFont" id="myModalLabel">
								전화로 인증코드 보내기
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<h6 class="memberVoInfoFormFont">해당 전화번호로 인증코드를 보낼까요?</h6>
							<input type="text" id="m_phonenumber_send" 
								 name="m_phonenumber_send" value="${memberVoInfo.m_phonenumber}"
								 style="display: none;"/>
						</div>
						<div class="modal-footer">
							 
							<button type="button" id="sendPhoneMessage" class="btn btn-primary">
								전화번호로 인증코드 발송
							</button> 
							<button type="button" id="closeSecretNumberSend" class="btn btn-secondary" data-dismiss="modal">
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
			 <a id="modal-pw" href="#modal-container-pw" role="button" class="btn" style="display: none;" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-pw" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content memberInfoHeaderModal">
						<div class="modal-header">
							<h5 class="modal-title memberVoInfoFormFont" id="myModalLabel">
								회원정보 수정창
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="text" class="form-control" id="secretCodeNumberConfirm"
								name="secretCodeNumberConfirm" placeholder="인증번호를 입력하시오"
								 required="required"/>
							<input type="text" class="form-control" id="m_pass_new"
								name="m_pass_new" placeholder="변경할 비밀번호를 입력하시오"
								 required="required"/>
							<input type="email" class="form-control" id="m_email_new"
								 name="m_email_new"	required="required"
								 placeholder="변경할 이메일을 입력하시오"/>
							<input type="tel" class="form-control" id="m_phonenumber_new"
								 name="m_phonenumber_new"	required="required"
								 placeholder="변경할 전화번호를 입력하시오"/>
							<input type="text" style="display: none;" id="m_id_for_change"
								 name="m_id_for_change" value="${memberVoInfo.m_id}"/>
						</div>
						<div class="modal-footer">							 
							<button type="button" id="changePwByPhonenumber" class="btn btn-primary">
								비밀번호 변환
							</button> 
							<button type="button" id="changePwByPhonenumberClose" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
	
	
	
${sessionScope.sendProductBoughtInfoVo}	
<div class="row">
		<div class="col-md-12">
			<form role="form" class="memberVoInfoFormHeader">
				<div class="form-group">					 
					<h1 class="memberVoInfoFormFontHead">회원정보<a>&nbsp;&nbsp;&nbsp;</a>
						<button type="button" id="memberVoInfoUpdateButton" class="btn btn-primary btn-sm">회원정보 수정</button></h1>
				</div>				
				<div class="form-group">
					 <div class="row">
		<div class="col-md-12">
			<table class="table memberVoInfoFormTable memberVoInfoFormFont">
				
				<tbody>
					<tr>
						<td>아이디</td>
						<td>${memberVoInfo.m_id}</td>						
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>${memberVoInfo.m_pass}</td>						
					</tr>
					<tr>
						<td>성명</td>
						<td>${memberVoInfo.m_name}</td>						
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${memberVoInfo.m_phonenumber}</td>						
					</tr>
					<tr>
						<td>이메일</td>
						<td>${memberVoInfo.email}</td>						
					</tr>
					<tr>
						<td>포인트</td>
						<td>${memberVoInfo.m_point}</td>						
					</tr>
					<tr>
						<td>사진</td>
						<td><img height="77" src="/resources/userImage/defaultjjh.jpg"
						class="img-rounded" alt="User Image" /></td>						
					</tr>
				</tbody>
			</table>
		</div>
	</div>
					
				</div> 
				</form>
		</div>
	</div>	
</div>