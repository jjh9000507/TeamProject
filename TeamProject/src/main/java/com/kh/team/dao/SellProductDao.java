package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.domain.ProductImgVo;
import com.kh.team.domain.WhitegoodsVo;

public interface SellProductDao {
	//하위 카테고리 가져오기
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception;
	//카테고리 대분류 가져오기
	public List<CategoryVo> firstCategoryList() throws Exception;
	//판매자 등록
	public void sellerReg(String m_id) throws Exception;
	
	//상품 등록
	public void whitegoodsInsert(WhitegoodsVo whitegoodsVo) throws Exception;
	public void computerInsert(ComputerVo computerVo) throws Exception;
	public void fBedInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception;
	public void fInteriorInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception;
	public void fKitchenInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception;
	public void fLifeInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception;
	
	
	//nextval
	public int getPnoNextval();
	
	//상품등록 시 이미지 등록
	public void productImage(String img_name, int p_no) throws Exception;
	
	//첨부파일 명 읽기
	public String[] getFileNames(int p_no);
}
