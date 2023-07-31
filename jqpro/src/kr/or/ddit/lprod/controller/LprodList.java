package kr.or.ddit.lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.service.ILprodService;
import kr.or.ddit.lprod.service.LprodServiceImpl;
import kr.or.ddit.lprod.vo.LprodVO;


@WebServlet(asyncSupported = true, urlPatterns = { "/LprodList.do" })
public class LprodList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LprodList() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 데이터 전송 받기 
		
		//service객체 얻기 
		ILprodService service = LprodServiceImpl.getService();
		
		//service메서드 호출- 결과값
		List<LprodVO> list = service.selectAll();
		
		//결과값을 request에 저장
		request.setAttribute("LPRODLIST",list);
		
		//view페이지로 이동
		request.getRequestDispatcher("/prodview/lprodList.jsp").forward(request, response);
		//여기서 LPRODLIST 를 꺼냄
		
		// view 안만들고 gson 여기에 써도 괜찮음 (//결과값을 request에 저장~부터 x)
	}

}
