package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVO;

public class LprodServiceImpl implements ILprodService {

	//싱글톤  - 자신객체 
	private static ILprodService service;
	
	//dao 객채
	private ILprodDao dao;
	
	//생성자 
	private LprodServiceImpl() {
		dao= LprodDaoImpl.getdao();
	}
	
	public static ILprodService getService() {
		if(service==null) service = new LprodServiceImpl();
		return service;
	}
	
	
	@Override
	public List<LprodVO> selectAll() {
		//선언 //실행//리턴 한번에
		return dao.selectAll();
	}

}
