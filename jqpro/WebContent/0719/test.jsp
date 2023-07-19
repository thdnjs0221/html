<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h1{
color: red;

}
</style>
</head>
<body>
<h1> jsp : java server page </h1>
<%
String userId=request.getParameter("id");
String userPass=request.getParameter("pass");


%>

아이디: <%= userId %><br>
패스워드: <%= userPass %>
</body>
</html>