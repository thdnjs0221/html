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
	$('#member').on('click',function(){
		
		$.ajax({
			
			url : '/jqpro/MemberList.ddit',  //서블릿임./do생략 가능 이름 아무거나 가능
			type : 'get',
			success : function(res){
				
			},
			error : function(xhr){
				alert("상태: "+xhr.status);
			},
			dataType :'json'
			
		})
		
		
	})
	
	
})

</script>

</head>
<body>
<input type="button" value="memberList" id="memeber">

<br>
<br>
</body>
<div id ="result1"></div>
</html>