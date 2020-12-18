package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.WhitegoodsVo;

public interface WhiteGoodsDao {
	public List<WhitegoodsVo> list() throws Exception;
	public void insertWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception;
	public void updateWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception;
	public void deleteWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception;
}
