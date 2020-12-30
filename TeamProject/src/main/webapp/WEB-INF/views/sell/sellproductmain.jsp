<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
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
<c:choose>
	<c:when test="${sessionScope.memberVo.m_selling == 0}">
		<h1>판매자 등록이 필요합니다.</h1>
		<a href="/sellproduct/registration">판매자 등록</a>
		<a href="/">돌아가기</a>
	</c:when>
	
	<c:otherwise>
		<h1>판매자 등록된 회원입니다.</h1>
		<a href="/sellproduct/sellproduct">판매하기</a>
	</c:otherwise>
</c:choose>

<%@ include file="../include/footer.jsp"%>