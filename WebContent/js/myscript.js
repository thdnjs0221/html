/**
 * 
 */

function proc(){
	
	let sum = 0;
	var a = 10;
	
	
	for(var i=0; i<5; i++){  //for문 안 let 블럭 안에서만 사용
		sum+=10;	
	}
	
	let vres = document.getElementById('result');
	vres.innerText = i + " " + sum;
	//i가 5일때  비교하고 빠져나옴 
	//let 블럭영역에서 주로 사용함 
}


function calc() {
	//입력한 값 가져오기
	var vqty = document.getElementById('qty').value;
	var vprice = document.getElementById('price').value;
	
	var res= vqty * vprice;
	
/*	var str = "수량: "+vqty + "<br>";
	str += "가격: "+vprice + "<br>";
	str += "총금액: "+res+ "<br>";*/
	
	var str=`수량 : ${vqty} <br>`;
	str += `가격: ${vprice} <br>`;
	str += `총금액: ${res}<br>`;
	
	
	//document.write(str); 
	console.log(str);
	
	
	var vresult = document.getElementById('result');
	
	//innerText html태그도 문자로 출력함.
	vresult.innerHTML = str;
	
	
} 
