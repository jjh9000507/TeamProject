package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

public interface PageService {
	// 더보기 버튼
	public List<ProductVo> moreList(int startNum) throws Exception;
	
	// 검색
	public List<ProductVo> search(String searchName) throws Exception;
	
	// 메인 카테고리 뿌려주기
	public List<CategoryVo> mainCategories(int distinct_num) throws Exception; 
}
