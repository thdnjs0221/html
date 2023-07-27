<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.0.min.js"></script>
<script> 
$(function(){
	$('#lprod').on ('click',function(){
		
		$.ajax({ 
			url :  "/jqpro/0726/lprodJson.jsp",  //서블릿파일 경로  
			type : 'get',
			success : function(res){  //lprodJson.jsp에 대한 결과값 -> res(변수이름은 아무거나 작성)
				
				code="<table border='1'>";
				code+="<tr><th>LPROD_ID</th>"
				code+="<th>LPROD_GU</th>"
				code+="<th>LPROD_NM</th> </tr>"
				
				//제이쿼리 반복문
				$.each(res, function(i,v){
					code+="<tr><td>"+res[i].lprod_id+"</td>"
					code+="<td>"+res[i].lprod_gu+"</td>"
					code+="<td>"+res[i].lprod_nm+"</td> </tr>"
				})
				code+="</table>";
				
				$('#result1').html(code);
			},
			error : function(xhr){
				alert("상태"+xhr.status); //200->파싱오류
			},
			dataType : 'json' //pares=JSON.parse(res);파싱안해도 됨 대신해줌
			
			
			
			})//$.ajax
			
			
		
	})//click
})

</script> 
</head>
<body>
<input type="button" value="lprod" id="lprod"><br>
<br>
<div id="result1">

</div>
</body>
</html>