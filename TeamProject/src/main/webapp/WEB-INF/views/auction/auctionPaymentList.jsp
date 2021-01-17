<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/css/auctionPurchaseSelected_css.css" %>
<%@ include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<%@ include file="auctionSideBar.jsp"%>
		</div>
		<div class="col-md-8">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
			<%@ include file="../include/header_mainCatagories.jsp"%>
				
			</div><!-- 내부 md-8 -->
			<div class="col-md-2"></div><!-- 내부 md-2 -->
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>