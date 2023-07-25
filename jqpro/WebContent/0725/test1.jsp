<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

p{
	background:  yellow;
	font-size: 1.5em;
	padding: 10px;
}


</style>
</head>
<body>

<%

request.setCharacterEncoding("utf-8");

String userId= request.getParameter("id");
String userName= request.getParameter("name");
String userAddr= request.getParameter("addr");
String userTel= request.getParameter("tel");

//DB처리 후 결과를 생성한다
//결과를 출력한다 


%>

<p>아이디 <%=userId %> </p>
<p>이름 <%=userName %> </p>
<p>주소 <%=userAddr %> </p>
<p>전화번호 <%=userTel %> </p>

</body>
</html>