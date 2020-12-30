package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.WhitegoodsVo;

public interface WhitegoodsService {
	public List<WhitegoodsVo> getWhitegoodsList(String w_cate_no) throws Exception;
	public void insertWhitegoods(WhitegoodsVo whitegoodsVo) throws Exception;
	public void updateWhitegoods(WhitegoodsVo whitegoodsVo) throws Exception;
	public void deleteWhitegoods(int w_no, String w_seller) throws Exception;
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception;
	public WhitegoodsVo detailWhitegoods(int w_no) throws Exception;
}
