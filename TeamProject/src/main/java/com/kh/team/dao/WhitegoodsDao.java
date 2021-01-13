package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.WhitegoodsVo;

public interface WhitegoodsDao {
	public List<WhitegoodsVo> getWhitegoodsList(String w_cate_no) throws Exception;
	public void updateWhitegoods(WhitegoodsVo whitegoodsVo) throws Exception;
	public void deleteWhitegoods(int w_no) throws Exception;
	public List<CategoryVo> getFirstCategoryList(String cate_ref) throws Exception;
	public WhitegoodsVo detailWhitegoods(int w_no) throws Exception;
	public void userPAlldelete(String m_id) throws Exception;
	public List<String> productImgList(int p_no) throws Exception;
	public void productImgDelete(int p_no) throws Exception;
	public void readUpdate(int w_no) throws Exception;
	public void imgInsert(int p_no, String img_name) throws Exception;
}
