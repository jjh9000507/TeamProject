<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<script>
$(function(){
	var countDown=[];
	
	$(document).ready(function() { 
		$(".divCountDown").each(function(index){
			//마감 날짜와 시간을 가져온다
			var e_year = $(this).next().val();
			var e_month = $(this).next().next().val();
			var e_day = $(this).next().next().next().val();
			var e_hour = $(this).next().next().next().next().val();
			var e_minute = $(this).next().next().next().next().next().val();
			var e_second = parseInt((Math.random() * 59)+1);
			//console.log("e_year:"+e_year+" ,e_month:"+e_month+" ,e_day:"+e_day+" ,e_hour:"+e_hour+" e_minute:"+e_minute);
			//console.log("second:"+second);
			
			//현재 날짜를 얻어온다
			var today = new Date();
			var nowYear = today.getFullYear(); // 년도 	
			var nowMonth = today.getMonth() + 1;  // 월
			var nowDate = today.getDate();  // 날짜
			//var nowDay = today.getDay();  // 요일
			var nowHour = today.getHours(); // 시
			var nowMinute = today.getMinutes();  // 분
			var nowSecond = today.getSeconds();  // 초
			
			
			var resultYear, resultMonth, resultDdate, resultHhour, resultMinute, resultSecond;
			
			//마감 날짜와 현재 날짜를 계산한다
			resultYear = e_year - nowYear;
			resultMonth = e_month - nowMonth;
			resultDate = e_day - nowDate;
			resultHour = e_hour - nowHour;
			resultMinute = e_minute - nowMinute;
			resultSecond = e_second - nowSecond;

			console.log("resultYear:"+resultYear+" ,resultMonth:"+resultMonth+" ,resultDate:"+resultDate+" ,resultHour:"+resultHour+" ,resultMinute:"+resultMinute+" resultSecond:"+resultSecond);
			
			var addMonth = 12;
			var addDate = new Date(nowYear, nowMonth-1, 0).getDate();
			var addHour = 24;
			var addMinute = 60;
			var addSecond = 60;
			
			//-----------초 시작---------------------------------------------------------------------------------------//
			if(resultSecond<0){//잡을 땐 < 일 때마다
				if(resultMinute<=0){//값을 가져올 땐 <= 일 때마다
					if(resultHour<=0){
						if(resultDate<=0){
							if(resultMonth<=0){
								if(resultYear<=0){
									resultYear = 0;
									resultMonth = 0;
									resultDate = 0;
									resultHour = 0;
									resultMinute = 0;
									resultSecond = 0;
								}else{//resultYear >= 0
									resultYear--;
									resultMonth += addMonth;
									resultDate += addDate;
									resultHour += addHour;
									resultMinute += addMinute;
									resultSecond += addSecond;
								}
							}else{//resultMonth >= 0
								resultMonth--;
								resultDate += addDate;
								resultHour += addHour;
								resultMinute += addMinute;
								resultSecond += addSecond;
							}
						}else{//resultDate >= 0
							resultDate--;
							resultHour += addHour;
							console.log("resultHour:"+resultHour);
							resultMinute += addMinute;
							resultSecond += addSecond;
						}
					}else{//resultHour >= 0
						resultHour--;
						resultMinute += addMinute;
						resultSecond += addSecond;
					}
				}else{
					resultMinute--;
					resultSecond += addSecond;
				}
			}
			//-----------초 끝---------------------------------------------------------------------------------------//
			//-----------분 시작---------------------------------------------------------------------------------------//
			if(resultMinute<0){
				if(resultHour<=0){
					if(resultDate<=0){
						if(resultMonth<=0){
							if(resultYear<=0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}else{//resultYear >= 0
								resultYear--;
								resultMonth += addMonth;
								resultDate += addDate;
								resultHour += addHour;
								resultMinute += addMinute;
								//resultSecond += 60;
							}
						}else{//resultMonth >= 0
							resultMonth--;
							resultDate += addDate;
							resultHour += addHour;
							resultMinute += addMinute;
							//resultSecond += 60;
						}
					}else{//resultDate >= 0
						resultDate--;
						resultHour += addHour;
						console.log("resultHour:"+resultHour);
						resultMinute += addMinute;
						//resultSecond += 60;
					}
				}else{//resultHour >= 0
					resultHour--;
					resultMinute += addMinute;
					//resultSecond += 60;
				}
			}
			//-----------분 끝---------------------------------------------------------------------------------------//
			//-----------시간 시작---------------------------------------------------------------------------------------//
				if(resultHour<0){
					if(resultDate<=0){
						if(resultMonth<=0){
							if(resultYear<=0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}else{//resultYear >= 0
								resultYear--;
								resultMonth += addMonth;
								resultDate += addDate;
								resultHour += addHour;
								//resultMinute += 59;
								//resultSecond += 60;
							}
						}else{//resultMonth >= 0
							resultMonth--;
							resultDate += addDate;
							resultHour += addHour;
							//resultMinute += 59;
							//resultSecond += 60;
						}
					}else{//resultDate >= 0
						resultDate--;
						resultHour += addHour;
						console.log("resultHour:"+resultHour);
						//resultMinute += 59;
						//resultSecond += 60;
					}
				}
			//-----------시간 끝---------------------------------------------------------------------------------------//
			//-----------일 시작---------------------------------------------------------------------------------------//
					if(resultDate<0){
						if(resultMonth<=0){
							if(resultYear<=0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}else{//resultYear >= 0
								resultYear--;
								resultMonth += addMonth;
								resultDate += addDate;
								//resultHour += 59;
								//resultMinute += 59;
								//resultSecond += 60;
							}
						}else{//resultMonth >= 0
							resultMonth--;
							resultDate += addDate;
							//resultHour += 59;
							//resultMinute += 59;
							//resultSecond += 60;
						}
					}
			//-----------일 끝---------------------------------------------------------------------------------------//
			//-----------월 시작---------------------------------------------------------------------------------------//
						if(resultMonth<0){
							if(resultYear<=0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}else{//resultYear >= 0
								resultYear--;
								resultMonth += addMonth;
								//resultDate += lastDate;
								//resultHour += 59;
								//resultMinute += 59;
								//resultSecond += 60;
							}
						}
			//-----------월 끝---------------------------------------------------------------------------------------//
			//-----------년 끝---------------------------------------------------------------------------------------//
							if(resultYear<0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}
			//-----------년 끝---------------------------------------------------------------------------------------//
			
			//마감 날짜와 현재 시간을 뺀 값을 this값에 넣는다 
			$(this).text(resultHour+":"+resultMinute+":"+resultSecond);
			
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
				console.log("index:"+index+"hour:"+hour+" ,minute:"+minute+" ,second:"+second);
				
				var twoDigitHour = makeTwoDigit(hour);
				var twoDigitMinute = makeTwoDigit(minute);
				var twoDigitSecond = makeTwoDigit(second);
				console.log("twoDigitSecond:"+twoDigitSecond);
				
				that.text(twoDigitHour+":"+twoDigitMinute+":"+twoDigitSecond);
			},1000);
		});	
		
	});//document.ready
	
	$("#stopTimer").click(function(){
		var len = $(".divCountDown").length;
		console.log("len:"+len);
		for(var i=0 ; i<len ; i++){
			clearInterval(countDown[i]);			
		}
	});//stopTimer
	
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

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<button type="button" id="stopTimer">타이머종료</button>	
		<div class="col-md-8">
			<%@ include file="../include/header_mainCatagories.jsp"%>
			<table class="table">
				<tbody>
					<!-- 이미지랑 세부내용 tr 시작 -->
					<tr>
						<td>
							<!-- 이미지랑 세부내용 안에 새로운 테이블 시작 -->
								<div class="col-md-12">
									<table class="table">
										<tbody>
											<tr>
												<td rowspan=5><img src="/furniture/displayImage?imageName=${selectedItem.main_img_name}" class="img-class" style="height: 300px; width: 300px;"></td>
												<td colspan=2>${selectedItem.p_content}</td>
											</tr>
											<tr class="table-active">
												<td>현재가:${selectedItem.present_price}</td>
												<td>즉구가:${selectedItem.instant_price}</td>
											</tr>
											<tr class="table-success">
												<td>입찰수</td>
												<td>입찰가격:</td>
											</tr>
											<tr class="table-warning">
												<td>남은시간</td>
												<td>
													<div class="divCountDown" style="color:red"></div>
														<input type="hidden" class="countDown_year" value="${selectedItem.e_year}">
														<input type="hidden" class="countDown_month" value="${selectedItem.e_month}">
														<input type="hidden" class="countDown_day" value="${selectedItem.e_day}">
														<input type="hidden" class="countDown_hour" value="${selectedItem.e_hour}">
														<input type="hidden" class="countDown_minute" value="${selectedItem.e_minute}">
												</td>
											</tr>
											<tr class="table-danger">
												<td>종료일</td>
												<td>${selectedItem.e_day}일 ${selectedItem.e_hour}:${selectedItem.e_minute}</td>
											</tr>
										</tbody>
									</table>
								</div>
							<!-- 이미지랑 세부내용 안에 새로운 테이블 끝 -->
						</td>
					</tr>
					<!-- 이미지랑 세부내용 tr 끝 -->

					<!-- 버튼 tr 시작 -->
					<tr class="table-active">
						<td>
							<div class="col-md-12">
								<button type="button" class="btn btn-outline-secondary">
									입찰하기</button>
								<button type="button" class="btn btn-outline-info">
									관심상품</button>
							</div>
						</td>
					</tr>
					<!-- 버튼 tr 끝 -->

					<!-- 세부 이미지랑 설명 tr 시작 -->
					<tr class="table-success">
						<td>
							<c:forEach var="image" items="${selectedImg}">
								<div>
								<img src="/furniture/displayImage?imageName=${image.img_name}" class="img-class" style="height: 200px; width: 200px;">
								</div>
								<br>
							</c:forEach>
						</td>
					</tr>
					<!-- 세부 이미지랑 설명 tr 끝 -->
				</tbody>
			</table>
		</div>
		<!-- 외부 md 8 -->
		<div class="col-md-2"></div>
		<!-- 외부 md2 -->
	</div>
	<!-- 외부 row -->
</div>
<!-- 외부 container -->


<%-- <%@ include file="../include/footer.jsp"%> --%>
