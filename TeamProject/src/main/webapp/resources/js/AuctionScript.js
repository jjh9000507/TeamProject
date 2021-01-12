/**
 * 
 */

function makeTwoDigit(num){
	var len = num.toString().length;
	console.log("makeTwoDigit len:"+len);
	if(len < 2){
		num = "0"+num;
	}
	return num;
}