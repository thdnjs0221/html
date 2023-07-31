<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//서블릿에서 저장한 결과값 가져오기
	BuyerVO vo =(BuyerVO) request.getAttribute("buyervo");

	response.setContentType("application/json; charset=utf-8");
	Gson gson = new Gson();
	
	String result = gson.toJson(vo);//결과값vo를 gson으로 ,,
	
	out.println(result); //result는 json으로 되어있는 String타입 출력하기


%>

