package com.kh.team.dao;

import java.util.List;


import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;




public interface ComputersDao {
	//컴퓨터 제품 리스트
	public List<ComputerVo> list(String cate_no) throws Exception;
	//카테고리 정보
	public List<CategoryVo> categoryInfo(String cate_no) throws Exception;
	//컴퓨터 제품 상세정보
	public ComputerVo detailComputerInfo(int p_no) throws Exception;
}
