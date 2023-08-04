<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 서블릿에서 저장한 데이터 꺼내기 
List<BoardVO>list  = (List<BoardVO>)request.getAttribute("listvalue");

Gson gson = new Gson();

String result = gson.toJson(list);

response.setContentType("application/json; charset=utf-8");
out.println(result);

%>