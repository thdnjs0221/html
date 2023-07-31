package kr.or.ddit.buyer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.BuyerServiceImlp;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.vo.BuyerVO;


@WebServlet("/buyerDetail.do")
public class BuyerDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BuyerDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 전송데이터 받기
		String buyerId = request.getParameter("id");
		
		//Service객체 얻기 
		IBuyerService service = BuyerServiceImlp.getService();
		//service메소드 호출 - 결과값 받기 
		BuyerVO vo = service.selectById(buyerId);  //String id?
		//request에 결과값을 저장
		request.setAttribute("buyervo", vo);
		//view페이지로 이동
		request.getRequestDispatcher("/buyerview/buyerDetail.jsp").forward(request, response);		
	}

}
