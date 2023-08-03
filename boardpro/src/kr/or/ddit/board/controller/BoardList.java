package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.PageVO;


@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardList() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송 데이터 받기 - page stype sword  (키값! board.js)
		int page = Integer.parseInt(request.getParameter("page"));
		
		//최초 실행시 값이 없음
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		
		//서비스 객체 얻기 
		IBoardService service = BoardServiceImpl.getService();
		
		//서비스 메소드 호출 - page정보만 얻기
		//페이지별 정보 pageinfo 먼저 구하기 (dao X/db랑 직접 연관없는 단순계산)
		PageVO pvo = service.pageInfo(page, stype, sword);
		
		//서비스 메소드 호출 - page정보에 의한 리스트를 select-결과값list
		
		//결과값을 request에 저장
		
		//view페이지로 이동
		
	
	}

}
