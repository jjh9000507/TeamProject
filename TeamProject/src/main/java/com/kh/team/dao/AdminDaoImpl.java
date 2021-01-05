package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	private static final String NAMESPACE = "com.kh.team.admin.";
	
	@Inject
	private SqlSession sqlSession;
	
	//상품 전체 가져오기
	@Override
	public List<ProductVo> allProductList() throws Exception {
		List<ProductVo> allProductList = sqlSession.selectList(NAMESPACE + "allProductList");
		return allProductList;
	}

	//의류 상품 삭제
	@Override
	public void adminClothesDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteClothes", p_no);
	}

	//컴퓨터 상품 삭제
	@Override
	public void adminComputerDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteComputer", p_no);
	}

	//가전제품 상품 삭제
	@Override
	public void adminWhitegoodsDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteWhitegoods", p_no);
	}

	//침구류 상품 삭제
	@Override
	public void adminFBedDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteFBed", p_no);
	}

	//인테리어 상품 삭제
	@Override
	public void adminFInteriorDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteFInterior", p_no);
	}

	//주방용품 상품 삭제
	@Override
	public void adminFKitchenDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteFKitchen", p_no);
	}

	//생활용품 상품 삭제
	@Override
	public void adminFLifeDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteFLife", p_no);
	}

	//카테고리 추가
	@Override
	public void adminCategoryInput(CategoryVo categoryVo) throws Exception {
		sqlSession.insert(NAMESPACE + "adminCategoryInput", categoryVo);
	}

	//카테고리 삭제
	@Override
	public void adminCategoryDelete(String cate_no) throws Exception {
		sqlSession.delete(NAMESPACE + "adminCategoryDelete", cate_no);
	}

	//카테고리 목록 가져오기
	@Override
	public List<CategoryVo> getCategoryList() throws Exception {
		List<CategoryVo> getCategoryList = sqlSession.selectList(NAMESPACE + "getCategoryList");
		return getCategoryList;
	}

	//카테고리 별 상품 리스트 가져오기
	@Override
	public List<ProductVo> productCateList(String cate_no) throws Exception {
		List<ProductVo> productCateList = sqlSession.selectList(NAMESPACE + "productCateList", cate_no);
		return productCateList;
	}

	//카테고리 리스트(관리자페이지-카테고리-카테고리 삭제)
	@Override
	public List<CategoryVo> categoryDeleteList(String cate_no) throws Exception {
		List<CategoryVo> categoryDeleteList = sqlSession.selectList(NAMESPACE + "CategoryDeleteList", cate_no);
		return categoryDeleteList;
	}
	
	//판매자 권한 삭제
	@Override
	public void rollbackSeller(String m_id) throws Exception {
		sqlSession.update(NAMESPACE + "rollbackSeller", m_id);
	}
	
	//판매자 권한 등록인원 확인
	@Override
	public List<MemberVo> sellerList() throws Exception {
		List<MemberVo> sellerList = sqlSession.selectList(NAMESPACE + "sellerList");
		return sellerList;
	}

	//대분류 카테고리
	@Override
	public List<CategoryVo> firstCategoryList() throws Exception {
		List<CategoryVo> firstCategoryList = sqlSession.selectList(NAMESPACE + "firstCategoryList");
		return firstCategoryList;
	}

	@Override
	public String imgNameSearch(int p_no2) throws Exception {
		String imgNameSearch = sqlSession.selectOne(NAMESPACE + "imgNameSearch", p_no2);
		return imgNameSearch;
	}

}
