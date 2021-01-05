package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

public interface PageDao {
	public void insert() throws Exception;
	
	// 더보기 버튼
	public List<ProductVo> moreList(int startNum) throws Exception;
	
	// 검색 
	public List<ProductVo> search(String searchName) throws Exception;
	
	// 메인 카테고리 뿌려주기
	public List<CategoryVo> mainCatagories(int distinct_num) throws Exception;
	
	
}
