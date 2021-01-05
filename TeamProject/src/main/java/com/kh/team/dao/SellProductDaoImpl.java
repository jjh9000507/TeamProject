package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductImgVo;

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
	public void computerInsert(ComputerVo computerVo) throws Exception {
		sqlSession.insert(NAMESPACE + "computerInsert", computerVo);
		
	}

	@Override
	public void fBedInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		sqlSession.insert(NAMESPACE + "fBedInsert", furnitureInteriorVo);
		
	}

	@Override
	public void fInteriorInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		sqlSession.insert(NAMESPACE + "fInteriorInsert", furnitureInteriorVo);
		
	}

	@Override
	public void fKitchenInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		sqlSession.insert(NAMESPACE + "fKitchenInsert", furnitureInteriorVo);
		
	}

	@Override
	public void fLifeInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		sqlSession.insert(NAMESPACE + "fLifeInsert", furnitureInteriorVo);
		
	}

	@Override
	public void productImage(ProductImgVo productImgVo) throws Exception {
		sqlSession.insert(NAMESPACE + "productImage", productImgVo);
	}

}
