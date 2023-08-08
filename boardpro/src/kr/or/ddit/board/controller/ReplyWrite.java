package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;


@WebServlet("/ReplyWrite.do")
public class ReplyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송 데이터 받기(라이브러리 이용 )- name, bonum, cont
		ReplyVO vo = new ReplyVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//서비스 객체 얻기 
		IBoardService service = BoardServiceImpl.getService();
		
		//서비스메소드 호출하기 - 결과값:int 
		int res = service.insertReply(vo);
		
		request.setAttribute("result", res);  //공통  result에 보내기
		
		//view페이지로 이동- 출력 또는 json데이터 생성
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
	}

}
