package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.WhitegoodsDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.WhitegoodsVo;

@Service
public class WhitegoodsServiceImpl implements WhitegoodsService {

	@Inject
	private WhitegoodsDao whitegoodsDao;
	
	@Override
	public List<WhitegoodsVo> getWhitegoodsList(String w_cate_no) throws Exception {
		List<WhitegoodsVo> getWhitegoodsList = whitegoodsDao.getWhitegoodsList(w_cate_no);
		return getWhitegoodsList;
	}

	@Override
	public void insertWhitegoods(WhitegoodsVo whitegoodsVo) throws Exception {
		whitegoodsDao.insertWhitegoods(whitegoodsVo);
	}

	@Override
	public void updateWhitegoods(WhitegoodsVo whitegoodsVo) throws Exception {
		whitegoodsDao.updateWhitegoods(whitegoodsVo);
	}

	@Override
	public void deleteWhitegoods(int w_no, String w_seller) throws Exception {
		whitegoodsDao.deleteWhitegoods(w_no, w_seller);
	}

	@Override
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> getCategoryList = whitegoodsDao.getCategoryList(cate_ref);
		return getCategoryList;
	}

	@Override
	public WhitegoodsVo detailWhitegoods(int w_no) throws Exception {
		WhitegoodsVo detailWhitegoods = whitegoodsDao.detailWhitegoods(w_no);
		return detailWhitegoods;
	}

}
