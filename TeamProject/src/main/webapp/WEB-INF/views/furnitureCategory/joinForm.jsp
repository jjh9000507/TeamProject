<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="cs" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/css/bootstrap.jsp" %>
<html>
<head>

 <title>회원가입</title>
    		 	
    	<link href="<cs:url value='/resources/css/member_join.css'/>" rel="stylesheet" type="text/css" >	
    	
    	<script src="<cs:url value="resources/js/MemberSignup.js"/>"></script>	
    		 
		<style type="text/css">
 		.terms-agree-notice .imp_txt{font-size:13px !important}
 		.terms-agree-notice .imp_txt strong{font-weight:bold !important}
		</style>
		
		<!-- 자바스크립트 시작 -->
		<script type="text/javascript">
		
		//-------------------------------------------- 아이디 처리 ---------------------------------------------------//
		
		function FocusIn_IDForm(obj){ //포커스가 아이디 텍스트에 들어오면 처리
			if(obj.value == '아이디'){
				obj.value="";
			}
		}//FocusIn_IDForm
		
		function FocusOut_IDForm(obj) { //포커스가 아이디 텍스트를 벗어나면 처리
			$(obj).removeClass('focus');
			CheckIDValidation(obj);
		}//FocusOut_IDForm
		
		function CheckIDValidation(obj){ //아이디 체크
			var current = $('.info-enter .info-cont .enter-id');
			current.removeClass('incorrect');
			current.removeClass('usable');
			$('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
			$('.info-enter .info-cont ul .enterid_area .txt01').hide();
			$('.info-enter .info-cont ul .enterid_area .txt02').hide();

			if (obj.value == '')
			{
				$("#idBlankChk").show();
				$('.info-enter .info-cont ul .enterid_area .enter-guide').show();
				return;
			}
			
			if (!CheckID(obj, false, $('.info-enter .info-cont ul .enterid_area .txt02').get(0))) {
				$('.enter-id').addClass('incorrect');
				$('.info-enter .info-cont ul .enterid_area .txt02').show();				
				return;
			}	
		}//CheckIDValidation
		
		function CheckID(TextBoxControl, valueReset, messageControl) //아이디 유효성 체크
		{
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			if (inputValue.length ==0)
			{
				messageControl.innerHTML ="사용자 아이디를 입력하세요.";	// 실제로는 노출되지 않는다.
				if(valueReset){TextBoxControl.value="";}
				//TextBoxControl.focus();
				return false;
			}
			//1.입력값체크
			if(inputValue.replace(/[A-Za-z0-9]/g,"").length!=0){
				messageControl.innerHTML ="아이디는 영문, 숫자만 사용하실 수 있습니다.";
				if(valueReset){TextBoxControl.value="";}
				//TextBoxControl.focus();
				return false;
			}
		
			//1.공백문자체크
			if(TextBoxControl.value.indexOf(' ') >= 0)
			{
				messageControl.innerHTML = "아이디에 띄어쓰기는 사용할 수 없습니다.";
				TextBoxControl.value = TextBoxControl.value.replace(/ /g, "") ;
				//TextBoxControl.focus();
	
				return false;
			}

			//2.길이체크
			if (inputValue.length < 4 || inputValue.length > 12) {
				messageControl.innerHTML ="아이디는 4~12자를 사용해 주세요.";
				if(valueReset){TextBoxControl.value="";}
				//TextBoxControl.focus();
				return false;
			}
			return true;
		}//CheckID
		
		//-------------------------------------------- 비밀번호 처리 ---------------------------------------------------//
		
		function FocusIn_PwdForm(obj){ //패스워드 입력창에 포커스 이동시
		
			$(obj).removeClass('focus');
			$(obj).removeClass('passwordInfoImg');
//  			$('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
		}//FocusIn_PwdForm
		
		function validatePasswordType(objPassWord){ //패스워드 입력창에서 키보들 땔 때
			//	if(document.getElementById('cb_password').checked)				// 확인 체크박스에 표시되어있으면 리턴
			//		return;
				var current = $('#txt_enterpw');

				var resultType = objPw.getType(objPassWord); //MemberSignup.js
				current.removeClass('incorrect');
				current.removeClass('usable');
				$('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
				$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
				$("#password_err").hide();

				var id = $('#txt_enterid').val();

				if ($(objPassWord).val() == ""){
					$("#lb_confirm_pwd").css("font-weight","normal");
					return;
				}

				if (resultType != "" && resultType !="21" && resultType !="31"){
					current.addClass('incorrect');
					//$("#cb_password").attr("disabled",true);
					$("#lb_confirm_pwd").css("font-weight","normal");
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
					$("#password_err").show();
					
					var message;
					switch (resultType) {
						case "00":
							message = "안전한 사용을 위해 " + passwordType + "자 이상 입력해주세요";
							break;
						case "01":
							message = "안전한 사용을 위해 숫자만 사용할 수 없습니다.";
							break;
						case "02":
							message = "안전한 사용을 위해 영문만 사용할 수 없습니다.";
							break;
						case "03":
							message = "안전한 사용을 위해 특수문자만 사용할 수 없습니다.";
							break;
						case "04":
							message = "연속되는 문자와 숫자를 사용하실 수 없습니다.";
							break;
						case "05":
							message = "동일한 문자, 숫자를 반복해서 사용하실 수 없습니다.";
							break;
						case "11":
							message = "안전한 사용을 위해 숫자만 사용할 수 없습니다.";
							break;
						case "12":
							message = "안전한 사용을 위해 영문만 사용할 수 없습니다.";
							break;
						case "13":
							message = "안전한 사용을 위해 특수문자만 사용할 수 없습니다.";
							break;
					}
					$("#password_err").text(message);
				}else {
					current.addClass('usable');
					$("#lb_confirm_pwd").css("font-weight","bold");
					//$("#cb_password").attr("disabled",false);
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').show();
					$("#password_err").hide();
					var message;
					switch (resultType) {
						case "21":
							message = "사용가능한 적정수준의 비밀번호입니다.";
							break;
						case "31":
							message = "매우 안전한 비밀번호 입니다.";
							break;						
					}
					$('.info-enter .info-cont ul .enterpw_area .txt01').text(message);
				} //if				
			}//validatePasswordType
			
			function FocusOut_PwdForm(obj) { //포커스가 패스워드 입력창을 벗어나면 실행
				if(!$(obj).hasClass("usable")){
					$(obj).addClass("passwordInfoImg");
				}else{
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
				}									
			}//FocusOut_PwdForm
			
			function CheckPasswordConfirm() {
				var passwdObj = $("#txt_enterpw");
				var passwdConfirmObj = $("#txt_enterpw_confirm");
				var errDisplayObj = $('#password_confirm_err');
				
				passwdConfirmObj.removeClass("incorrect");
				passwdConfirmObj.removeClass("usable");

				if (!passwdConfirmObj.val() || passwdConfirmObj.val().length == 0) {
					errDisplayObj.text("비밀번호를 재입력해주세요.");
					errDisplayObj.show();
					
					passwdConfirmObj.addClass("incorrect");
				}
				else if (passwdObj.val() != passwdConfirmObj.val()) {
					errDisplayObj.text("비밀번호가 일치하지 않습니다.");
					errDisplayObj.show();

					passwdConfirmObj.addClass("incorrect");
					passwdConfirmObj.val("");
				} else {
					passwdConfirmObj.addClass("usable");
					$("#password_confirm_accord").show();
					errDisplayObj.hide();
				}
			}//CheckPasswordConfirm

			// 비밀번호 도움
			function OpenPasswordGuide(){
				window.open("/resources/passwordHelp.html","MsgWindow", "toolbar=no,location=0,titlebar=no,directories=0,status=no,menubar=0,scrollbars=yes,copyhistory=0");
			}

			//-------------------------------------------- 전화번호 처리 ---------------------------------------------------//
			function CheckNumberWithKeyupEvent(obj){ //전화번호 뒷자리 키 입력시 처리부분
				var keycode = event.keyCode;
 
				if( !((48 <= keycode && keycode <=57) || (96 <= keycode && keycode <=105 ) ||
							keycode == 13 || keycode == 46 || keycode == 8 || keycode == 32 || keycode == 9) ){
					alert("숫자만 입력 가능합니다. 다시 입력해주세요");
					$(obj).val("");
				}
			}
			
			$(function(){
				$("#goToMap").click(function(){
					location.href="/map";
				});	
			});//맵으로
						
		</script>
</head> 
<body>	
<%@ include file = "include/header.jsp" %>
<button type="button" id="goToMap">맵으로</button>
  <form name="form1" method="post" action="" id="form1">
		<div id="wrap" class="kcc_wrap">
			<div style="font-size:40px;text-align:center;font-family:Lucida Console, Courier, New monospace">MEMBER JOIN</div>
			<div id="min_width">		
				<div id="body">					
					<div class="info-enter">
						<div class="inner">
            <!-- [D] 이미지 변경 726.2014-11-13 -->
            			<h3><img height="100px" src="<spring:url value='/resources/image/joinIcon.png'/>"></h3>
						<div class="info-cont">
							<ul>
								<li class="entername_area">
									<input name="txt_name" type="text" id="txt_name" class="enter-name placeholder" value="이름" style="width:427px;" maxlength="12" title="이름" placeholder="이름" onfocus="if(this.value == &#39;이름&#39;) this.value = &#39;&#39;"/>
								</li> 
								<li class="enterid_area">
									<input name="txt_enterid" type="text" id="txt_enterid" placeholder="아이디" value="아이디" maxlength="12" class="enter-id placeholder" onblur="FocusOut_IDForm(this)" style="width:427px;" onfocus="FocusIn_IDForm(this);" title="아이디" />
									<!-- 사용가능한 아이디인 경우 input에 class="usable" 추가, 아이디가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<!--p id="tickcount">tickcount =</p-->
									<p class="enter-guide">띄어쓰기 없이 영문과 숫자를 혼합하여 4~12자를 사용할 수 있습니다.</p>
									<p class="txt01" style="display:none">사용가능한 아이디입니다.</p><!-- 사용가능한 아이디인 경우 -->
									<p class="txt02" id="idBlankChk" style="display:none">아이디를 넣어주세요.</p><!-- 아이디가 조건에 맞지않는 경우 -->
								</li>
								<li class="enterpw_area">							
									<input name="txt_enterpw" type="password" id="txt_enterpw" class="passwordInfoImg" style="width:427px;" onfocus="FocusIn_PwdForm(this);"
									maxlength="15" onkeyup="validatePasswordType(this);" onblur="FocusOut_PwdForm(this)" title="비밀번호 입력" />													
									<!-- 비밀번호가 안전한 경우 input에 class="usable" 추가, 비밀번호가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<span class="pw-guide"><a href="#" onclick="OpenPasswordGuide();" title="새창으로 열림">비밀번호 도움말</a></span><!-- 2013-06-20 eun -->
									<p class="enter-guide" id="pwGide">안전한 사용을 위해 영문, 숫자, 특수문자 조합 6~15자를 사용해 주세요.</p>
									<p class="txt01" style="display:none">완벽한 비밀번호 입니다.</p><!-- 비밀번호가 안전한 경우 -->
									<p class="txt02" style="display:none" id="password_err">유추하기 쉬운 비밀번호 입니다.</p><!-- 비밀번호가 조건에 맞지않는 경우 -->
								</li>
								<li class="enterpw_area_conform">																
									<input type="password" onblur="CheckPasswordConfirm();" maxlength="15" title="방금 입력한 비밀번호와 같은 비밀번호를 한번 더 입력해주세요" 
										style="width: 427px;" value="" class="enter-pw enter-repw" id="txt_enterpw_confirm">
									<p style="display:none" class="txt02" id="password_confirm_err">비밀번호가 일치하지 않습니다.</p><!-- 비밀번호가 조건에 맞지않는 경우 -->
									<p style="display:none" class="txt01" id="password_confirm_accord">비밀번호가 일치합니다</p>																																				
								</li>
								<li>
									<span id="mobile_tel1_span">
									<select name="ddlMobileTel1" id="ddlMobileTel1" class="styleSelect" title="휴대폰 앞자리 선택" style="width:123px">
										<option value="휴대폰 번호 선택">휴대폰 번호 선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="0130">013</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>									
									</select>
									</span>
									<input type="text" id="mobile_tel1_temp" style="width:123px; display:none" title="선택된 휴대폰 앞자리" />
									<span class="dash">-</span> 
									<input name="mobile_tel2" type="text" id="mobile_tel2" style="width:123px;" maxlength="4" title="휴대폰 중간자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="mobile_tel3" type="text" id="mobile_tel3" style="width:123px;" maxlength="4" title="휴대폰 뒷자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" />
								</li>
								<li>
									<input name="email1" type="text" id="email1" placeholder="이메일" class="placeholder" style="width:120px;" title="이메일" /> 
									<span class="gol">@</span> 									 
                                    <select name="ddlEmailDomain" id="ddlEmailDomain"  class="styleSelect" style="width:130px;">
										<option value="">선택</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="direct_input">직접입력</option>
									</select>		
                                    <p style="display:none" class="txt01" id="email_validate_complete">사용가능한 이메일입니다.</p>
                                    <p style="display:none" class="txt02" id="email_duplicate_err"></p>                                 						
								</li>
							</ul>
						</div>
					</div>
					
					<!-- 가입과 취소 버튼 삽입 시작-->
					</p>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-3">
							<button type="button" class="btn btn-outline-primary btn-lg">가입</button>
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-outline-danger btn-lg">취소</button>
						</div>
						<div class="col-md-3"></div>
					</div>	
					<!-- 가입과 취소 버튼 삽입 끝-->
								
					</div>			
				</div><!--min-width -->
			</div>
		</div><!--wrap -->
	</form>
</body>
</html>