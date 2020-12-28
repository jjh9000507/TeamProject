package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

@Repository
public class ComputersDaoImpl implements ComputersDao {

private final String NAMESPACE = "com.kh.team.computers.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ComputerVo> list(String cate_no) throws Exception {
		List<ComputerVo> list = sqlSession.selectList(NAMESPACE + "getComptersProductList", cate_no);
		return list;
	}

	@Override
	public List<CategoryVo> categoryInfo(String cate_no) throws Exception {
		List<CategoryVo> categorylist = sqlSession.selectList(NAMESPACE + "getCategoryInfo", cate_no);
		return categorylist;
	}

	@Override
	public ComputerVo detailComputerInfo(int p_no) throws Exception {
		ComputerVo categoryVo = sqlSession.selectOne(NAMESPACE + "detailComputerInfo", p_no);
		return categoryVo;
	}
}
