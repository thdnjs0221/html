package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.board.vo.ReplyVO;

public class BoardServiceImpl implements IBoardService {

	//dao객체 
	private IBoardDao  dao;
	//자신의 객체 
	private static IBoardService service;
	
	
	//생성자 - dao객체 얻기
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getDao();
	}
	
	
	//자신의 객체를 생성하고 리턴하는 메소드 
	public static IBoardService  getService() {
		if(service == null)  service = new BoardServiceImpl();
		
		return service;
	}
	
	@Override
	public int insertBoard(BoardVO vo) {
		
		return dao.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int num) {
		
		return dao.deleteBoard(num);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		
		return dao.updateBoard(vo);
	}

	@Override
	public int updateHit(int num) {
	
		return dao.updateHit(num);
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Object> map) {
		
		return dao.selectByPage(map);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		
		return dao.insertReply(vo);
	}

	@Override
	public int deleteReply(int renum) {
		
		return dao.deleteReply(renum);
		
	}

	@Override
	public int updateReply(ReplyVO vo) {
		
		return dao.updateReply(vo);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		
		return dao.totalCount(map);
	}


	@Override
	public PageVO pageInfo(int page, String stype, String sword) {
		//디비랑 연결없는 메소드!
		
		
		//전체글갯수 구하기 
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("stype", stype); //있으면 put하기
		map.put("sword", sword);
		
		int count= this.totalCount(map);
		
		//전체페이지수 구하기
		int perList = PageVO.getPerList(); // 한페이지에 보여질
		int totalPage= (int)Math.ceil(count/(double)perList);
		
		
		//start, end 구하기   19 21
		//?		
		int start=(page-1) *perList + 1;  //
		int end = start+perList-1;
		if(end>count) end=count;//페이지 21 나오면 안됨
		
		
		
		
		
		
		//시작페이지끝페이지 
		
		
		PageVO  vo = new PageVO();
		
		
		
		
		return vo;
	}


	@Override
	public List<ReplyVO> selectReply(int bonum) {
		
		return dao.selectReply(bonum);
	}
}









