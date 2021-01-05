package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductImgVo;

public interface SellProductService {
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception;
	public void sellerReg(String m_id) throws Exception;
	
	//상품 등록
	public void computerInsert(ComputerVo computerVo) throws Exception;
	public void fBedInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception;
	public void fInteriorInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception;
	public void fKitchenInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception;
	public void fLifeInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception;
	
	//상품등록 시 이미지 등록
	public void productImage(ProductImgVo productImgVo) throws Exception;
}
