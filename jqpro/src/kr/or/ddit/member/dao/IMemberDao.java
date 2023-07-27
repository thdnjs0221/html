package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVo;

public interface IMemberDao {

	//메소드 선언
	public List<MemberVo> getAllMember();
}
