<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 이거 사이드바로 빼고 css넣고 해야할 듯? -->
<a href="/service/Q&A">Q&A</a>
<a href="/service/inquiry?m_id=${memberVo.m_id}" id="btnInquiry">1:1 문의</a>

<div>
	<a href="/service/notice">공지사항</a>
</div>