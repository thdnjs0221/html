<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	color: red;
}

p {
	font-size: 1.3rem;
	background: gold;
}

table {
	border: 1px solid blue;
}

td {
	width: 300px;
	height: 50px;
	text-align: center;
}

.title {
	background: skyblue;
}
</style>
</head>
<body>
	<h1>JSP: Java Server Page</h1>
	<p>html기반에서 java언어를 사용하여 프로그램을 처리할 수 있다</p>

	<p>java 언어를 기술 할때는 &lt;% &nbsp;&nbsp;&nbsp;&nbsp;%> 기호 사이에서 코딩한다</p>
	<p>java처리 후 결과값을 출력 할때는 &lt;%= &nbsp;&nbsp;&nbsp;&nbsp; %>사이에 기술한다</p>
	<%
		//클라이언트가 입력 한 id와 pw를 받는다. form의 main속성을 이용
	String userId = request.getParameter("id");
	String userPass = request.getParameter("pass");
	String userAge = request.getParameter("age");

	//db에 접근해서 select작업을 수행한다.

	//수행 된 결과 값을 출력한다
	%>

	<table border="1">
		<tr>
			<td class="title">아이디</td>
			<td class="title">비밀번호</td>
			<td class="title">나이</td>
		</tr>

		<tr>
			<td><%=userId%></td>
			<td><%=userPass%></td>
			<td><%=userAge%></td>
		</tr>

	</table>
</body>
</html>