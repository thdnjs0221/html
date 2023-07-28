<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿 컨테이너에서 저장된 결과값 가져오기

	List<BuyerVO> list= (List<BuyerVO>)request.getAttribute("buyer"); //list가 꺼내집 형변환 하기 
	
	//다음 Json 데이터 만들기
%>
[

<%
	int i=0;
	for(BuyerVO vo: list){
		if(i>0) out.print(",");
	
%>
	{
			"id" : "<%= vo.getBuyer_id() %>",
			"name" : "<%= vo.getBuyer_name() %>"
	}
<%
	i++;
	}
	
%>


]
