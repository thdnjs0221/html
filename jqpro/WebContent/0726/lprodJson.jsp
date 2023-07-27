<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVo"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//요청시 전송데이터 받기 예) 아이디,비밀번호 
	//DB처리-SqlSession
	SqlSession sql = MyBatisUtil.getSqlSession();
	
	//mapper 실행-결과값(list)
	//select 조건없이 실행하면 List ,한줄 나오면 vo, 여러줄 List, 숫자 int.. 
	List<LprodVO> list =sql.selectList("lprod.selectAll");
	
	//결과값을 list가지고 json데이터를 생성
	
	%>
	[      <%--테이블  --%>
	<%
		for(int i=0; i<list.size(); i++){
			LprodVO vo= list.get(i);
			if(i>0) out.print(",");
			
	%>
	
		{
			"lprod_id" : "<%= vo.getLprod_id() %>",
			"lprod_gu" : "<%= vo.getLprod_gu() %>",
			"lprod_nm" : "<%= vo.getLprod_nm() %>"
		}
	
	
	<%
		}
	
	%>
	]
	