<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(function(){
	/*
	실제 거래가 이루어지려면 이니시스 관리자 홈페이지에 접속해서 가맹점 등록 후 가맹점 ID를 아이앰포트에 넣어줘야 한다
	중고거래 가입자 만다 가맹점 ID를 가지고 있어야 한다
	*/
	var IMP = window.IMP; // 생략가능
	IMP.init('${ImPortkey}');
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : '${price}',
	    buyer_email : 'natista99@gmail.com',
	    buyer_name : 'user02',
	    buyer_tel : '010-8711-6666',
	    buyer_addr : '울산 남구 옥동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
		var msg="";
		
	    if ( rsp.success ) {
	        msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '유저 ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	       	//alert(msg);
	       	
	       	$("#txtId").text(rsp.imp_uid);
	       	$("#txtUserId").text(rsp.merchant_uid);
	       	$("#txtPrice").text(rsp.paid_amount);
	       	$("#txtCardNum").text(rsp.apply_num);
	    } else {
	        msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    //alert("msg:"+msg);
	});
	
	$("#btnPayListCheck").click(function(){
		
	})
});
</script>
<h1>결제가 완료 되었습니다</h1>
<table>
	<tr>
		<td>고유ID</td>
		<td>유저ID</td>
		<td>결제 금액</td>
		<td>카드 승인번호</td>
	</tr>
	<tr>
		<td id="txtId">고유ID</td>
		<td id="txtUserId">유저ID</td>
		<td id="txtPrice">결제 금액</td>
		<td id="txtCardNum">카드 승인번호</td>
	</tr>
</table>

<button type="button" id="btnPayListCheck">창닫기</button>

</body>
</html>