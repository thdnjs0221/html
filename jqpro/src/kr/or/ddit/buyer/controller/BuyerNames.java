package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.BuyerServiceImlp;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.vo.BuyerVO;

@WebServlet("/buyerNames.do")
public class BuyerNames extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BuyerNames() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청시 전송 데이터 받기 
		
		//service객체 요청 - 가져오기
		IBuyerService service = BuyerServiceImlp.getService();
		
		//service메소드 호출- 결과값 - list
		List<BuyerVO> list = service.selectList();
		
		//requeset객체에 list결과 값을 저장한다
		request.setAttribute("buyer", list);//""임의로 작성
		
		//view페이지로 이동한다
		request.getRequestDispatcher("/buyerview/buyerNames.jsp").forward(request, response);
		
		
		
	}

}
