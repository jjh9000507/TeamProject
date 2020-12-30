package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;

public interface SellProductService {
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception;
	public void sellerReg(String m_id) throws Exception;
	public List<MemberVo> sellerList() throws Exception;
	public void rollbackSeller(String m_id) throws Exception;
}
