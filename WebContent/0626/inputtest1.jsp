<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
border:1px solid blue;
}

td{
width: 400px;
height: 50px;
text-align: center;
}
.title{
background: lightgreen;


}


</style>
</head>
<body>
<h1>JSP: Java Server Page</h1>


<%
 request.setCharacterEncoding("UTF-8");

String idvalue=request.getParameter("id");
String passvalue=request.getParameter("pass");
String gender=request.getParameter("gender");

//배열 html에 있는 name 속성에서 가져온것.
String frs[] = request.getParameterValues("fruits");

String file=request.getParameter("file");


String fr="";

for(int i=0; i<frs.length; i++){
	fr += frs[i]+ "&nbsp;&nbsp;&nbsp;&nbsp;";
}

//비즈니스로직 처리- db의 crud처리 - 결과값을 얻어온다.

//결과값을 출력한다.

%>
<table border="1">
 <tr> 
  <td class="title">아이디</td>
  <td><%=idvalue %></td>
 </tr>
 
 <tr> 
  <td class="title">비밀번호</td>
  <td><%=passvalue %></td>
 </tr>
 
 <tr> 
  <td class="title">성별</td>
  <td><%=gender%></td>
 </tr>
 
 <tr> 
  <td class="title">좋아하는 과일</td>
  <td><%=fr %></td>
 </tr>
 
 <tr> 
  <td class="title">첨부파일</td>
  <td><%=file %></td>
 </tr>
 
 




</table>

</body>
</html>