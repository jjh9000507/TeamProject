package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.domain.ProductImgVo;
import com.kh.team.domain.WhitegoodsVo;

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
	public void productImage(String img_name, int p_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("img_name", img_name);
		map.put("p_no", p_no);
		sqlSession.insert(NAMESPACE + "productImage", map);
	}

	@Override
	public List<CategoryVo> firstCategoryList() throws Exception {
		List<CategoryVo> firstCategoryList = sqlSession.selectList(NAMESPACE + "firstCategoryList");
		return firstCategoryList;
	}

	@Override
	public int getPnoNextval() {
		int p_no = sqlSession.selectOne(NAMESPACE + "getPnoNextVal");
		return p_no;
	}

	@Override
	public String[] getFileNames(int p_no) {
		List<String> filenames = sqlSession.selectList(NAMESPACE + "getFileNames", p_no);
		String arr[] = new String[filenames.size()];
		for(int i = 0; i < arr.length; i++) {
			arr[i] = filenames.get(i);
		}
		return arr;
	}

	@Override
	public void whitegoodsInsert(WhitegoodsVo whitegoodsVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertWhitegoods", whitegoodsVo);
	}

}
