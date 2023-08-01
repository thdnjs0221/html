package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVo;
import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.prod.vo.ZipVO;

public class MemberDaoImpl implements IMemberDao{
	
	//싱글톤
	//자기 자신 객체 만들기
	private static IMemberDao dao;
	//자기 자신 객체 생성 
	public static IMemberDao getDao() {
		if(dao==null)dao =  new MemberDaoImpl();
		return dao;
	}
	
	//mapper에 접근하는 SqlSession객체 
	//private SqlSession sql;
	/*
	//기본 뼈대 :
	List<MemberVo>list=null;
	list=sql.selectlist();
	return list */
	@Override
	public List<MemberVo> getAllMember() { 
	 //변수 선언
	 List<MemberVo> list = null;
	 SqlSession sql=MyBatisUtil.getSqlSession();
	
	 try {
		 list=sql.selectList("member.getAllMember");		 
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		sql.commit(); //select일때는 안해줘도 된다
		sql.close();  //**반드시 해주기**
	}
		return list;
	}

	@Override
	public String selectById(String mid) {
		
		String id = null;
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(MemberVo vo) {
		SqlSession session= null;
		int cnt=0;
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
		
	} 

}
