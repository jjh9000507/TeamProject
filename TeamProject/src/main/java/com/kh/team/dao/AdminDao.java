package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.QACateVo;
import com.kh.team.domain.QandAVo;

public interface AdminDao {
	
	//관리자페이지 전체 회원정보 가져오기
	public List<MemberVo> adminMemberSearch() throws Exception;
	//관리자페이지 회원정보 삭제
	public void adminMemberDelete(String m_id) throws Exception;
	//판매자 권한 박탈 데이터 삭제
	public void adminSanctionDelete(String m_id) throws Exception;
	//카트에 상품담은 회원 삭제
	public void adminCartDelete(String m_id) throws Exception;
	//해당 회원 의류상품 삭제
	public void adminMemberClothesDelete(String m_id) throws Exception;
	//해당 회원 컴퓨터상품 삭제
	public void adminMemberComputerDelete(String m_id) throws Exception;
	//해당 회원 가전제품상품 삭제
	public void adminMemberWhitegoodsDelete(String m_id) throws Exception;
	//해당 회원 가구(침구) 상품 삭제
	public void adminMemberFBedDelete(String m_id) throws Exception;
	//해당 회원 가구(인테리어) 상품 삭제
	public void adminMemberFInteriorDelete(String m_id) throws Exception;
	//해당 회원 가구(주방) 상품 삭제
	public void adminMemberFKitchenDelete(String m_id) throws Exception;
	//해당 회원 가구(생활) 상품 삭제
	public void adminMemberFLifeDelete(String m_id) throws Exception;
	
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
	//대분류의 하위분류 가져오기
	public List<CategoryVo> otherCategoryList(String cate_ref) throws Exception;
	//상품 목록 가져오기
	public List<ProductVo> productCateList(String cate_no) throws Exception;
	//선택 카테고리 목록 가져오기
	public List<CategoryVo> categoryDeleteList(String cate_no) throws Exception;
	
	//판매자 등록 취소
	public void rollbackSeller(String m_id) throws Exception;
	
	//판매자 리스트
	public List<MemberVo> sellerList() throws Exception;
	
	//관리자가 게시물 삭제 시 이미지 aws에서 지워야 할 때 파일 이름 가져오기
	public String imgNameSearch(int p_no2) throws Exception;
	
	//이미지 테이블에서 게시물에 올라간 이미지 데이터 지우기
	public void productImgDelete(int p_no) throws Exception;
	
	//첨부파일 명 읽기
	public String[] getFileName(int p_no);
	
	//Q&A 수정/삭제 에 사용할 리스트 가져오기
	public List<QandAVo> QA_UDList() throws Exception;
	
	//Q&A 수정/삭제에 이름 띄우기위해 대조하는 Q&A 카테고리 리스트 가져오기
	public List<QACateVo> QACategory() throws Exception;
	
	//Q&A 추가에 사용할 대분류 카테고리 리스트 가져오기
	public List<QACateVo> firstQACategory() throws Exception;
	
	//Q&A 추가에 사용할 하위 카테고리 리스트 가져오기
	public List<QACateVo> otherQACategory(String qa_cate_no) throws Exception;
	
	//Q&A 추가하기
	public void qaInsert(QandAVo qandAVo) throws Exception;
}