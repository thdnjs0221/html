package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVo;
import kr.or.ddit.prod.vo.ZipVO;

public interface IMemberService {

	//메소드 선언
	public List<MemberVo> getAllMember();
	
	//중복검사 
	public String selectById (String mid);
	
	//우편번호 검색
	public List<ZipVO> selectByDong(String dong);
	
	//회원가입을 위한 메소드 
	public int insertMember (MemberVo vo);
	
}
