<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file="/resources/css/header_css.css" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<h5 class="card-header">
					${detailComputerVo.c_com_name}
				</h5>
				<div class="card-body">
					<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							판매자
						</th>
						<th>
							가격
						</th>
						<th>
							상품설명
						</th>
						<th>
							사진
						</th>
						<th>
							올린 날짜
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							${detailComputerVo.c_com_seller}
						</td>
						<td>
							<span id="price">${detailComputerVo.c_com_price}</span>원							
						</td>
						<td>
							${detailComputerVo.c_com_content}
						</td>
						<td>
							${detailComputerVo.c_com_pic}
						</td>
						<td>
							${detailComputerVo.c_com_regdate}
						</td>
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
				</div>
				<div class="card-footer">
					상품정보사항
				</div>
			</div>
		</div>
	</div>
</div>
