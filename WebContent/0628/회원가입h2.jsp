<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
	color:#10609

}

</style>


</head>
<body>
<h1>JSP: JAVA SERVER</h1>
<%
request.setCharacterEncoding("utf-8");

String userId=request.getParameter("id");
String userName=request.getParameter("name");
String userAddress=request.getParameter("address");
String userMail=request.getParameter("email");
String userGender=request.getParameter("gender");
String userArea=request.getParameter("area");

%>



<%= userName%><br>
<%= userAddress%><br>
<%= userMail%><br>
<%= userGender%><br>
<%= userArea%><br>

</body>
</html>