<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">

${payList}
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<%@ include file="auctionHeader.jsp"%>
			<div><div style="float:left"><img src="/resources/auctionImage/btnPurchaser.png"  style="height:40px;width:40px"></div><h1>결제한 상품</h1></div>
<!-- ----------------------------------------------------  -->				
			<div class="container">
				<div class="row">
					<div class="span12">
						<ul class="thumbnails">
						<c:forEach var="payListVo" items="${payList}">
							<li class="span5 clearfix">
								<div class="thumbnail clearfix">
								<div>
									<img src="/furniture/displayImage?imageName=${payListVo.main_img_name}" alt="ALT NAME"
										class="pull-left span2 clearfix" style='margin-right: 10px;height:110px;width:100px;margin-left: 7px;'>
								</div>
									<div class="caption" class="pull-left">
										<a href="http://bootsnipp.com/" class="btn btn-primary icon  pull-right">구매확정</a>
										<h4>
											<a href="#">${payListVo.p_title}</a>
										</h4>
										<h6>판매자: ${payListVo.seller}</h6>
										<ul>
										<li><small><b>결제일: </b>${payListVo.order_date}</small> <small><b>승인번호: </b>${payListVo.card_approval_number}</small><br></li>
										<li><small><b>택배사: </b>${payListVo.delivery_company}</small> <small><b>소장번호: </b>${payListVo.delivery_number}</small></li>
										</ul>
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