package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

public interface PageDao {
	
	// 더보기 버튼
	public List<ProductVo> moreList(int startNum) throws Exception;
	
	// 검색 
	public List<ProductVo> search(String searchName) throws Exception;
	
	// 메인 카테고리 뿌려주기
	public List<CategoryVo> mainCatagories(int distinct_num) throws Exception;
	
	// 등록한 상품 주소 받아오기
	public List<AuctionAddressVo> addrList() throws Exception;
	
}
