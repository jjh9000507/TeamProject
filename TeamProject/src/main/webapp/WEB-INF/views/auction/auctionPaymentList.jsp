<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link type="text/css" rel="stylesheet" href="/resources/css/auctionBootstrap.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <fmt:formatDate value="${messageVo.msg_senddate}" pattern="yyyy/MM/dd HH:mm:ss"/> --%>
<%@ include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<%@ include file="auctionHeader.jsp"%>
			<div><div style="float:left"><img src="/resources/auctionImage/btnPurchaser.png"  style="height:40px;width:40px"></div><h1>결제한 상품</h1></div>
<!-- ----------------------------------------------------  -->				
			<div class="containerMy">
				<div class="row">
					<div class="span12">
						<ul class="thumbnailsMy">
						<c:forEach var="payListVo" items="${payList}">
							<li class="span5 clearfix">
								<div class="thumbnail clearfix">
									<img src="/furniture/displayImage?imageName=${payListVo.main_img_name}" alt="ALT NAME"
										class="pull-left span2 clearfix" style='margin-right: 9px;width:120px;margin-left: 0px;padding-top: 10px;'>
									<div class="caption" class="pull-left" style="width: 464px;padding-right: 5px;padding-left: 4px;">
										<a href="http://bootsnipp.com/" class="btn btn-primary icon  pull-right">구매확정</a>
										<h4>
										<c:choose>
											<c:when test="${fn:length(payListVo.p_title) > 14}">
												<a href="#" style="font-size:20px">${fn:substring(payListVo.p_title,0,14)}...</a>
											</c:when>
											<c:otherwise>
												<a href="#" style="font-size:20px">${payListVo.p_title}</a>
											</c:otherwise>
										</c:choose>
										</h4>
										<h6>판매자: ${payListVo.seller}</h6>
										<small><b>결제일: </b><fmt:formatDate value="${payListVo.order_date}" pattern="yyyy/MM/dd"/></small> <small><b>승인번호: </b>${payListVo.card_approval_number}</small><br>
										<small><b>주소: </b>${payListVo.road_address} ${payListVo.detail_address}</small>	<small><b>우편번호: </b>${payListVo.zip}</small><br>					
										<div style="display:none"><small><b>택배사: </b>대한통운</small> <small><b>소장번호: </b><span style="color:red">34234234</span></small></div>
									</div>
									
								</div>
							</li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>	
				
<!-- ----------------------------------------------------- -->				
			</div><!-- 내부 md-8 -->
			<div class="col-md-2"></div><!-- 내부 md-2 -->
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>