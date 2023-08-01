<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="true" %> <!--`쓸때 써주기  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

$(function(){
	
	//lprod를 실행
	$.ajax({
		
		url : "<%= request.getContextPath()%>/LprodList.do",
		type: 'get',
		dataType: 'json',
		success: function (res) {
			
			code="";
			$.each(res, function(i,v) {
				code+= `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`
			})
			$('#lprod').html(code);
			
		},
		error: function(xhr) {
			alert("상태 "+xhr.status);
		}
	})
	
	//lprod_gu를 서버로 보내서 prod_lgu와 값이 같은 조건으로 prod의
	//id name 을 select한다.
	$('#lprod').on('change',function(){
		//$('#lprod option : selected').val() 밑에랑 같은거
		guvalue = $('option:selected',this).val();
		
		$.ajax({
			url: '<%= request.getContextPath()%>/서블릿이름',
			data: "gu=" + guvale, //공백 없어야함
			dataType: 'json',
			success: function (res) {
				
			},
			error: function(xhr) {
				alert('상태: '+xhr.status);
			}
			
		})
	
	})
	
	
	
	//prod id를 기준으로 prod detail을 수행

})

</script>


</head>
<body>

	<select id="lprod"></select>

	<select id="prod"></select>
	
	<br>
	<br>
	<div id="result"></div>

</body>
</html>