<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css"> -->

<link type="text/css" rel="stylesheet" href="/resources/css/auctionBootstrap.css">

<%@ include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<%@ include file="auctionHeader.jsp"%>
				<div><div style="float:left"><img src="/resources/auctionImage/receive_order_blue.png" style="height:40px;width:40px"></div><h1>배송할 상품</h1></div>
			<!-- ------------------------------------------------------------------------------- -->
			<div class="containerMy">
				<div class="row">
					<div class="span12">
						<ul class="thumbnails">
						<c:forEach var="deliveryVo" items="${deliveryList}">
							<li class="span9 clearfix">
								<div class="thumbnail clearfix">
									<img src="/furniture/displayImage?imageName=${deliveryVo.main_img_name}" alt="ALT NAME"
										class="pull-left span2 clearfix" style='margin-right: 10px;height:110px;width:100px;margin-left: 7px;'>
									<div class="caption" class="pull-left">
										<a href="http://bootsnipp.com/"
											class="btn btn-primary icon  pull-right">배송 완료</a>
										<h4>
											<a href="#">${deliveryVo.p_title}</a>
										</h4>
										<small><b>주문자:</b>${deliveryVo.orderer_name}</small> <small><b>연락처:</b>${deliveryVo.phonenumber}</small><br>
										<small><b>주소:</b>${deliveryVo.road_address}</small> <small><b>연락처:</b>${deliveryVo.detail_address}</small><br>
										<small><b>남길말:</b>${deliveryVo.order_msg}</small>
										<hr>
										<small><b>승인번호:</b>${deliveryVo.card_approval_number}
										<select name="delivery_company" id="delivery_company" style="width: 116px;padding-bottom: 0px;height: 24px;padding-top: 0px;padding-left: 0px;padding-right: 0px;border-right-width: 1px;margin-left: 120px;">
										<option value="cj대한통운">cj대한통운</option>
										<option value="한진택배">한진택배</option>
										<option value="현대택배">현대택배</option>
										<option value="로젠택배">로젠택배</option>
										<option value="KG로지스">KG로지스</option>
										</select>
										<input type="text" placeholder="송장 번호를 입력하세요" style="padding-left: 0px;margin-left: 20px;margin-top: 9px;"></small>
									</div>
								</div>
							</li>
						</c:forEach>	
						</ul>
					</div>
				</div>
			</div>
			<!-- ------------------------------------------------------------------------------- -->	
			</div><!-- 내부 md-8 -->
			<div class="col-md-2"></div><!-- 내부 md-2 -->
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>




