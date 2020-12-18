package com.kh.team.dao;

import com.kh.team.domain.MemberVo;

public interface MemberDao {
	public void insert() throws Exception;
	// 로그인
	public MemberVo login(String m_id, String m_pass) throws Exception;
}
