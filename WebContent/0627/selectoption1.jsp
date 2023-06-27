<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");

String userName=request.getParameter("name");
String car1= request.getParameter("car1");

String car2[]= request.getParameterValues("car2");

String sc2="";
for(String c2:car2){
	sc2+=c2 +"<br>";
}

%>

<%= userName%> <br>
<%= car1%> <br>
<%= sc2%> <br>

</body>
</html>