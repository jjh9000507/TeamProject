package com.kh.team.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.MemberDao;
import com.kh.team.domain.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;

	@Override
	public void insert() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVo login(String m_id, String m_pass) throws Exception {
		MemberVo memberVo = memberDao.login(m_id, m_pass);
		return memberVo;
	}

}
