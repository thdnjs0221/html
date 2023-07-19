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

request.setCharacterEncoding("utf-8");

String res[]= request.getParameterValues("hobby");

String str="";
for(String hob : res){
	str += hob+"&nbsp;&nbsp;&nbsp;";
}

%>

당신의 취미는  <%=str %>입니다 <br>
 즐거운 인생 되세요
</body>
</html>