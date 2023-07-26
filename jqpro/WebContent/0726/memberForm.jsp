<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--html / java x  -->
<script type="text/javascript">
var xhr= new XMLHttpRequest();
function proc1(){
	
	//요청
	xhr.open('get','memberList.jsp',true);
	xhr.send();
	
	//응답
	xhr.onreadystatechange=function(){
		
		if(this.readyState==4 && this.status==200){
			res=this.responseText; //this->memberList.jsp
			
			jpres= JSON.parse(res);
			
			code="<table border='1'>"
				code+="<tr><th>아이디</th>"
				code+="<th>이름</th><th>이메일</th><th>전화번호</th><th>비밀번호</th></tr>"
			
			for(let i=0; i<jpres.length; i++){
			
			code+="<tr><td>"+jpres[i].id+"</td>"
			code+="<td>"+jpres[i].name+"</td><td>"+jpres[i].mail+"</td><td>"
					+jpres[i].hp+"</td><td>"+jpres[i].pass+"</td></tr>"
				
			} 
			code+="</table>";
			
			document.getElementById('result1').innerHTML=code;
		}		
	}
}


</script>
</head>
<body>


<input type="button" value="memberLIST" onclick="proc1()">
 
<br><br>

<div id="result1"></div>
</body>
</html>