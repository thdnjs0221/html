<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//서블릿에서 저장한 데이터 꺼내기 
	
	String res = (String)request.getAttribute("USERID");

	if(res==null){
		//사용 가능합니다
%>	
	
	{
	
	"sw" : "사용가능한 아이디 입니다 "
	
	}

		
<%	
	}else{
		//사용불가능
%>	
	{
	
	"sw" : "사용불가능한 아이디 입니다 "
	
	}

		
<%		
	}

%>