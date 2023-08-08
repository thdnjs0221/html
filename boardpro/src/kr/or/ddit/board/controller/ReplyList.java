package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;


@WebServlet("/ReplyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청시 전송 데이터 받기 bonum
		int bonum = Integer.parseInt(request.getParameter("bonum"));

		
		//서비스 객체 얻기 
		IBoardService service = BoardServiceImpl.getService();
		
		//서비스 메소드 호출하기  - 결과값: list
		List<ReplyVO>list = service.selectReply(bonum);
		
		//결과값 - 결과값 List를 request에 저장
		request.setAttribute("listvalue", list);
		
		//view페이지로 이동- json데이터를 생성
		request.getRequestDispatcher("/boardview/replyList.jsp").forward(request, response);
		
		
		
	}

}
