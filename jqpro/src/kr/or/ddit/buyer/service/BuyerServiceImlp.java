package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.vo.BuyerVO;

public class BuyerServiceImlp implements IBuyerService {

	//자기자신 변수 
	private static IBuyerService service;
	//dao객체 변수 
	private IBuyerDao dao;
	//생성자 - dao객체 주문하기 
	private BuyerServiceImlp() {
		dao=BuyerDaoImpl.getDao();
	}
	//자기 자신의 변수 생성, 리턴 -> 컨트롤러가 사용하는거
	public static IBuyerService getService() {
		if(service==null) service= new BuyerServiceImlp();
		return service;
	}
	
	@Override
	public List<BuyerVO> selectList() {
		//변수 선언
		 List<BuyerVO>  list = null;
		//실행
		list = dao.selectList();
		//리턴
		return list;
	}

	@Override
	public BuyerVO selectById(String id) {
		//실행, 리턴 
		//한줄로 쓰는 법
		return dao.selectById(id);
		/*
		BuyerVO vo = null;
		vo= dao.selectById(id);
		return vo;
		*/
	}

}
