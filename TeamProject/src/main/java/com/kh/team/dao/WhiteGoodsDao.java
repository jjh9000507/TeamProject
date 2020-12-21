package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.WhitegoodsVo;

public interface WhiteGoodsDao {
	public List<WhitegoodsVo> list(String cate_no) throws Exception;
	public void insertWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception;
	public void updateWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception;
	public void deleteWhiteGoods(int p_no, String p_seller) throws Exception;
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception;
	public WhitegoodsVo detailWhitegoods(int p_no) throws Exception;
}
