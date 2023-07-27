package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVo;

public class MemberServiceImpl implements IMemberService {

	//자기 자신의 객체를 생성하고 리턴
	private static IMemberService service;
	
	//dao의 객체가 필요 
	private IMemberDao dao;
	//생성자-dao객체 얻어오기
	private MemberServiceImpl() {
		dao= MemberDaoImpl.getDao();  //dao getdao메소드호출
	}
	
	public static IMemberService getservice() {
		if(service==null)service= new MemberServiceImpl();
		return service;
	}
	@Override
	public List<MemberVo> getAllMember() {
		//변수선언
		 List <MemberVo>list = null;
		
		 //실행
		 list = dao.getAllMember();
		 
		 //리턴
		 return list;
		

	}

}
