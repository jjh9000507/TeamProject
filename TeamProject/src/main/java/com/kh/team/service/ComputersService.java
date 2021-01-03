package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

public interface ComputersService {
		//컴퓨터 제품 리스트
		public List<ComputerVo> list(String cate_no) throws Exception;
		//컴퓨터 제품 리스트 체크박스이용
		public List<ComputerVo> listArray(String[] checkList) throws Exception;
		

		//카테고리 정보
		public List<CategoryVo> categoryInfo(String cate_no) throws Exception;
		//카테고리 정보
		public List<CategoryVo> categoryInfoArray(String[] checkList) throws Exception;
		
		//컴퓨터 제품 상세정보
		public ComputerVo detailComputerInfo(int p_no) throws Exception;
}
