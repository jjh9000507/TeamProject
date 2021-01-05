<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/buyComputerProduct_css.css" %>
<%@ include file="../include/header.jsp"%>
<div class="row">
		<div class="col-md-2"></div>
<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>
	</div>
	<div class="col-md-2"></div>
</div>	
<br>
<br>
<div class="row">
<div class="col-md-12">
<div class="buycomputersFormDiv">
<nav class="buyleftupnav">
</nav>
<header class="buyheader">
<div class="row">
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="#">Home</a>
					</li>
					<li class="breadcrumb-item">
						<a href="#">Library</a>
					</li>
					<li class="breadcrumb-item active">
						Data
					</li>
				</ol>
			</nav>
		</div>
	</div>
</header>
<aside class="buyrightupaside">
</aside>
<nav class="buyleftnav">
</nav>
<nav class="buynav">
<c:choose>
<c:when test="${buyComputerVo.c_com_pic == null}">
<img src="/resources/computerImage/default.png"/>
</c:when>
<c:otherwise>
<img src="/resources/image/main_logo2.png"/>
</c:otherwise>
</c:choose>
</nav>
<aside class="buyaside">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							${buyComputerVo.c_com_name}
						</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<span>${buyComputerVo.c_com_price}</span>원
						</td>						
					</tr>
					<tr>
						<td>
							전체판매상품 중 선호도:
							<div class="progress">
								<div class="progress-bar w-75">
								</div>
							</div>
						</td>						
					</tr>					
					<tr>
						<td>
							상품수량선택:&nbsp<input type="number" min="0" max="100" step="1"/>
							<button>결정</button>
						</td>						
					</tr>
					<tr>
						<td>
							총 상품금액:
						</td>						
					</tr>
					<tr>
						<td>
							<div class="dropdown">				 
				<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
					배송방법을 선택하시오
				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					 <a class="dropdown-item disabled" href="#">택배-무료배송</a> 
					 <a class="dropdown-item" href="#">직접방문수령</a> 
					 <a class="dropdown-item" href="#">퀵서비스</a>
				</div>
			</div>
						</td>						
					</tr>
					<tr>
						<td>
							<button>장바구니</button>
							<button>구매하기</button>
						</td>						
					</tr>
				</tbody>
			</table>
		</div>
	</div>			
</aside>
<aside class="buyrightaside">
</aside>
<nav class="buyleftdownnav">
</nav>
<footer class="buyfooter">
<ul class="nav nav-tabs breadcrumb">
<li class="nav-item">상세설명</li>&nbsp&nbsp&nbsp
<li class="nav-item">구매후기<span>(n)</span></li>&nbsp&nbsp&nbsp
<li class="nav-item">상품문의<span>(n)</span></li>
</ul>
</footer>
<aside class="buyrightdownaside">
</aside>
</div>
</div>
</div>