<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서블릿에서 저장한 데이터 꺼내기
	List<ZipVO> list = (List<ZipVO>)request.getAttribute("DONG");

//json 데이터 생성

Gson gson = new Gson();

String result = gson.toJson(list);

response.setContentType("application/json; charset=utf-8");
out.println(result);


%>