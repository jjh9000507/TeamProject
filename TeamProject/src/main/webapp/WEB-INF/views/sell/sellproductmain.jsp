<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<style>
div{
	text-align: right;
}
h1{
	margin:0 auto;
}
#btn-tab ul {
  overflow: hidden;
}
#btn-tab li {
  float: left; width: 150px; text-align: left;
}

</style>
<script>
$(function(){
	var msg = "${msg}";
	if(msg == "sellerReg"){
		alert("판매자 등록이 완료되었습니다.");
	} else if(msg == "Count3") {
		alert("3회 이상 정지를 당하셨기때문에 판매자등록이 불가능합니다.");
	}
})
</script>
<div class="row">
<div class="col-md-4"></div>
<div calss="col-md-4" id="btn-tab">
<c:choose>
	<c:when test="${sessionScope.memberVo.m_selling == 0}">
		<h1>판매자 등록이 필요합니다.</h1>
		<ul>
			<li><a href="/sellproduct/registration">판매자 등록</a></li>
			<li><a href="/">돌아가기</a></li>
		</ul>
		
		
	</c:when>
	
	<c:otherwise>
		<h1>판매자 등록된 회원입니다.</h1>
		<ul>
			<li><a href="/sellproduct/sellproduct">판매하기</a></li>
			<li><a href="/">돌아가기</a></li>
		</ul>
	</c:otherwise>
</c:choose>
</div>
<div class="col-md-4"></div>
</div>