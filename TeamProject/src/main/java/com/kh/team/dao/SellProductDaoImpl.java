package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;

@Repository
public class SellProductDaoImpl implements SellProductDao {

	private static final String NAMESPACE = "com.kh.team.sell.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> getCategoryList = sqlSession.selectList(NAMESPACE + "getCategoryList", cate_ref);
		return getCategoryList;
	}

	@Override
	public void sellerReg(String m_id) throws Exception {
		sqlSession.update(NAMESPACE + "registration", m_id);
	}

	@Override
	public List<MemberVo> sellerList() throws Exception {
		List<MemberVo> sellerList = sqlSession.selectList(NAMESPACE + "sellerList");
		return sellerList;
	}

	@Override
	public void rollbackSeller(String m_id) throws Exception {
		sqlSession.update(NAMESPACE + "rollbackSeller", m_id);
	}

}
