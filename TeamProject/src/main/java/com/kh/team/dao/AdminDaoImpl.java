package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.InquiryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.QACateVo;
import com.kh.team.domain.QandAVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	private static final String NAMESPACE = "com.kh.team.admin.";
	
	@Inject
	private SqlSession sqlSession;
	
	
	//회원 삭제 페이지에서 사용할 회원 목록 가져오기
	@Override
	public List<MemberVo> adminMemberSearch() throws Exception {
		List<MemberVo> memberList = sqlSession.selectList(NAMESPACE + "adminMemberSearch");
		return memberList;
	}
	
	//여기서부터 해당 회원이 등록한 상품 목록 삭제
	//의류
	@Override
	public void adminMemberClothesDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminMemberClothesDelete", m_id);
		
	}

	//컴퓨터
	@Override
	public void adminMemberComputerDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminMemberComputerDelete", m_id);
		
	}

	//가전제품
	@Override
	public void adminMemberWhitegoodsDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminMemberWhitegoodsDelete", m_id);
		
	}

	//침구
	@Override
	public void adminMemberFBedDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminMemberFBedDelete", m_id);
		
	}

	//인테리어
	@Override
	public void adminMemberFInteriorDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminMemberFInteriorDelete", m_id);
		
	}

	//주방
	@Override
	public void adminMemberFKitchenDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminMemberFKitchenDelete", m_id);
		
	}

	//생활
	@Override
	public void adminMemberFLifeDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminMemberFLifeDelete", m_id);
		
	}
	//여기까지 해당 회원이 등록한 상품 목록 삭제

	//판매자 권한 박탈 경험 인원 삭제
	@Override
	public void adminSanctionDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteSanctions", m_id);
	}
	
	//카트에 상품 담은 회원 카트 데이터 삭제
	@Override
	public void adminCartDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteCart", m_id);
	}
	
	//회원 삭제
	@Override
	public void adminMemberDelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "adminMemberDelete", m_id);
	}

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

	//게시물 삭제 시 상품 이미지 AWS S3에서 삭제하기위해 이름 가져오기
	@Override
	public String imgNameSearch(int p_no2) throws Exception {
		String imgNameSearch = sqlSession.selectOne(NAMESPACE + "imgNameSearch", p_no2);
		return imgNameSearch;
	}

	//카테고리 선택 시 하위 카테고리 보기
	@Override
	public List<CategoryVo> otherCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> otherCategoryList = sqlSession.selectList(NAMESPACE + "otherCategoryList", cate_ref);
		return otherCategoryList;
	}
	
	//상품 등록한 이미지들 삭제위한 이름들 가져오기
	@Override
	public String[] getFileName(int p_no) {
		List<String> filenames = sqlSession.selectList(NAMESPACE + "productImgList", p_no);
		String arr[] = new String[filenames.size()];
		for(int i = 0; i<arr.length; i++) {
			arr[i] = filenames.get(i);
		}
		return arr;
	}

	//이미지 테이블 데이터 삭제
	@Override
	public void productImgDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "productImgDelete", p_no);
	}

	@Override
	public List<QandAVo> QA_UDList() throws Exception {
		List<QandAVo> QA_UDList = sqlSession.selectList(NAMESPACE + "QA_UDList");
		return QA_UDList;
	}

	@Override
	public List<QACateVo> QACategory() throws Exception {
		List<QACateVo> QACategory = sqlSession.selectList(NAMESPACE + "QACategory");
		return QACategory;
	}

	@Override
	public List<QACateVo> firstQACategory() throws Exception {
		List<QACateVo> firstQACategory = sqlSession.selectList(NAMESPACE + "firstQACategory");
		return firstQACategory;
	}

	@Override
	public List<QACateVo> otherQACategory(String qa_cate_no) throws Exception {
		List<QACateVo> otherQACategory = sqlSession.selectList(NAMESPACE + "otherQACategory", qa_cate_no);
		return otherQACategory;
	}

	@Override
	public void qaInsert(QandAVo qandAVo) throws Exception {
		sqlSession.insert(NAMESPACE + "qaInsert", qandAVo);
	}

	@Override
	public List<InquiryVo> inquiryList() throws Exception {
		List<InquiryVo> inquiryList = sqlSession.selectList(NAMESPACE + "inquiryList");
		return inquiryList;
	}

	@Override
	public InquiryVo detailInquiry(int inquiry_no) throws Exception {
		InquiryVo detailInquiry = sqlSession.selectOne(NAMESPACE + "detailInquiry", inquiry_no);
		return detailInquiry;
	}

	@Override
	public void deleteInquiry(int inquiry_no) throws Exception {
		sqlSession.delete(NAMESPACE + "inquiryDelete", inquiry_no);
	}

}
