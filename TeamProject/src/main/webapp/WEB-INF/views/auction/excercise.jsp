<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/header.jsp"%>

<script>

var arry=[];

$(function(){
	
	var count=0;
	$(".countDiv").each(function(index){
		arry[index] = setInterval(function(){
			var indexCatch = index;
			
			console.log("index:"+index);
			count++;
			if(count == '5'){
				//$("#finish").trigger("click");
				stopIndex(indexCatch);
			}
		},1000);
	});
	
	$("#finish").click(function(){
		
		for(var i=0 ; i<arry.length ; i++){
			clearInterval(arry[i]);
		}
	});
});

function stopIndex(indexCatch){
	clearInterval(arry[indexCatch]);
}

</script>

<div class="countDiv">
1
</div>
<div class="countDiv">
2
</div>
<div class="countDiv">
3
</div>
<button type="button" id="finish">종료</button>
<button type="button" id="btn">연습</button>