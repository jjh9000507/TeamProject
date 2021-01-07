<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<script>
$(function(){
	var countDown=[];
	
	$(document).ready(function() { 
		$(".divCountDown").each(function(index){
			
			//상품 유저와 로그인 유저가 같으면 입찰과 장바구니 버튼을 감춘다
			var urlUserCheck = "/auction/userCheck";
			var seller = $("#seller").val();
			var data = {
					"seller" : seller
			}
			
			$.get(urlUserCheck, data, function(e){
				console.log("e:"+e);
				if(e == "same"){
					$(".divBidAndFavorite").hide();
				}
			});
			
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
	
	
	/*입찰하기 버튼을 눌렀을 때
	1. 로그인이 안 되어있다
	1-1. 제품 유저인 경우 - divBidAndFavorite 안보이 게 한다
	1-2. 제품 유저가 아닌 경우 - 입찰하기와 좋아하기 가능
	2. 로그인이 되어있다
	2-1. 제품 유저인 경우 - divBidAndFavorite 안보이 게 한다
	2-2. 제품 유저가 아닌 경우 - 입찰하기와 좋아하기 가능
	*/
	
	$("#btnBid").click(function(){//입찰 버튼을 눌렀을 때
		var urlLoginCheck = "/auction/logInCheck";
		
		$.get(urlLoginCheck, function(data){
			console.log(data);
			if(data == "LogOut"){//로그인 되어있지 않으면
				console.log("logout");
				$("#modaLoginAuction").trigger("click");//로그인 페이지로 모달 창
			}else{
				console.log("login");
				
				//상품 유저와 로그인 유저가 같으면 입찰과 장바구니 버튼을 감춘다
				var urlUserCheck = "/auction/userCheck";
				var seller = $("#seller").val();
				var data = {
						"seller" : seller
				}
				
				$.get(urlUserCheck, data, function(e){//로그인 상태면 로그인 유저와 상품 유저를 비교
					console.log("e:"+e);
					if(e == "same"){
						$(".divBidAndFavorite").hide();//같으면 입찰 버튼 감추기
					}else{//다르면 입찰 하기 시작
						
						alert("입찰하기 시작");
					}
				});
			}
		});
	});//btnBid
		
	$("#btnLogin").click(function(){//모달에서 로그인 버튼
		var m_id = $("#txtId").val();
		var m_pass = $("#txtPw").val();
		
		//alert("id:"+m_id+" ,pw:"+m_pass);
		var url = "/auction/logIn";
		var data = {
				"m_id" : m_id,
				"m_pass" : m_pass
		};
		
		$.get(url, data, function(e){
			console.log(e);
			if(e == "loginFali"){
				alert("로그인 실패");
			}else{
				//헤더부분 로그아웃 변경하기	
				alert("로그인 성공");
				$("#btnClose").trigger("click");
				
				//상품 유저와 로그인 유저가 같으면 입찰과 장바구니 버튼을 감춘다
				var urlUserCheck = "/auction/userCheck";
				var seller = $("#seller").val();
				var data = {
						"seller" : seller
				}
				
				$.get(urlUserCheck, data, function(e){
					console.log("e:"+e);
					if(e == "same"){
						$(".divBidAndFavorite").hide();
					}
				});
			}
		});
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

${sessionScope.memberVo}
<input type="hidden" id="seller" value="${selectedItem.seller}">

<!-- 로그인 모달 창 시작-->
<div class="col-md-12">
	<a id="modaLoginAuction" href="#modal-container-525134" role="button"
		class="btn" data-toggle="modal">로그인</a>

	<div class="modal fade" id="modal-container-525134" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div>아 이 디   <input type="text" id="txtId" style="border-style:groove;"></div>
					<br>
					<div>비밀번호  <input type="text" id="txtPw" style="border-style:groove;"></div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnLogin">로그인
					</button>
					<button type="button" id="btnClose" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 로그인 모달 창 끝 -->

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
												<td colspan=2>${selectedItem.p_title}</td>
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
							<div class="col-md-12 divBidAndFavorite">
								<button type="button" id="btnBid" class="btn btn-outline-secondary">
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
							${selectedItem.p_content}
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
