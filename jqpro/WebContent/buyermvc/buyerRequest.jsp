<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
    <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
function proc1() {
	
	$.ajax({
		
		url : "/jqpro/buyerNames.do", //controller
	<%-- 	url: "<%=request.getContextPath()%>/buyerNames.do" --%>
		type: 'get',
		dataType: 'json',
		success: function(res){
			code="";
			
			$.each(res,function(i,v){
			/* 	code+="<p class='"+this.id+"'>"+this.name+"</p>" */
			code+=`<p class=${this.id}>${this.name}</p>`
			/*$->jsp에서는 EL로 되어있다 EL이 아니라고 선언해주기   */
				
			})
			$('#names').html(code);
			
		},
		error: function(xhr){
			alert("상태: "+xhr.status);
			
		}
		
	})
	
}//proc1 끝
$(function(){

	$(document).on('click','p',function(){
		vattr=$(this).attr('class');
		alert(vattr); //기존에 있던 p태그가 아니라 실행이 안된다.
	
<%-- 	$.ajax({
		url: "<%=request.getContextPath()%>/buyerDetail.do"
		data: "id=" + vattr,
		type: 'get',
		dataType: 'jason',
		success: function(res){
			
		},
		error: function(xhr){
			alert("상태: "+xhr.status)
		}
	 }) --%>
  })

	
})


</script>

<style type="text/css">

p:hover{
	background: lime;
}

table{
	border: 1px solid blue;
}
td{
	width: 200px;
	height: auto;
	padding: 10px;
	

}
.info{
	width: 500px;
	

}
th{
	background: skyblue;
	height: 50px;
}
</style>



</head>
<body>
<input type="button" value="buyer동기" onclick="location.href='/jqpro/buyerNames.do'"> 

<input type="button" value="buyer비동기" onclick="proc1()">
<br>
<br>
<div id="result1">
<table border="1"> 
	<tr> <th>거래처 이름 </th> <th class=info>거래처 상세정보 </th>  </tr>
	<tr>
		<td id="names"> </td> 
		<td id="detail"> </td> 
	</tr>

</table>
 </div>
 
</body>
</html>