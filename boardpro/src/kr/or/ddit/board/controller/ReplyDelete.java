package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;


@WebServlet(asyncSupported = true, urlPatterns = { "/ReplyDelete.do" })
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//요청시 전송데이터 받기 -renum
		int renum = Integer.parseInt(request.getParameter("renum"));
		
		//서비스 객체 얻기 
		IBoardService service = BoardServiceImpl.getService();
		
		//서비스 메소드 호출하기 - 결과: int
		int res =service.deleteReply(renum);
		
		//결과값 저장- requeset
		request.setAttribute("result", res);
		
		//view페이지 이동
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

}
