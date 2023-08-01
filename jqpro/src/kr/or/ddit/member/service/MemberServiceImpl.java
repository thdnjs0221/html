package kr.or.ddit.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVo;
import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.prod.vo.ZipVO;


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
		 List<MemberVo> list = null;
		
		 //실행
		 list = dao.getAllMember();
		 
		 //리턴
		 return list;
		

	}

	@Override
	public String selectById(String mid) {
		
		
		return null;
	}

	@Override
	public int insertMember(MemberVo vo) {
		int cnt;
		SqlSession session;
try {
			
			session=MyBatisUtil.getSqlSession();
			cnt= session.insert("member.insertMember",memVo);
			
			if(cnt>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		
		return cnt;
		
		
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		// TODO Auto-generated method stub
		return null;
	}

}
