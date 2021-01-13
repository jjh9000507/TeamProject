<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/buyComputerProductDetail_css.css" %>
<%@ include file="../include/header.jsp"%>
<script>
function computer_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('computer_postcode').value = data.zonecode; // 우편번호
            document.getElementById('computer_roadAddress').value = roadAddr; // 도로명 주소
            
            if (roadAddr == ""){
	              document.getElementById('computer_roadAddress').value = data.jibunAddress; // 참고항목
            }
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("computer_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("computer_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

$(function(){
	var postcode = "";
	var roadAddress = "";
	var extraAddress = "";
	var detailAddress = "";
	$("#searchJuso").click(function() {
		$("#computer_postcode").val("");
		$("#computer_roadAddress").val("");
		$("#computer_extraAddress").val("");
		$("#computer_detailAddress").val("");
		$("#modalAddrByComputer").trigger("click");
	});
	$("#selectAddrComputer").click(function() {		
		postcode = $("#computer_postcode").val();
		roadAddress = $("#computer_roadAddress").val();
		extraAddress = $("#computer_extraAddress").val();
		detailAddress = $("#computer_detailAddress").val();
		console.log("postcode:" + postcode);
		console.log("roadAddress:" + roadAddress);
		console.log("extraAddress:" + extraAddress);
		console.log("detailAddress:" + detailAddress);
		alert("서버에 저장되었습니다.");
	});
	var m_id = "${sessionScope.memberVo.m_id}";
	var m_pass = "${sessionScope.memberVo.m_pass}";
	var p_no = "${buyComputerInfo.p_no}";
	var memberOfTelephone = "";
	var messageForDriver = "";
	
	$("#pushMessageAndTel").click(function(){
		memberOfTelephone = $("#memberOfTelephone").val();
		messageForDriver = $("#messageForDriver").val();
		alert("서버에 기입되었습니다");		
	});
	
	$("#buyProduct").click(function(){
		if(m_id != ""){	
		if((postcode != "") && (roadAddress != "") && (extraAddress != "") && (detailAddress != "")){
		if((memberOfTelephone != "") && (messageForDriver != "")){		
		var isConfirm = confirm("정말 구매하시겠어요?");
		if(isConfirm == true){
			var radioVal = $('input[name="Payment"]:checked').val();					
			alert("주문합니다.");
			var urlSendNum = "/buyComputerProduct/sendForGetPurchasePercentage";
			var productNum = "${buyComputerInfo.productNum}";
			var productName = "${buyComputerInfo.productName}";
			var seller = "${buyComputerInfo.seller}";
			var sendDataSendNum = {
				"productNum" : productNum,
				"productName" : productName,
				"seller"      : seller
			};
			$.post(urlSendNum,sendDataSendNum, function(data) {
				if(data == "success"){
					
				}else{
					alert("실패");
				}
			});
			
			console.log("radioVal:" + radioVal);
			console.log("memberOfTelephone:" + memberOfTelephone);
			console.log("messageForDriver:" + messageForDriver);			
			console.log("postcode:" + postcode);
			console.log("roadAddress:" + roadAddress);
			console.log("extraAddress:" + extraAddress);
			console.log("detailAddress:" + detailAddress);
			console.log("p_no:" + p_no);
			console.log("m_id:" + m_id);

			var urlSendProductInfo = "/buyComputerProduct/sendProductInfoBought";
			var sendDataSendProductInfo = {
					"radioVal"    			: radioVal,
					"memberOfTelephone"     : memberOfTelephone,
					"messageForDriver"      : messageForDriver,					
					"postcode"	    		: postcode,
					"roadAddress"   		: roadAddress,
					"extraAddress"  		: extraAddress,		
					"detailAddress" 		: detailAddress,
					"p_no"					: p_no,
					"m_id"					: m_id
			};
 			$.post(urlSendProductInfo,sendDataSendProductInfo, function(data) {
				if(data == "success"){
					alert("개인정보 폼에 구매내역이 저장되었습니다");
				}
 			});
		}else{
			alert("다른 상품도 둘러보세요.");
		}		
		}else{
			alert("배송메세지와 연락처를 기입하시오");
		}
		}else{
			alert("주소를 모두 찾아 기입하시오");
		}
		}else{
			alert("로그인 하시오");
		}
		
	});
	
	$("#changeMemberNameButton").click(function(){
		if($("#changeMemberName").is(":checked") == true){
			alert("주문자 변경 체크박스 체크됨");	
			
			if(m_id != ""){
				alert("접속됨");
				var buyerName = $("#buyerName").val();
				console.log("buyerName:" + buyerName);
				if(buyerName != ""){
					var m_pass_confirm = "";
					m_pass_confirm = prompt("비밀번호를 확인하겠습니다.","");
					console.log("m_pass_confirm:" + m_pass_confirm);							
								
					var url = "/buyComputerProduct/changeBuyerName";												
					
					if(m_pass_confirm == m_pass){
						alert("비밀번호 일치");
						var sendData ={
								"buyerName" : buyerName,
								"m_id" : m_id,
								"m_pass" : m_pass
							};
						$.post(url,sendData, function(data) {
							if(data == "success"){
								alert("성공");
							}else{
								alert("실패");
							}
						});
						
					}else{
						alert("비밀번호 불일치");
					}
				}else{
					alert("주문자 변경정보를 기입하시오");
				}
				
			}else{
				alert("미접속됨");
			}			
		}else{
			alert("미체크");
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
	<div class="col-md-2"></div>
</div>


<div class="row">
		<div class="col-md-12">
			<a id="modalAddrByComputer" href="#modalAddr-container-computer" role="button"
				class="btn" data-toggle="modal" style="display:none">주소 찾기</a>
<!-- "modal-dialog modal-fullsize modal-center" -->
			<div class="modal fade" id="modalAddr-container-computer" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl" role="document">
					<div class="modal-content">
					
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabelComputer">배송지 주소 찾기</h5>
							<button type="button" id="btnModalCloseComputer" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						
						<div class="modal-body"> 
							<div id="searchAddrComputer">
								<input type="text" id="computer_postcode" placeholder="우편번호">
								<input type="button" onclick="computer_execDaumPostcode()" value="우편번호 찾기"><br>
							</div>
							<div id="mainAddr">
								<div id="roadAndextraAddr">
									<input type="text" id="computer_roadAddress" placeholder="도로명주소">
									<input type="text" id="computer_extraAddress" placeholder="참고항목"><br>
									<span id="guide" style="color:#999;display:none"></span>
								</div>
									<input type="text" id="computer_detailAddress" placeholder="상세주소">
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="selectAddrComputer">서버에 저장해둠</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
<div class="DetailDiv">
<nav class="DetailNav">
nav
</nav>
<section class="DetailSection">
<h1>주문서</h1>
<hr>
<br>
<br>
<h4>주문상품내용</h4>
<hr>
<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							주문상품명
						</th>
						<th>
							상품수량
						</th>
						<th>
							판매자명
						</th>
						<th>
							배송방식
						</th>
						<th>
							가격
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							${buyComputerInfo.productName}
						</td>
						<td>
							${buyComputerInfo.productNum}<span>개</span>
						</td>
						<td>
							${buyComputerInfo.seller}<span>님</span>
						</td>
						<td>
							${buyComputerInfo.sendMethod}
						</td>
						<td>
							${buyComputerInfo.price}<span>원</span>
						</td>
					</tr>					
				</tbody>
			</table>
		</div>
	</div>	
	<br>
	<br>
	<h4>주문자 정보 수정</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							주문자 확인
						</th>
						<th>
							
						</th>
						<th>
							
						</th>
																		
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<label>주문자명:</label>
							<input placeholder="주문자 기입" name="buyerName" id="buyerName"/>							
						</td>
						<td>
						<div class="checkbox">
							<label> <input type="checkbox" id="changeMemberName"/>
						입력한 주문자명으로 회원정보 변경하기</label>
						</div>
						</td>
						<td>
						<button type="button" id="changeMemberNameButton">변경</button>
						</td>												
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<h4>배송지 정보 입력</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>																		
						<th>
							주소
						</th>												
						<th>
							연락처
						</th>
						<th>
							배송 메세지
						</th>												
						<th>
							
						</th>												
					</tr>
				</thead>
				<tbody>
					<tr>						
						<td>
						<label>주소넣기:</label>
						<button type="button" id="searchJuso">검색</button><br>							
						</td>
						<td>
						<label>연락처:</label>
						<input type="tel" placeholder="연락처를 입력하시오" id="memberOfTelephone"/>
						</td>
						<td>
						<label>배송메세지:</label>
						<input placeholder="택배 기사님께 부탁할 사항을 입력하시오" type="text" id="messageForDriver"/>(<span></span>/50자)
						</td>
						<td>						
						<button type="button" id="pushMessageAndTel">기입</button><br>							
						</td>												
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<h4>결제정보</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							결제정보입력
						</th>
						<th>
							결제하기
						</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<form>
							<input type="radio" name="Payment" value="cardPayment" checked="checked">신용/체크카드
							&nbsp&nbsp<input type="radio" name="Payment" value="bankPayment">무통장입금
							&nbsp&nbsp<input type="radio" name="Payment" value="phonePayment">휴대폰결제
						</form>
						</td>
						<td>
							<button type="button" id="buyProduct">결제하기</button>
						</td>						
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
</section>
<aside class="DetailAside">
aside
</aside>
</div>