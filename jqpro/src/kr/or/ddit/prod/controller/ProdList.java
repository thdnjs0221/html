package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;


@WebServlet("/ProdList.do")
public class ProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProdList() {
        super();
        // TODO Auto-generated constructor stub
    }
    
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청시 전송데이터 받기 
		//gu값을 가져오기 
		String lgu= request.getParameter("gu");
		//P101, P104..
		
		//서비스 객체 얻기 
		IProdService service = ProdServiceImpl.getService();
		
		//서비스 메소드 호출 - 결과값 받기 
		List<ProdVO>list = service.selectByLgu(lgu);
		
		//결과값을 request저장
		request.setAttribute("PRODLIST", list);
		
		//뷰로 이동
		request.getRequestDispatcher("/prodview/prodList.jsp").forward(request, response);
		
	}

	
	 
}
