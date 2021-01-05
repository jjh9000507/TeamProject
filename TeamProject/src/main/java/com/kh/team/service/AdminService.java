package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductVo;

public interface AdminService {
	//상품 목록 전체 가져오기
		public List<ProductVo> allProductList() throws Exception;
		//의류 상품 삭제
		public void adminClothesDelete(int p_no) throws Exception;
		//컴퓨터 상품 삭제
		public void adminComputerDelete(int p_no) throws Exception;
		//가전제품 상품 삭제
		public void adminWhitegoodsDelete(int p_no) throws Exception;
		//가구(침구) 상품 삭제
		public void adminFBedDelete(int p_no) throws Exception;
		//가구(인테리어) 상품 삭제
		public void adminFInteriorDelete(int p_no) throws Exception;
		//가구(주방) 상품 삭제
		public void adminFKitchenDelete(int p_no) throws Exception;
		//가구(생활) 상품 삭제
		public void adminFLifeDelete(int p_no) throws Exception;
		
		//카테고리 추가
		public void adminCategoryInput(CategoryVo categoryVo) throws Exception;
		//카테고리 삭제
		public void adminCategoryDelete(String cate_no) throws Exception;
		//카테고리 리스트 가져오기
		public List<CategoryVo> getCategoryList() throws Exception;
		//대분류 카테고리 가져오기
		public List<CategoryVo> firstCategoryList() throws Exception;
		//상품 목록 가져오기
		public List<ProductVo> productCateList(String cate_no) throws Exception;
		//선택 카테고리 목록 가져오기
		public List<CategoryVo> categoryDeleteList(String cate_no) throws Exception;
		
		//판매자 등록 취소
		public void rollbackSeller(String m_id) throws Exception;
		
		//판매자 등록인원 확인
		public List<MemberVo> sellerList() throws Exception;
		
		//관리자가 게시물 삭제 시 이미지 aws에서 지워야 할 때 파일 이름 가져오기
		public String imgNameSearch(int p_no2) throws Exception;
}
