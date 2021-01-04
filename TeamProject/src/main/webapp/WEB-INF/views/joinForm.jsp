<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="cs" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file = "include/header_mainCatagories.jsp" %>
<%@ include file = "include/header.jsp" %>

 <title>회원가입</title>
    	<link href="<cs:url value='/resources/css/member_join.css'/>" rel="stylesheet" type="text/css" >	
    	<script src="<cs:url value="/resources/js/MemberSignup.js"/>"></script>	
    		 
    	<style>
    	ul{
		   list-style:none;
		   }
		
		.align-center { text-align: center; }
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
				var current = $('#m_pass');

				var resultType = objPw.getType(objPassWord); //MemberSignup.js
				current.removeClass('incorrect');
				current.removeClass('usable');
				$('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
				$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
				$("#password_err").hide();

				var id = $('#m_id').val();

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
				var passwdObj = $("#m_pass");
				var passwdConfirmObj = $("#m_pass_confirm");
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
				$("#btnPhoneConfirm").hide(); //보내기버튼
				$("#divPhoneConfirm").hide(); //입력 텍스트와 확인 버튼
				$("#lblPhoneConfirmResult").hide(); //"인증완료" 라벨 부분
				
				var keycode = event.keyCode;
				
 				//console.log("keycode:"+keycode);
				if( !((48 <= keycode && keycode <=57) || (96 <= keycode && keycode <=105 ) ||
							keycode == 13 || keycode == 46 || keycode == 8 || keycode == 32 || keycode == 9) ){
					//alert("숫자만 입력 가능합니다. 다시 입력해주세요");
					$(obj).val("");
				
				}else{ //전화번호 가운데와 끝이 4자리 이면 본인 인증 보이기
					
					var number_2 = $("#m_phonenumber2").val();
					var length_2 = number_2.length;
					
					var number_3 = $("#m_phonenumber3").val();
					var length_3 = number_3.length;
					
					if(length_2 == 4 && length_3 == 4){
						$("#btnPhoneConfirm").show();
					}
				}
			}
			
			//------------------------------------------------- 내가 추가 -------------------------------------//
			$(function(){
				
				/*
				전화는 문자를 보내고 확인 버튼을 누르면 결과값을 hidden에 넣어놓고
				메일은 인증 버튼을 누르면 입력된 메일로 인증 메일만 보내고
				인증확인은 가입 버튼을 눌렀을 때 비동기로 확인 한다
				*/
				$("#btnSubmit").click(function(){//회원가입 버튼 클릭시
					
					var m_name = $("#m_name").val();
					var m_pass = $("#m_pass").val();
					var m_phonenumber1 = $("#m_phonenumber1").val();
					var m_phonenumber2 = $("#m_phonenumber2").val();
					var m_phonenumber3 = $("#m_phonenumber3").val();
					
					var email1 = $("#email1").val();
					var email2 = $("#email2").val();
					
					//console.log("m_name:"+m_name+" ,m_pass:"+m_pass+" ,m_phonenumber1:"+m_phonenumber1+" ,m_phonenumber2:"+m_phonenumber2+" ,m_phonenumber3:"+m_phonenumber3+" ,email1:"+email1+" ,email2:"+email2);
					
					var email2Array = subStringEmail(email2);
					var checkid = $("#emailConfirmResult").attr("data-checkid"); 
					
					if(m_name=="" || m_pass=="" || m_phonenumber1=="" || m_phonenumber2==""|| m_phonenumber3=="" || email1=="" || email2=="") {
						alert("누락된 항목이 있습니다");
					}else if(checkid == null || checkid==""){
						$("#spanMailSend").text("메일 인증이 필요합니다");
						$("#spanMailSend").show();
					}else{
						//누락된 항목이 없으면
						//전화 인증 확인
						var phoneConfirmResult = $("#phoneConfirmResult").attr("result-phone");
						if(phoneConfirmResult != "success"){
							$("#btnPhoneConfirm").show();
							$("#divPhoneConfirm").hide();
							$("#lblPhoneConfirmResult").text("문자 인증이 필요합니다");
							$("#lblPhoneConfirmResult").show();
							return;
						}
						//메일 인증 확인 시작-----------------------------
						//email 도메인 쪼개기, natista@naver.com 비동기로 넘길 때 . 뒤를 못 넘긴다 그래서 짤라서 따로 넘긴다
						var email2Array = subStringEmail(email2);
						//이메일 인증 여부 비동기로 호출
						var url = "/join/emailStatusConfirm/"+email1+"/"+email2Array[0]+"/"+email2Array[1]+"/"+checkid;
						$.get(url,function(data){
							//console.log(data);
							if(data == "success"){
								//alert("success");
								$("#form").submit();
							}else{
								$("#spanMailSend").text("메일 인증이 필요합니다");
								$("#spanMailSend").show();
							}
						});//get
						//메일 인증 확인 끝-----------------------------
					}
				});//btnSubmit
		
				var smsCount;
				$("#btnPhoneConfirm").click(function(){ //휴대폰 문자로 본인 인증
					
					var m_phonenumber1 = $("#m_phonenumber1").val();
					var m_phonenumber2 = $("#m_phonenumber2").val();
					var m_phonenumber3 = $("#m_phonenumber3").val();
					
					var phoneNumber = m_phonenumber1 + m_phonenumber2 + m_phonenumber3;
					
					var url = "/join/phoneConfirm/"+phoneNumber;
					
					$.get(url, function(data){
						console.log("sms 인증 번호:"+data);
						$("#btnConfimNumber").attr("data-sms",data);
					})
					
					$("#lblPhoneConfirmResult").hide(); //"인증완료" 라벤 부분
					$("#txtPhoneConfirm").val(""); //문자 인증 숫자 입력 텍스트
					$("#divPhoneConfirm").show(); //문자 인증 숫자 텍스트와 확인, 시간 카운드 div
					$(this).text("다시 보내기");
					smsCount = setInterval(function() { //문자보내고 옆에 시간 카운트
						countNum()
					}, 1000);
				});//btnPhoneConfirm
				
				var minute = 5;
				var second = 60;
				var count = 0;
				function countNum(){ //문자입력시 옆에 카운트다운
					count++;
					if(count == 1){
						minute = 2;
						second=60;
					}else if(count == 60){
						minute = 1;
						second=60;
					}else if(count == 120){
						minute = 0;
						second=0;
						clearInterval(smsCount);
					}
					
					if(second>0 && second<10){
						$("#lblCount").text(minute + ":0" + second--);
					}else{
						$("#lblCount").text(minute + ":" + second--);
					}
					
				}//countNum
				
				$("#btnConfimNumber").click(function(){ //전화 문자보내고 나서 옆에 확인 버튼
					var smsUser = $("#txtPhoneConfirm").val(); //가입자가 입력한 번호
					var smsSend = $(this).attr("data-sms"); //컨트롤로에서 받아온 번호
					
					//console.log("smsUser:"+smsUser+" ,smsSend:"+smsSend);
					if(smsUser == smsSend){
						clearInterval(smsCount);	
						$("#btnPhoneConfirm").hide();
						$("#divPhoneConfirm").hide();
						
						$("#phoneConfirmResult").attr("result-phone","success");
						
						$("#lblPhoneConfirmResult").text("인증 완료");
						$("#lblPhoneConfirmResult").show();
					}
				});//btnConfimNumber
				
				$("#btnEmailConfirm").click(function(){ //메일 인증버튼으로 메일을 보낸다
					var email_name = $("#email1").val();
					var email2 = $("#email2").val();
					console.log("email_name:"+email_name+" ,email2:"+email2)
					
					if(email_name != "" && email2 != ""){
					//natista@naver.com 비동기로 넘길 때 . 뒤를 못 넘긴다 그래서 짤라서 따로 넘긴다
					var email2Array = subStringEmail(email2);
					//console.log("email2Array[0]"+email2Array[0]); //도메인 앞 부분
					//console.log("email2Array[1]"+email2Array[1]); //도메인 뒷 부분
					var url = "/join/emailConfirm/"+email_name+"/"+email2Array[0]+"/"+email2Array[1];
					
					$.get(url,function(data){
						//console.log("메일 checkid:"+data);
						$("#spanMailSend").text("메일을 확인하세요")
						$("#spanMailSend").show();
						//메일을 보내고 만든 checkid의 값을 data로 받아서 가입버튼을 눌렀을 때 비동기로 보내준다
						$("#emailConfirmResult").attr("data-checkid",data); 
					});
					}
				
				});//

				
				function subStringEmail(email2){ //메일 도메인 부분 짜르기
					var email2Array = new Array();
					
					var length = email2.length;
					var length_dot = email2.lastIndexOf(".");
					var email2_forward = email2.substring(0, length_dot);
					var email2_back = email2.substring(length_dot+1, length);
					//console.log("email2_forward:"+email2_forward+" ,email2_back:"+email2_back);
					
					email2Array.push(email2_forward);
					email2Array.push(email2_back);
					
					return email2Array;
				}
			});//function
		</script>

  <form name="form" method="get" action="/join/joinRun" id="form">
		<div id="wrap" class="kcc_wrap">
			<div style="font-size:60px;text-align:center;font-family:font-family: 'East Sea Dokdo', cursive;color:orange">중고 동네 회원가입</div>
			<div id="min_width">		
				<div id="body">					
					<div class="info-enter">
						<div class="inner">
            <!-- [D] 이미지 변경 726.2014-11-13 -->
            			<h3></h3>
						<div class="info-cont">
							<ul>
								<li class="entername_area">
									<input name="m_name" type="text" id="m_name" class="enter-name placeholder" value="이름" style="width:427px; maxlength:12px;" title="이름" placeholder="이름" onfocus="if(this.value == &#39;이름&#39;) this.value = &#39;&#39;"/>
								</li> 
								<li class="enterid_area">
									<input name="m_id" type="text" id="m_id" placeholder="아이디" value="아이디" maxlength="12" class="enter-id placeholder" onblur="FocusOut_IDForm(this)" style="width:427px;" onfocus="FocusIn_IDForm(this);" title="아이디" />
									<!-- 사용가능한 아이디인 경우 input에 class="usable" 추가, 아이디가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<!--p id="tickcount">tickcount =</p-->
									<p class="enter-guide">띄어쓰기 없이 영문과 숫자를 혼합하여 4~12자를 사용할 수 있습니다.</p>
									<p class="txt01" style="display:none">사용가능한 아이디입니다.</p><!-- 사용가능한 아이디인 경우 -->
									<p class="txt02" id="idBlankChk" style="display:none">아이디를 넣어주세요.</p><!-- 아이디가 조건에 맞지않는 경우 -->
								</li>
								<li class="enterpw_area">							
									<input name="m_pass" type="password" id="m_pass" class="passwordInfoImg" style="width:427px;" onfocus="FocusIn_PwdForm(this);"
									maxlength="15" onkeyup="validatePasswordType(this);" onblur="FocusOut_PwdForm(this)" title="비밀번호 입력" />													
									<!-- 비밀번호가 안전한 경우 input에 class="usable" 추가, 비밀번호가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<span class="pw-guide"><a href="#" onclick="OpenPasswordGuide();" title="새창으로 열림">비밀번호 도움말</a></span><!-- 2013-06-20 eun -->
									<p class="enter-guide" id="pwGide">안전한 사용을 위해 영문, 숫자, 특수문자 조합 6~15자를 사용해 주세요.</p>
									<p class="txt01" style="display:none">완벽한 비밀번호 입니다.</p><!-- 비밀번호가 안전한 경우 -->
									<p class="txt02" style="display:none" id="password_err">유추하기 쉬운 비밀번호 입니다.</p><!-- 비밀번호가 조건에 맞지않는 경우 -->
								</li>
								<li class="enterpw_area_conform">																
									<input type="password" onblur="CheckPasswordConfirm();" maxlength="15" title="방금 입력한 비밀번호와 같은 비밀번호를 한번 더 입력해주세요" 
										style="width: 427px;" value="" class="enter-pw enter-repw" id="m_pass_confirm">
									<p style="display:none" class="txt02" id="password_confirm_err">비밀번호가 일치하지 않습니다.</p><!-- 비밀번호가 조건에 맞지않는 경우 -->
									<p style="display:none" class="txt01" id="password_confirm_accord">비밀번호가 일치합니다</p>																																				
								</li>
								<li>
									<span id="mobile_tel1_span">
									<select name="m_phonenumber1" id="m_phonenumber1" class="styleSelect" title="휴대폰 앞자리 선택" style="width:123px">
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
									<input name="m_phonenumber2" type="text" id="m_phonenumber2" style="width:123px;" maxlength="4" title="휴대폰 중간자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="m_phonenumber3" type="text" id="m_phonenumber3" style="width:123px;" maxlength="4" title="휴대폰 뒷자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" />
								</li>
								<li>
									<label id="lblPhoneConfirmResult" style="display:none;font-color:red"></label>
									<button type="button" id="btnPhoneConfirm" style="font-size:14px;width:61px;flat:left;display:none">본인 인증</button>
									<span id="divPhoneConfirm" style="margin-left:40px;display:none"> 
										인증번호 : <input type="text" id="txtPhoneConfirm">
										<button type="button" id="btnConfimNumber" style="border:none;font-size:14px;width:43px">확인</button>
										<lable id="lblCount"></lable>
									</span>
								</li>
								<li>
									<input name="email1" type="text" id="email1" placeholder="이메일" class="placeholder" style="width:120px;" title="이메일" />
									<span class="gol">@</span> 
									<select name="email2" id="email2"  class="styleSelect" style="width:130px;">
										<option value="">선택</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="direct_input">직접입력</option>
									</select>	
									<button type="button" style="width:90px" id="btnEmailConfirm">메일인증</button>	 
								</li>
								<li>
									<span id="spanMailSend" style="display:none">메일을 보냈습니다</span>
								</li>
							</ul>
							</div><!-- info-cont -->
						</div><!-- inner -->
					</div><!-- info-enter -->
				</div><!-- body -->			
			</div><!--min-width -->
		</div><!--wrap -->
		
		</p>
		<div style="margin-left:128px;text-align:center">
				<button type="button" id="btnSubmit" class="btn btn-outline-primary btn-lg" style="width:125px;margin-right:50px">가입</button>
				<button type="button" class="btn btn-outline-danger btn-lg" style="width:125px;margin-right:130px">취소</button>
				<input type="hidden" id="phoneConfirmResult">
				<input type="hidden" id="emailConfirmResult">
		</div>	
	</form>
	
<%@ include file="include/footer.jsp" %>