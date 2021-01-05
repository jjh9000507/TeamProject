package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.SellProductDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.domain.ProductImgVo;

@Service
public class SellProductServiceImpl implements SellProductService {

	@Inject
	private SellProductDao sellProductDao;
	
	//카테고리 셀렉트박스에 카테고리 띄우기
	@Override
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> getCategoryList = sellProductDao.getCategoryList(cate_ref);
		return getCategoryList;
	}

	//판매자 등록
	@Override
	public void sellerReg(String m_id) throws Exception {
		sellProductDao.sellerReg(m_id);
	}

	//컴퓨터 등록
	@Override
	public void computerInsert(ComputerVo computerVo) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void fBedInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void fInteriorInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void fKitchenInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void fLifeInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void productImage(ProductImgVo productImgVo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CategoryVo> firstCategoryList() throws Exception {
		List<CategoryVo> firstCategoryList = sellProductDao.firstCategoryList();
		return firstCategoryList;
	}


}
