package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;


@WebServlet("/ReplyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송 데이터 받기 - cont renum
		//vo
		int renum =Integer.parseInt(request.getParameter("renum"));
		String cont = request.getParameter("cont");
		
		ReplyVO vo = new ReplyVO();
		vo.setRenum(renum);
		vo.setCont(cont);
		
		
		//서비스 객체 얻기 
		IBoardService service = BoardServiceImpl.getService();
		
		
		//서비스 메서드 호출하기  - int결과값
		int res = service.updateReply(vo);
		//결과값 저장 
		request.setAttribute("result", res);
		
		//view페이지로 가기 
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
		
	}

}
