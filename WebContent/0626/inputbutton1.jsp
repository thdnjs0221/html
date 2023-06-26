<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h1>JSP: Java Server page </h1>
<%

	request.setCharacterEncoding("UTF-8");
	
	
	String userId= request.getParameter("id");
	String userName= request.getParameter("name");

//db 연결- crud처리- 결과값을 생성

//결과값을 출력
%>

<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
	
	</tr>
	
	<tr>
		<td><%= userId %></td>
		<td><%= userName %></td>
	
	</tr>
	
	
</table>

</body>
</html>