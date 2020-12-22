package com.kh.team.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.MemberDao;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.NonBuyer;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;

	@Override
	public MemberVo login(String m_id, String m_pass) throws Exception {
		MemberVo memberVo = memberDao.login(m_id, m_pass);
		return memberVo;
	}

	@Override
	public String sendEmailForFindId(String to) throws Exception {
		String m_id = memberDao.sendEmailForFindId(to);
		return m_id;
	}

	@Override
	public String sendEmailForFindPw(String to, String m_id) throws Exception {		
		String m_pass = memberDao.sendEmailForFindPw(to, m_id);
		return m_pass;
	}

	@Override
	public int changePw(String m_id, String m_pass_new) throws Exception {
		int count = memberDao.changePw(m_id, m_pass_new);
		return count;
	}

	
}
