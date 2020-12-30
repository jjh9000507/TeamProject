package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.ProductVo;

public interface PageDao {
	public void insert() throws Exception;
	
	// 더보기 버튼
	public List<ProductVo> moreList(int startNum) throws Exception;
	
	// 검색 
	public List<ProductVo> search(String searchName) throws Exception;
	
	
}
