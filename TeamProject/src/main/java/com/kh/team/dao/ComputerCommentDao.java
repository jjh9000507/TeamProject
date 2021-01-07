package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ProductExplainVo;

public interface ComputerCommentDao {
	//구매후기 목록
	public List<ComputerCommentVo> getCommentList(int p_no) throws Exception;
	//상품설명 목록
	public List<ProductExplainVo> getInquireList(int p_no) throws Exception;
}
