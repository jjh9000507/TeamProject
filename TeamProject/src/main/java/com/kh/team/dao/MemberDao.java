package com.kh.team.dao;

import com.kh.team.domain.MemberVo;




public interface MemberDao {
	
	// 로그인
	public MemberVo login(String m_id, String m_pass) throws Exception;
	// 회원정보와 대조하여 해당이메일에 대응하는 아이디 찾기
	public String sendEmailForFindId(String to) throws Exception;
	// 회원정보와 대조하여 해당이메일에 대응하는 비밀번호 찾기
	public String sendEmailForFindPw(String to, String m_id) throws Exception;
	// 비밀번호 변경하기
	public int changePw(String m_id, String m_pass_new) throws Exception;
	// 회원정보 내역 보기
	public MemberVo memberVoInfoSearch(String m_id) throws Exception;
	// 회원정보 변경하기(문자이용)
	public int memberVoInfoChange(MemberVo memberVo) throws Exception;
	
}
