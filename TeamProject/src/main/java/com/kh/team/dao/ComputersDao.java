package com.kh.team.dao;

import java.util.List;


import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;




public interface ComputersDao {
	//컴퓨터 제품 리스트
	public List<ComputerVo> list(String cate_no) throws Exception;
	//컴퓨터 제품 리스트 체크박스이용
	public List<ComputerVo> listArray(String[] checkList) throws Exception;
	//컴퓨터 결과내 검색
	public List<ComputerVo> listSearch(String c_com_name, String[] confirmList) throws Exception;
	//컴퓨터 결과내 가격대 검색
	public List<ComputerVo> listSearchPrice(int firstPrice,int lastPrice, String[] confirmList) throws Exception;
	
	//구매하기 폼에 카테고리 정보 구현
	public String[] buyCategoryInfoGet(String c_com_cate_no) throws Exception;
	//카테고리 정보
	public List<CategoryVo> categoryInfo(String cate_no) throws Exception;
	
	//카테고리 정보 체크박스 이용
	public List<CategoryVo> categoryInfoArray(String[] checkList) throws Exception;
	
	//컴퓨터 제품 상세정보
	public ComputerVo detailComputerInfo(int p_no) throws Exception;
	//컴퓨터 제품 구매 폼
	public ComputerVo buyComputerProduct(int p_no) throws Exception;
}
