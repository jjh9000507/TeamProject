package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ProductExplainVo;

@Repository
public class ComputerCommentDaoImpl implements ComputerCommentDao {

	//알맞은 맵퍼를 찾기위한 상수 지정
	private final String NAMESPACE = "com.kh.team.computerscomment.";
	
	//인젝
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ComputerCommentVo> getCommentList(int p_no) throws Exception {
		List<ComputerCommentVo> list = sqlSession.selectList(NAMESPACE + "getComptersCommentList", p_no);
		return list;
	}

	@Override
	public List<ProductExplainVo> getInquireList(int p_no) throws Exception {
		List<ProductExplainVo> list = sqlSession.selectList(NAMESPACE + "getInquireList", p_no);
		return list;
	}
		
	
}
