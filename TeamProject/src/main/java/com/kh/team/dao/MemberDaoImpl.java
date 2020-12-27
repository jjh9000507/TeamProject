package com.kh.team.dao;

import java.util.HashMap;



import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.MemberVo;



@Repository
public class MemberDaoImpl implements MemberDao {
	
private final String NAMESPACE = "com.kh.team.member.";
	
	@Inject
	private SqlSession sqlSession;

	

	@Override
	public MemberVo login(String m_id, String m_pass) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("m_pass", m_pass);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return memberVo;
	}

	@Override
	public String sendEmailForFindId(String to) throws Exception {
		String m_id = sqlSession.selectOne(NAMESPACE + "sendEmailForFindId", to);
		return m_id;
	}

	@Override
	public String sendEmailForFindPw(String to, String m_id) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("to", to);
		map.put("m_id", m_id);
		String m_pass = sqlSession.selectOne(NAMESPACE + "sendEmailForFindPw", map);
		return m_pass;
		
	}

	@Override
	public int changePw(String m_id, String m_pass_new) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("m_pass_new", m_pass_new);
		map.put("m_id", m_id);
		int count = sqlSession.update(NAMESPACE + "changePw", map);
		return count;	
		
	}

	@Override
	public MemberVo memberVoInfoSearch(String m_id) throws Exception {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "memberVoInfoSearch", m_id);
		return memberVo;
	}

	
}
