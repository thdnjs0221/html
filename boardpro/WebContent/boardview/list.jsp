<%@page import="com.google.gson.JsonObject"%>
<%@page import="jdk.nashorn.api.scripting.JSObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 서블릿에서 저장한 데이터 꺼내기 
List<BoardVO>list  = (List<BoardVO>)request.getAttribute("listvalue");
int startp = (Integer)request.getAttribute("startpage");
int endp = (Integer)request.getAttribute("endpage");
int totalp = (Integer)request.getAttribute("totalpage");


JsonObject obj = new JsonObject();
obj.addProperty("sp", startp);
obj.addProperty("ep", endp);
obj.addProperty("tp", totalp);

Gson gson = new Gson();

JsonElement ele = gson.toJsonTree(list);

obj.add("datas", ele);

response.setContentType("application/json; charset=utf-8");
out.println(obj);

%>