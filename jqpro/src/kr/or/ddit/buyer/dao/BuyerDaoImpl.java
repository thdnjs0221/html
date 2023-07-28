package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class BuyerDaoImpl implements IBuyerDao {

	
	private static IBuyerDao dao;
	private SqlSession sql;
	//싱글톤 - 자신의 객체 생성, 리턴
	public static IBuyerDao getDao() {
		if(dao==null)dao= new BuyerDaoImpl();
		return dao;
		
	}
	@Override
	public List<BuyerVO> selectList() {
		//변수 선언
		List<BuyerVO> list = null;
		
		//실행 
		
		try {
			sql= MyBatisUtil.getSqlSession();
			list = sql.selectList("buyer.selectList");
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.commit();
			sql.close();
			
		}
		
		//리턴
		return list;
	}

	@Override
	public BuyerVO selectById(String id) {
		//변수 선언
		BuyerVO vo = null;
		try {
			sql= MyBatisUtil.getSqlSession();
			vo=sql.selectOne("buyer.selectById",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.commit();
			sql.close();
		}	
		return vo;
	}

}
