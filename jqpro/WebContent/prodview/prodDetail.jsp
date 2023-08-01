<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//서블릿에서 저장한 데이터 꺼내기 
	ProdVO vo = (ProdVO)request.getAttribute("PRODVO");

	response.setContentType("application/json; charset=utf-8");
	
	Gson gson = new Gson();
	
	String result = gson.toJson(vo);
	
	out.print(result);




%>