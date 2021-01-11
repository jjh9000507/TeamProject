<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>
<!-- 이거 사이드바로 빼고 css넣고 해야할 듯? -->
<%@ include file="/resources/css/service_center.css" %>

<a href="/service/Q&A">Q&A</a>
<%-- <a href="/service/inquiry?m_id=${memberVo.m_id}" id="btnInquiry">1:1 문의</a> --%>

<!-- <div> -->
<!-- 	<a href="/service/notice">공지사항</a> -->
<!-- </div> -->

<div>
	<div>
		<h3 class="sub-title">1:1문의</h3>
		<p class="more"><span class="more-link"><a href="/service/inquiry?m_id=${memberVo.m_id}">문의하기</a></span></p>
	</div>
</div>

<div class="note-event" id="note-event">
	<div class="note-area">
		<div class="title-more">
			<h3 class="sub-title">공지사항</h3>
				<p class="more"><span class="more-link"><a href="/service/notice">더보기</a></span></p>
		</div>
		<ul class="note-event-list">
			<c:forEach begin="0" end="4" items="${noticeList}" var="NoticeVo" varStatus="status">
				<li>
					<a href="/service/noticeDetail/${NoticeVo.notice_no}"><strong>${NoticeVo.notice_title}</strong> </a><span class="date">${NoticeVo.notice_reg}</span>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>