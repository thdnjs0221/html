package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberList
 */
@WebServlet("/MemberList.ddit")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청사 전송 데이터 받기: 예) id,pass
		
		//service객체 필요함 - service 객체를 얻어와라
		
		//service 메소드 호출 - 결과값 받기 - list
		
		
		//결과값 list를 출력 또는 json데이터 생성-view페이지로 이동
		
		//request객체에 list결과 값을 저장
		
		//forward를 이용하여 view페이지로 이동한다
		
	}

}
