package com.kh.team.dao;

import com.kh.team.domain.MemberVo;
import com.kh.team.domain.NonBuyer;


public interface MemberDao {
	public void insert() throws Exception;
	// 로그인
	public MemberVo login(String m_id, String m_pass) throws Exception;
	// 회원정보와 대조하여 해당이메일에 대응하는 아이디 찾기
	public String sendEmailForFindId(String to) throws Exception;
	// 회원정보와 대조하여 해당이메일에 대응하는 비밀번호 찾기
	public String sendEmailForFindPw(String to, String m_id) throws Exception;
	// 비밀번호 변경하기
	public int changePw(String m_id, String m_pass_new) throws Exception;
	// 비회원 로그인 정보 생성
	public void nonbuyerCreate() throws Exception;
	// 비회원 로그인
	public NonBuyer nonbuyerLogin(int non_buyer) throws Exception;
}
