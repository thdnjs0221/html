package kr.or.ddit.prod.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;


@WebServlet("/ProdDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ProdDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 전송 데이터 받기 
		String pid = request.getParameter("id");
		
		//service객체 얻기 
		IProdService service = ProdServiceImpl.getService();
		
		//service메소드 호출 - 결과값 방기 
		ProdVO vo = service.ProdDetail(pid);
		
		//request저장
		request.setAttribute("PRODVO", vo);
		
		//view페이지 이동
		request.getRequestDispatcher("/prodview/prodDetail.jsp").forward(request, response);
	}

}
