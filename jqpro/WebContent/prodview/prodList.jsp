<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//gson은 vo에 있는것만 꺼내준다
//서블릿에서 저장한 데이터 꺼내기 
	List<ProdVO>list= (List<ProdVO>)request.getAttribute("PRODLIST");
	response.setContentType("application/json; charset=utf-8");
	JsonObject obj = new JsonObject();

//값이 있을수도 없을수도 있음(P401은 없고 P302까지는 데이터 있음)
	if(list!=null && list.size()>0){
		//데이터가 있는 경우

											
											
										    //gson은 vo에 있는것만 꺼내준다//vo에 없는거 때문에 만들어주는것! 	
		obj.addProperty("sw", "ok");		//toJsonTree로 만들고 datas에 넣는다 datas를 JsonObject에 넣어준다
		
		Gson gson = new Gson();
		JsonElement ele= gson.toJsonTree(list); //리스트를 트리로 만들어서 엘리먼트가 된것
		
		obj.add("datas", ele); 	//datas를 obj에 add
		
		


}else{
	//데이터 없는 경우 
	obj.addProperty("sw", "no");
}
out.print(obj);


%>