package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.ProductVo;

public interface PageService {
	// 더보기 버튼
	public List<ProductVo> moreList(int startNum) throws Exception;
	
	// 검색
	public List<ProductVo> search(String searchName) throws Exception;
}
