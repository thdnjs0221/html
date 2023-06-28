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
String userPass=request.getParameter("pass");
String userMail=request.getParameter("email");
String userTel=request.getParameter("tel");

%>


<%= userId%><br>
<%= userName%><br>
<%= userPass%><br>
<%= userMail%><br>
<%= userTel%><br>

</body>
</html>