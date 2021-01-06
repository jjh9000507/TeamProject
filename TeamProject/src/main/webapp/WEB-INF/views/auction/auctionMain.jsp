<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<style>
.img-class {
    width: auto; height: auto;
    max-width: 200px;
    max-height: 300px;
}
</style>

<script type="text/javascript">

$(function(){
	
	var countDown=[];
	
	$(document).ready(function() { 
		$(".divCountDown").each(function(index){
			//${auctionSellVo.e_month}/${auctionSellVo.e_day} ${auctionSellVo.e_hour}:${auctionSellVo.e_minute}</td>
			
			//마감 날짜와 시간을 가져온다
			var e_year = $(this).next().val();
			var e_month = $(this).next().next().val();
			var e_day = $(this).next().next().next().val();
			var e_hour = $(this).next().next().next().next().val();
			var e_minute = $(this).next().next().next().next().next().val();
			var e_second = parseInt((Math.random() * 59)+1);
			//console.log("e_year:"+e_year+" ,e_month:"+e_month+" ,e_day:"+e_day+" ,e_hour:"+e_hour+" e_minute:"+e_minute);
			//console.log("second:"+second);
			
			//마감 날짜와 현재 날짜를 계산한다
			var today = new Date();
			var nowYear = today.getFullYear(); // 년도 	
			var nowMonth = today.getMonth() + 1;  // 월
			var nowDate = today.getDate();  // 날짜
			var nowDay = today.getDay();  // 요일
			var nowHhours = today.getHours(); // 시
			var nowMinutes = today.getMinutes();  // 분
			var nowseconds = today.getSeconds();  // 초
			var seconds = today.getMilliseconds(); 
			console.log("nowYear:"+nowYear+" ,nowMonth:"+nowMonth+" ,nowDate:"+nowDate+" ,e_hour:"+e_hour+" e_minute:"+e_minute);
			
			//마감 날짜와 현재 시간을 뺀 값을 this값에 넣는다 
			$(this).text("월:일:시간:분:초")
			
			
			//입력된 텀 시간을 불러와서 카운드 다운한다
			var that = $(this);
			countDown[index] = setInterval(function(){
				var timeValue = that.text();
				//console.log("timeValue:"+timeValue);
				var timeArray = timeValue.split(":");
				//console.log(timeArray[0]+" ,"+ timeArray[1]);
				var hour = timeArray[0];
				var minute = timeArray[1];
				var second = timeArray[2];
				
				if(hour>0){
					if(minute>0){
						if(second==0){
							second=60;
							minute--;
						}else{
							second--;
						}
					}else if(minute<=0){
						hour--;
						minute=60;
					}
				}else if(hour<=0){
					if(minute>0){
						if(second==0){
							second=60;
							minute--;
						}else{
							second--;
						}	
					}else if(minute<=0){
						hour=0;
						minute=0;
					}
				}
				console.log("hour:"+hour+" ,minute:"+minute+" ,second:"+second);
				
				var twoDigitHour = makeTwoDigit(hour);
				var twoDigitMinute = makeTwoDigit(minute);
				var twoDigitSecond = makeTwoDigit(second);
				console.log("twoDigitSecond:"+twoDigitSecond);
				
				that.text(twoDigitHour+":"+twoDigitMinute+":"+twoDigitSecond);
				
				//console.log(twoDigitMinute);
			},1000);
		});	
		
	});//document.ready
	
	$("#stopTimer").click(function(){
		var len = $(".divCountDown").length;
		console.log("len:"+len);
		for(var i=0 ; i<len ; i++){
			clearInterval(countDown[i]);			
		}
		clearInterval(count2);
	});
	
	var count2;
	var aa=100;
	var objCount=[];
	$("#startTimer").click(function(){
		var divCount = $(".divCountDown").toArray();
		
		for(var i=0 ; i<divCount.length ; i++){
			objCount.push(divCount[i].innerHTML);
			//console.log("objCount[]:"+objCount[i].text());
		}
		
		console.log(objCount[0]);
	});
});//function

function makeTwoDigit(num){
	var len = num.length;
	console.log("makeTwoDigit len:"+len);
	if(len < 2){
		num = "0"+num;
	}
	return num;
}

</script>

<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
<div class="container-fluid">
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8">
		
			<%@ include file="../include/header_mainCatagories.jsp"%>
	
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
	
		<div class="col-md-2">
		<button type="button" id="startTimer">요소값을 배열로</button>
		<button type="button" id="stopTimer">타이머종료</button>	
		</div>

		<div class="col-md-8">
			<div class="lblHOT">
			 	<table border=1>
			 		<c:forEach var="auctionSellVo" items="${list}" varStatus="status">
			 		<c:if test="${(status.count-1) % 4 == 0}">
			 			<tr><!-- 4개 넘어서면 tr추가 -->
					</c:if>
					
			 			<td><!-- 4개까진 td 추가 -->

			 				<table border=1>
								<tr>
									<td><img src="/furniture/displayImage?imageName=${auctionSellVo.main_img_name}" class="img-class"></td>
								</tr>
								<tr>
									<td>${auctionSellVo.p_content}</td>
								</tr>			 				
								<tr>
									<td>${auctionSellVo.present_price}</td>
								</tr>
								<tr>
									<td style="font-size:15px">${auctionSellVo.seller} ${auctionSellVo.e_month}/${auctionSellVo.e_day} ${auctionSellVo.e_hour}:${auctionSellVo.e_minute}</td>
								</tr>
								<tr>
									<td>
										<div class="divCountDown" style="color:red"></div>
										<input type="hidden" class="countDown_year" value="${auctionSellVo.e_year}">
										<input type="hidden" class="countDown_month" value="${auctionSellVo.e_month}">
										<input type="hidden" class="countDown_day" value="${auctionSellVo.e_day}">
										<input type="hidden" class="countDown_hour" value="${auctionSellVo.e_hour}">
										<input type="hidden" class="countDown_minute" value="${auctionSellVo.e_minute}">
									</td>
								</tr>
			 				</table>
						
			 			</td><!-- 4개까진 td 추가 -->
					
					<c:if test="${status.count%4 == 0}">
			 			</tr><!-- 4개 넘어서면 tr추가 -->
			 		</c:if>
			 		</c:forEach>
			 	</table>
			</div>
		</div>
		
		<div class="col-md-2"></div>

		</div><!-- 첫번째 col-md-8 -->
	<div class="col-md-2">
		<a href="/auction/auctionResisterList" style="cursor:pointer"><img src="/resources/auctionImage/btn_sell.png"></a>
	</div>
</div> <!-- row -->
</div><!-- container-fluid -->
<hr>
<br><br>
<%-- <%@ include file="../include/footer.jsp" %> --%>

