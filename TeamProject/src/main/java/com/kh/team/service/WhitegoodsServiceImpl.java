package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.WhiteGoodsDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.WhitegoodsVo;

@Service
public class WhitegoodsServiceImpl implements WhitegoodsService {

	@Inject
	private WhiteGoodsDao whiteGoodsDao;
	
	@Override
	public List<WhitegoodsVo> getWhiteGoodsList(String cate_no) throws Exception {
		List<WhitegoodsVo> getWhiteGoodsList = whiteGoodsDao.list(cate_no);
		List<CategoryVo> getCategoryList = whiteGoodsDao.getCategoryList(cate_no);
		return getWhiteGoodsList;
	}

	@Override
	public void insertWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception {
		whiteGoodsDao.insertWhiteGoods(whiteGoodsVo);
	}

	@Override
	public void updateWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception {
		whiteGoodsDao.updateWhiteGoods(whiteGoodsVo);
	}

	@Override
	public void deleteWhiteGoods(int p_no, String p_seller) throws Exception {
		whiteGoodsDao.deleteWhiteGoods(p_no, p_seller);
	}

	@Override
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> getCategoryList = whiteGoodsDao.getCategoryList(cate_ref);
		return getCategoryList;
	}

	@Override
	public WhitegoodsVo detailWhitegoods(int p_no) throws Exception {
		WhitegoodsVo detailWhitegoods = whiteGoodsDao.detailWhitegoods(p_no);
		return detailWhitegoods;
	}

}
