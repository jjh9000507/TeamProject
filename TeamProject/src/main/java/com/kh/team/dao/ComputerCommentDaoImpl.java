package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int changeCommentContent(int c_com_comment_no,String c_com_comment_content) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("c_com_comment_no", c_com_comment_no);
		map.put("c_com_comment_content", c_com_comment_content);
		int count = sqlSession.update(NAMESPACE + "updateCommentContent", map);
		
		return count;
	}

	@Override
	public void deleteComment(int c_com_comment_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteComment", c_com_comment_no);		
	}

	@Override
	public void insetInquire(ProductExplainVo productExplainVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insetInquire", productExplainVo);		
	}

	@Override
	public List<ProductExplainVo> searchInquire(ProductExplainVo productExplainVo) throws Exception {
		List<ProductExplainVo> list = sqlSession.selectList(NAMESPACE + "searchInquire", productExplainVo);
		return list;
	}
		
	
}
