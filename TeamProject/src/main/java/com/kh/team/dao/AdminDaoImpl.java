package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	private static final String NAMESPACE = "com.kh.team.admin.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVo> allProductList() throws Exception {
		List<ProductVo> allProductList = sqlSession.selectList(NAMESPACE + "allProductList");
		return allProductList;
	}

	@Override
	public void adminClothesDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteClothes", p_no);
	}

	@Override
	public void adminComputerDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteComputer", p_no);
	}

	@Override
	public void adminWhitegoodsDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteWhitegoods", p_no);
	}

	@Override
	public void adminFBedDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteFBed", p_no);
	}

	@Override
	public void adminFInteriorDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteFInterior", p_no);
	}

	@Override
	public void adminFKitchenDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteFKitchen", p_no);
	}

	@Override
	public void adminFLifeDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteFLife", p_no);
	}

	@Override
	public void adminCategoryInput(CategoryVo categoryVo) throws Exception {
		sqlSession.insert(NAMESPACE + "adminCategoryInput", categoryVo);
	}

	@Override
	public void adminCategoryDelete(String cate_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminCategoryDelete", cate_no);
	}

	@Override
	public List<CategoryVo> getCategoryList() throws Exception {
		List<CategoryVo> getCategoryList = sqlSession.selectList(NAMESPACE + "getCategoryList");
		return getCategoryList;
	}

}
