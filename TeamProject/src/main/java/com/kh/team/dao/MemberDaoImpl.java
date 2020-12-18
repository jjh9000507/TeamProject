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
	public void insert() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVo login(String m_id, String m_pass) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("m_pass", m_pass);
		MemberVo memberVo =  sqlSession.selectOne(NAMESPACE + "login", map);
		return memberVo;
	}

}
