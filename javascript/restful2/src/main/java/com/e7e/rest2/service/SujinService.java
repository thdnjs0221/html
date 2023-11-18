package com.e7e.rest2.service;

import java.util.List;

import com.e7e.rest2.vo.SujinVO;

//여기에 @Service x.. 인터페이스는 객제화 안됨
public interface SujinService {
	
		//리스트
		List<SujinVO> getSujins();
		
		//1개
		SujinVO getSujin(SujinVO sujinVO);
		
		//생성
		int insSujin(SujinVO sujinVO);
		
		//수정
		int updateSujin(SujinVO sujinVO);
		
		//삭제
		int delSujin(SujinVO sujinVO);  //pk만 넘겨도 되지만 이렇게 써도 됨


}
