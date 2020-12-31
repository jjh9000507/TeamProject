<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
<div class="container-fluid">
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
			<%@ include file="../include/header_mainCatagories.jsp"%>
	
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
	
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
			<div class="lblHOT">
			 	
			</div>
		</div>
		
		<div class="col-md-2"></div>

		</div><!-- col-md-8 -->
	<div class="col-md-2">
	
		<a href="/auction/auctionResisterList" style="cursor:pointer"><img src="/resources/auctionImage/btn_sell.png"></a>
	
	</div>
</div> <!-- row -->
</div><!-- container-fluid -->
<hr><br><br>
<%@ include file="../include/footer.jsp" %>

