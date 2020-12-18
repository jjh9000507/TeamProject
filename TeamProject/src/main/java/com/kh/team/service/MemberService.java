package com.kh.team.service;

import com.kh.team.domain.MemberVo;

public interface MemberService {
	public void insert() throws Exception;
	// 로그인
	public MemberVo login(String m_id, String m_pass) throws Exception;
}
